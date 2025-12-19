class ChatMessage {
  final String role;
  final String? content;

  ChatMessage({required this.role, this.content});
  bool get isUser => role == 'user';
}
