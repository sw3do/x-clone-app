import 'package:flutter/material.dart';

class ComposeTweetScreen extends StatefulWidget {
  const ComposeTweetScreen({super.key});

  @override
  State<ComposeTweetScreen> createState() => _ComposeTweetScreenState();
}

class _ComposeTweetScreenState extends State<ComposeTweetScreen> {
  final TextEditingController _textController = TextEditingController();
  final int maxLength = 280;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  bool get canTweet => _textController.text.trim().isNotEmpty;

  void _postTweet() {
    if (canTweet && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Tweet posted!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: canTweet ? _postTweet : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1DA1F2),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                disabledBackgroundColor: const Color(0xFF1DA1F2).withValues(alpha: 0.5),
              ),
              child: const Text(
                'Tweet',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[800],
                  child: Icon(
                    Icons.person,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _textController,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        maxLines: null,
                        maxLength: maxLength,
                        decoration: const InputDecoration(
                          hintText: "What's happening?",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        onChanged: (value) {
                          if (mounted) {
                            setState(() {});
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.image_outlined,
                            color: Colors.blue[400],
                            size: 24,
                          ),
                          const SizedBox(width: 20),
                          Icon(
                            Icons.gif_box_outlined,
                            color: Colors.blue[400],
                            size: 24,
                          ),
                          const SizedBox(width: 20),
                          Icon(
                            Icons.poll_outlined,
                            color: Colors.blue[400],
                            size: 24,
                          ),
                          const SizedBox(width: 20),
                          Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.blue[400],
                            size: 24,
                          ),
                          const SizedBox(width: 20),
                          Icon(
                            Icons.schedule_outlined,
                            color: Colors.blue[400],
                            size: 24,
                          ),
                          const Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _textController.text.length > maxLength * 0.8
                                    ? Colors.red
                                    : Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularProgressIndicator(
                                  value: _textController.text.length / maxLength,
                                  strokeWidth: 2,
                                  backgroundColor: Colors.grey[800],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    _textController.text.length > maxLength * 0.8
                                        ? Colors.red
                                        : const Color(0xFF1DA1F2),
                                  ),
                                ),
                                if (_textController.text.length > maxLength * 0.8)
                                  Text(
                                    '${maxLength - _textController.text.length}',
                                    style: TextStyle(
                                      color: _textController.text.length > maxLength
                                          ? Colors.red
                                          : Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 