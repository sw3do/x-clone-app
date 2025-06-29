import '../models/user.dart';
import '../models/tweet.dart';

class MockData {
  static final List<User> users = [
    User(
      id: '1',
      username: 'elonmusk',
      displayName: 'Elon Musk',
      bio: 'CEO of Tesla, SpaceX, and Twitter (X)',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Elon+Musk&background=008080&color=fff&size=150',
      bannerImageUrl: 'https://picsum.photos/600/200?random=1',
      followersCount: 150000000,
      followingCount: 200,
      tweetsCount: 25000,
      joinDate: DateTime(2009, 6, 2),
      isVerified: true,
    ),
    User(
      id: '2',
      username: 'billgates',
      displayName: 'Bill Gates',
      bio: 'Co-founder of Microsoft. Philanthropist.',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Bill+Gates&background=FF6B6B&color=fff&size=150',
      followersCount: 60000000,
      followingCount: 300,
      tweetsCount: 3500,
      joinDate: DateTime(2009, 6, 11),
      isVerified: true,
    ),
    User(
      id: '3',
      username: 'sundarpichai',
      displayName: 'Sundar Pichai',
      bio: 'CEO of Google and Alphabet',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Sundar+Pichai&background=4ECDC4&color=fff&size=150',
      followersCount: 5000000,
      followingCount: 150,
      tweetsCount: 800,
      joinDate: DateTime(2011, 3, 23),
      isVerified: true,
    ),
    User(
      id: '4',
      username: 'tim_cook',
      displayName: 'Tim Cook',
      bio: 'CEO of Apple',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Tim+Cook&background=45B7D1&color=fff&size=150',
      followersCount: 15000000,
      followingCount: 80,
      tweetsCount: 2200,
      joinDate: DateTime(2011, 5, 25),
      isVerified: true,
    ),
    User(
      id: '5',
      username: 'zuck',
      displayName: 'Mark Zuckerberg',
      bio: 'Founder and CEO of Meta',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Mark+Zuckerberg&background=F7DC6F&color=000&size=150',
      followersCount: 8000000,
      followingCount: 120,
      tweetsCount: 450,
      joinDate: DateTime(2012, 2, 1),
      isVerified: true,
    ),
  ];

  static final List<Tweet> tweets = [
    Tweet(
      id: '1',
      userId: '1',
      username: 'elonmusk',
      displayName: 'Elon Musk',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Elon+Musk&background=008080&color=fff&size=150',
      content: 'Mars needs memes! 🚀 Working on Starship updates. Next test flight coming soon.',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      likes: 125000,
      retweets: 35000,
      replies: 8500,
      imageUrl: 'https://picsum.photos/400/300?random=1',
    ),
    Tweet(
      id: '2',
      userId: '2',
      username: 'billgates',
      displayName: 'Bill Gates',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Bill+Gates&background=FF6B6B&color=fff&size=150',
      content: 'Excited about the progress in renewable energy! Solar and wind power are becoming more affordable every year. This is crucial for fighting climate change.',
      timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      likes: 85000,
      retweets: 22000,
      replies: 3200,
    ),
    Tweet(
      id: '3',
      userId: '3',
      username: 'sundarpichai',
      displayName: 'Sundar Pichai',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Sundar+Pichai&background=4ECDC4&color=fff&size=150',
      content: 'AI is transforming how we work, learn, and create. At Google, we\'re committed to developing AI responsibly and making it helpful for everyone.',
      timestamp: DateTime.now().subtract(const Duration(hours: 8)),
      likes: 45000,
      retweets: 12000,
      replies: 2100,
      imageUrl: 'https://picsum.photos/400/300?random=2',
    ),
    Tweet(
      id: '4',
      userId: '4',
      username: 'tim_cook',
      displayName: 'Tim Cook',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Tim+Cook&background=45B7D1&color=fff&size=150',
      content: 'Privacy is a fundamental human right. At Apple, we believe your personal information belongs to you, not to us or anyone else.',
      timestamp: DateTime.now().subtract(const Duration(hours: 12)),
      likes: 95000,
      retweets: 28000,
      replies: 5500,
    ),
    Tweet(
      id: '5',
      userId: '5',
      username: 'zuck',
      displayName: 'Mark Zuckerberg',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Mark+Zuckerberg&background=F7DC6F&color=000&size=150',
      content: 'Building the metaverse is about creating new ways for people to connect. Virtual reality will change how we work, play, and socialize.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      likes: 38000,
      retweets: 8500,
      replies: 1800,
      imageUrl: 'https://picsum.photos/400/300?random=3',
    ),
    Tweet(
      id: '6',
      userId: '1',
      username: 'elonmusk',
      displayName: 'Elon Musk',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Elon+Musk&background=008080&color=fff&size=150',
      content: 'Tesla Cybertruck production update: We\'re scaling up! Excited to get these trucks to customers.',
      timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 6)),
      likes: 210000,
      retweets: 55000,
      replies: 12000,
    ),
    Tweet(
      id: '7',
      userId: '2',
      username: 'billgates',
      displayName: 'Bill Gates',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Bill+Gates&background=FF6B6B&color=fff&size=150',
      content: 'Reading is one of my favorite ways to learn. Here are 5 books I recommend for understanding global health challenges.',
      timestamp: DateTime.now().subtract(const Duration(days: 2)),
      likes: 65000,
      retweets: 18000,
      replies: 2800,
    ),
    Tweet(
      id: '8',
      userId: '3',
      username: 'sundarpichai',
      displayName: 'Sundar Pichai',
      profileImageUrl: 'https://ui-avatars.com/api/?name=Sundar+Pichai&background=4ECDC4&color=fff&size=150',
      content: 'Congratulations to all the developers at Google I/O! Amazing innovations in Android, AI, and cloud computing.',
      timestamp: DateTime.now().subtract(const Duration(days: 3)),
      likes: 32000,
      retweets: 8200,
      replies: 1500,
    ),
  ];

  static User getUserById(String userId) {
    return users.firstWhere((user) => user.id == userId);
  }

  static List<Tweet> getTweetsByUserId(String userId) {
    return tweets.where((tweet) => tweet.userId == userId).toList();
  }
} 