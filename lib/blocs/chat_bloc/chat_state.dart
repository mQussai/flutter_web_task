import 'package:flutter_task/models/message_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Message> messages;
  ChatLoaded({required this.messages});
}
