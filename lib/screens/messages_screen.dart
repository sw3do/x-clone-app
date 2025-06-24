import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:math';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined, color: Colors.grey[500]),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.grey[500]),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search for people and groups',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _getMessages().length,
              itemBuilder: (context, index) {
                final message = _getMessages()[index];
                return AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    final startTime = min(index * 0.05, 0.8);
                    final endTime = min(startTime + 0.2, 1.0);

                    final slideAnimation = Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(
                        startTime,
                        endTime,
                        curve: Curves.easeInOut,
                      ),
                    ));

                    final fadeAnimation = Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(
                        startTime,
                        endTime,
                        curve: Curves.easeInOut,
                      ),
                    ));

                    return SlideTransition(
                      position: slideAnimation,
                      child: FadeTransition(
                        opacity: fadeAnimation,
                        child: _buildMessageItem(message),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1DA1F2),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  List<Map<String, dynamic>> _getMessages() {
    return [
      {
        'name': 'Elon Musk',
        'username': 'elonmusk',
        'avatar': 'https://ui-avatars.com/api/?name=Elon+Musk&background=008080&color=fff&size=150',
        'lastMessage': 'Great work on the Starship project! 🚀',
        'time': DateTime.now().subtract(const Duration(minutes: 15)),
        'isRead': false,
        'isOnline': true,
        'isVerified': true,
      },
      {
        'name': 'Bill Gates',
        'username': 'billgates',
        'avatar': 'https://ui-avatars.com/api/?name=Bill+Gates&background=FF6B6B&color=fff&size=150',
        'lastMessage': 'The climate summit was very productive.',
        'time': DateTime.now().subtract(const Duration(hours: 2)),
        'isRead': true,
        'isOnline': false,
        'isVerified': true,
      },
      {
        'name': 'Tim Cook',
        'username': 'tim_cook',
        'avatar': 'https://ui-avatars.com/api/?name=Tim+Cook&background=45B7D1&color=fff&size=150',
        'lastMessage': 'Looking forward to the next Apple event!',
        'time': DateTime.now().subtract(const Duration(hours: 5)),
        'isRead': true,
        'isOnline': true,
        'isVerified': true,
      },
      {
        'name': 'Sundar Pichai',
        'username': 'sundarpichai',
        'avatar': 'https://ui-avatars.com/api/?name=Sundar+Pichai&background=4ECDC4&color=fff&size=150',
        'lastMessage': 'AI developments are accelerating rapidly.',
        'time': DateTime.now().subtract(const Duration(days: 1)),
        'isRead': false,
        'isOnline': false,
        'isVerified': true,
      },
      {
        'name': 'Mark Zuckerberg',
        'username': 'zuck',
        'avatar': 'https://ui-avatars.com/api/?name=Mark+Zuckerberg&background=F7DC6F&color=000&size=150',
        'lastMessage': 'The metaverse is becoming more immersive.',
        'time': DateTime.now().subtract(const Duration(days: 2)),
        'isRead': true,
        'isOnline': true,
        'isVerified': true,
      },
      {
        'name': 'Flutter Team',
        'username': 'flutterdev',
        'avatar': 'https://ui-avatars.com/api/?name=Flutter+Team&background=02569B&color=fff&size=150',
        'lastMessage': 'New Flutter 3.5 update is now available!',
        'time': DateTime.now().subtract(const Duration(days: 3)),
        'isRead': true,
        'isOnline': false,
        'isVerified': false,
      },
    ];
  }

  Widget _buildMessageItem(Map<String, dynamic> message) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              name: message['name'],
              username: message['username'],
              avatar: message['avatar'],
              isVerified: message['isVerified'],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFF2F3336), width: 0.5),
          ),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[800],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      message['avatar'],
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person,
                          color: Colors.grey[400],
                          size: 24,
                        );
                      },
                    ),
                  ),
                ),
                if (message['isOnline'])
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        message['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: message['isRead'] 
                              ? FontWeight.normal 
                              : FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      if (message['isVerified']) ...[
                        const SizedBox(width: 4),
                        Icon(
                          Icons.verified,
                          color: Colors.blue[400],
                          size: 16,
                        ),
                      ],
                      const Spacer(),
                      Text(
                        timeago.format(message['time']),
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 13,
                        ),
                      ),
                      if (!message['isRead']) ...[
                        const SizedBox(width: 8),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFF1DA1F2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message['lastMessage'],
                    style: TextStyle(
                      color: message['isRead'] 
                          ? Colors.grey[500] 
                          : Colors.grey[300],
                      fontSize: 14,
                      fontWeight: message['isRead'] 
                          ? FontWeight.normal 
                          : FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String name;
  final String username;
  final String avatar;
  final bool isVerified;

  const ChatScreen({
    super.key,
    required this.name,
    required this.username,
    required this.avatar,
    required this.isVerified,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[800],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.avatar,
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      color: Colors.grey[400],
                      size: 16,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (widget.isVerified) ...[
                      const SizedBox(width: 4),
                      Icon(
                        Icons.verified,
                        color: Colors.blue[400],
                        size: 14,
                      ),
                    ],
                  ],
                ),
                Text(
                  '@${widget.username}',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.grey[500]),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Chat with ${widget.name}',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFF2F3336), width: 0.5),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _messageController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Start a new message',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: const Color(0xFF1DA1F2),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 