import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel _channel;

  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
  }

  Stream get stream => _channel.stream;
  void sendMessage(String msg) {
    _channel.sink.add(msg);
  }

  void dispose() {
    _channel.sink.close();
  }
}
