import 'package:flutter/material.dart';
import 'package:kidventure/core/constants/app_colors.dart';
import 'package:lottie/lottie.dart';
import '../../models/chat_message.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message, this.isLoading = false});

  final ChatMessage message;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == 'user';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) _buildAvatar(),
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              decoration: BoxDecoration(
                color: isUser ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(isUser ? 20 : 0),
                  bottomRight: Radius.circular(isUser ? 0 : 20),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child:
                  isLoading && !isUser
                      ? _buildLoadingContent()
                      : Text(
                        message.content ?? "",
                        style: TextStyle(
                          color: isUser ? Colors.white : Colors.black,
                          fontSize: 18,
                        ),
                      ),
            ),
          ),
          if (isUser) _buildAvatar(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    final isUser = message.role == 'user';
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: CircleAvatar(
        backgroundColor: isUser ? AppColors.primary : const Color(0xFFFF9EAA),
        child: Text(isUser ? '👤' : '🤖'),
      ),
    );
  }

  Widget _buildLoadingContent() {
    return Lottie.asset(
      'assets/lotties/message_loading.json',
      width: 60,
      height: 40,
      fit: BoxFit.contain,
    );
  }
}
