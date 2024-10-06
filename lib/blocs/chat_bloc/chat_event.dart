import '../../models/message_model.dart';

abstract class ChatEvent {}

class ConnectWebSocket extends ChatEvent {
  final String url;
  ConnectWebSocket(this.url);
}

class ReceiveMessage extends ChatEvent {
  final String msg;
  ReceiveMessage(this.msg);
}

class SendMessage extends ChatEvent {
  final String msg;
  SendMessage(this.msg);
}
