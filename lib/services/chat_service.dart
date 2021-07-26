import 'dart:math';

import 'package:mjcoffee/helpers/constants.dart';
import 'package:mjcoffee/helpers/is_debug.dart';
import 'package:mjcoffee/models/auth0_user.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatService {
  static final ChatService instance = ChatService._internal();
  factory ChatService() => instance;
  ChatService._internal();

  final StreamChatClient client = StreamChatClient(
    STREAM_API_KEY,
    logLevel: isInDebugMode ? Level.INFO : Level.OFF,
  );

  Future<Auth0User?> connectUser(Auth0User? user) async {
    try {
      if (user == null) {
        throw Exception('User was not received');
      }
      await client.connectUser(
        User(
          id: user.id,
          extraData: {
            'image': user.picture,
            'name': user.name,
          },
        ),
        // client.devToken(user.id).rawValue,
        user.streamChatUserToken,
      );
      return user;
    } catch (e, s) {
      print('ConnectUser $e, $s');
    }
  }

  String? _currentChannelId;
  String? _currentEmployeeId;

  Future<Channel> createSupportChat(List<String> availableAgents) async {
    // skip if the chat is still open with current employeeId
    if (_currentEmployeeId == null) {
      final _random = new Random();
      final randomNumber = 0 + _random.nextInt(availableAgents.length - 0);
      final String employeeId =
          availableAgents[randomNumber].split('|').join('');
      _currentEmployeeId = employeeId;
    }

    final channel = client.channel(
      'support',
      id: _currentChannelId ?? null,
      extraData: {
        'name': 'MJCoffee Support',
        'members': [
          _currentEmployeeId,
          client.state.user!.id,
        ]
      },
    );
    await channel.watch();
    _currentChannelId = channel.id;
    return channel;
  }
}
