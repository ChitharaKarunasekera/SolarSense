import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/features/core/screens/chatbot/chat_interface.dart';

import '../dashboard/widgets/appbar.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return const Scaffold(
      appBar: DashboardAppbar(),
      body: ChatInterface(),
    );
  }
}