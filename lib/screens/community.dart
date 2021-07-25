import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mjcoffee/services/chat_service.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class CommunityScreen extends StatelessWidget {
  final userId = ChatService.instance.client.state.user?.id as Object;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChannelsBloc(
        child: ChannelListView(
          filter: Filter.in_(
            'members',
            [userId], // current user is employee (role/permission)
          ),
          sort: [SortOption('last_message_at')],
          pagination: PaginationParams(
            limit: 30,
          ),
          channelWidget: ChannelPage(),
        ),
      ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChannelHeader(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: MessageListView(),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}
