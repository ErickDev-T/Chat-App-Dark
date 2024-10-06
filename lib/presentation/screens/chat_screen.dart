import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_providers.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage('https://cdn.asi.do/dogpvohupaajm7sbwwk9n8947hai'),
          ),
        ),
        title: const Text('Mi amor'),
        centerTitle: true,
      ),
      body: _Chatview(),
    );
  }
}

class _Chatview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final charProviders = context.watch<ChatProviders>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: charProviders.chatScrollCotroller,
                itemCount: charProviders.messageList.length,
                itemBuilder: (context, index) {
                  final message = charProviders.messageList[index];
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            //caja de texto de msg
            MessageFieldBox(
              onValue: (value) => charProviders.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
