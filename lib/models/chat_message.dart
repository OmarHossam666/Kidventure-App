class ChatMessage {
  final String role;
  late String? content;

  ChatMessage({
    required this.role,
    required this.content,
  });
  bool get isUser => role == 'user';
}
