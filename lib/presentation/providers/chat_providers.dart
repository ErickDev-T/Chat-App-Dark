import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';

class ChatProviders extends ChangeNotifier {
  final getYesNoAnswer = GetYesNoAnswer();
  final chatScrollCotroller = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola we', fromWho: FromWho.me),
    (Message(text: 'Ya estas aqui?', fromWho: FromWho.me))
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith("?")) {
      herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollCotroller.animateTo(chatScrollCotroller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
