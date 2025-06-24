import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
          'Notifications',
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
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFF2F3336), width: 0.5),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFF1DA1F2),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[500],
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Mentions'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAllNotifications(),
                _buildMentions(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllNotifications() {
    final notifications = [
      {
        'type': 'like',
        'user': 'Elon Musk',
        'username': 'elonmusk',
        'action': 'liked your Tweet',
        'time': DateTime.now().subtract(const Duration(minutes: 30)),
        'content': 'Great insights on AI development!',
        'avatar': 'https://ui-avatars.com/api/?name=Elon+Musk&background=008080&color=fff&size=150',
      },
      {
        'type': 'retweet',
        'user': 'Bill Gates',
        'username': 'billgates',
        'action': 'retweeted your Tweet',
        'time': DateTime.now().subtract(const Duration(hours: 2)),
        'content': 'The future of renewable energy looks promising.',
        'avatar': 'https://ui-avatars.com/api/?name=Bill+Gates&background=FF6B6B&color=fff&size=150',
      },
      {
        'type': 'follow',
        'user': 'Tim Cook',
        'username': 'tim_cook',
        'action': 'followed you',
        'time': DateTime.now().subtract(const Duration(hours: 5)),
        'content': '',
        'avatar': 'https://ui-avatars.com/api/?name=Tim+Cook&background=45B7D1&color=fff&size=150',
      },
      {
        'type': 'reply',
        'user': 'Sundar Pichai',
        'username': 'sundarpichai',
        'action': 'replied to your Tweet',
        'time': DateTime.now().subtract(const Duration(hours: 12)),
        'content': 'Absolutely agree! Innovation drives progress.',
        'avatar': 'https://ui-avatars.com/api/?name=Sundar+Pichai&background=4ECDC4&color=fff&size=150',
      },
      {
        'type': 'like',
        'user': 'Mark Zuckerberg',
        'username': 'zuck',
        'action': 'liked your Tweet',
        'time': DateTime.now().subtract(const Duration(days: 1)),
        'content': 'Virtual reality will change everything.',
        'avatar': 'https://ui-avatars.com/api/?name=Mark+Zuckerberg&background=F7DC6F&color=000&size=150',
      },
    ];

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return AnimatedContainer(
          duration: Duration(milliseconds: 200 + (index * 50)),
          curve: Curves.easeInOut,
          child: _buildNotificationItem(notification),
        );
      },
    );
  }

  Widget _buildMentions() {
    final mentions = [
      {
        'type': 'mention',
        'user': 'Elon Musk',
        'username': 'elonmusk',
        'action': 'mentioned you in a Tweet',
        'time': DateTime.now().subtract(const Duration(hours: 3)),
        'content': '@you Great work on the Flutter project! 🚀',
        'avatar': 'https://ui-avatars.com/api/?name=Elon+Musk&background=008080&color=fff&size=150',
      },
      {
        'type': 'mention',
        'user': 'Bill Gates',
        'username': 'billgates',
        'action': 'mentioned you in a Tweet',
        'time': DateTime.now().subtract(const Duration(days: 2)),
        'content': 'Thanks @you for sharing this important research.',
        'avatar': 'https://ui-avatars.com/api/?name=Bill+Gates&background=FF6B6B&color=fff&size=150',
      },
    ];

    return ListView.builder(
      itemCount: mentions.length,
      itemBuilder: (context, index) {
        final mention = mentions[index];
        return AnimatedContainer(
          duration: Duration(milliseconds: 200 + (index * 50)),
          curve: Curves.easeInOut,
          child: _buildNotificationItem(mention),
        );
      },
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    IconData getNotificationIcon(String type) {
      switch (type) {
        case 'like':
          return Icons.favorite;
        case 'retweet':
          return Icons.repeat;
        case 'follow':
          return Icons.person_add;
        case 'reply':
          return Icons.chat_bubble;
        case 'mention':
          return Icons.alternate_email;
        default:
          return Icons.notifications;
      }
    }

    Color getNotificationColor(String type) {
      switch (type) {
        case 'like':
          return Colors.red;
        case 'retweet':
          return Colors.green;
        case 'follow':
          return Colors.blue;
        case 'reply':
          return Colors.grey;
        case 'mention':
          return const Color(0xFF1DA1F2);
        default:
          return Colors.grey;
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF2F3336), width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: Icon(
              getNotificationIcon(notification['type']),
              color: getNotificationColor(notification['type']),
              size: 24,
            ),
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey[800],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                notification['avatar'],
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
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: notification['user'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' ${notification['action']}',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  timeago.format(notification['time']),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 13,
                  ),
                ),
                if (notification['content'].isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[800]!),
                    ),
                    child: Text(
                      notification['content'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (notification['type'] == 'follow')
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(80, 32),
              ),
              child: const Text(
                'Follow',
                style: TextStyle(fontSize: 13),
              ),
            ),
        ],
      ),
    );
  }
} 