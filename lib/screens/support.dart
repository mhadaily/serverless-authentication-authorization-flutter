import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  String? availableCustomerServiceId;

  @override
  void initState() {
    super.initState();

    /// -----------------------------------
    ///  getProfile from auth service
    /// -----------------------------------

    /// -----------------------------------
    /// get an available customer service agent
    /// -----------------------------------
  }

  @override
  Widget build(BuildContext context) {
    return availableCustomerServiceId == null
        ? Center(
            child: Text('You are int he queue!, please wait...'),
          )

        /// -----------------------------------
        /// implement chat
        /// -----------------------------------
        : Container();
  }
}
