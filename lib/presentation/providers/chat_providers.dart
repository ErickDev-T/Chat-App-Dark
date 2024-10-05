import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProviders extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola we', fromWho: FromWho.me),
    (Message(text: 'Ya estas aqui?', fromWho: FromWho.me))
  ];

  Future<void> sendMessage(String text) async {
    //TODO: Imprementar metodo
  }
}
