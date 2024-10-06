class Message {
  final String content;
  final String sender;

  Message({required this.content, required this.sender});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(content: json['content'], sender: json['sender']);
  }
}
