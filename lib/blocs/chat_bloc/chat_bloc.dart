import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/services/web_socket_service.dart';

import '../../models/message_model.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final WebSocketService _webSocketService;
  List<String> msgs = [];

  ChatBloc(this._webSocketService) : super(ChatInitial()) {
    on<ConnectWebSocket>(_onConnectWebSocket);
    on<SendMessage>(_onSendMessage);
    on<ReceiveMessage>(_onReceiveMessage);
  }

  void _onConnectWebSocket(ConnectWebSocket event, Emitter<ChatState> emit) {
    _webSocketService.connect(event.url);
    _webSocketService.stream.listen((data) {
      print(data);
      add(ReceiveMessage(data));
    });
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) {
    _webSocketService.sendMessage(event.msg);
  }

  void _onReceiveMessage(ReceiveMessage event, Emitter<ChatState> emit) {
    msgs.add(event.msg);
    emit(ChatLoaded(
        messages: msgs.reversed
            .map((e) => Message(
                  content: e,
                  sender: 'Server',
                ))
            .toList()));
  }

  @override
  Future<void> close() {
    _webSocketService.dispose();
    return super.close();
  }
}
