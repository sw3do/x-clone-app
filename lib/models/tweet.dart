class Tweet {
  final String id;
  final String userId;
  final String username;
  final String displayName;
  final String profileImageUrl;
  final String content;
  final DateTime timestamp;
  final int likes;
  final int retweets;
  final int replies;
  final bool isLiked;
  final bool isRetweeted;
  final String? imageUrl;

  Tweet({
    required this.id,
    required this.userId,
    required this.username,
    required this.displayName,
    required this.profileImageUrl,
    required this.content,
    required this.timestamp,
    this.likes = 0,
    this.retweets = 0,
    this.replies = 0,
    this.isLiked = false,
    this.isRetweeted = false,
    this.imageUrl,
  });

  Tweet copyWith({
    String? id,
    String? userId,
    String? username,
    String? displayName,
    String? profileImageUrl,
    String? content,
    DateTime? timestamp,
    int? likes,
    int? retweets,
    int? replies,
    bool? isLiked,
    bool? isRetweeted,
    String? imageUrl,
  }) {
    return Tweet(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      likes: likes ?? this.likes,
      retweets: retweets ?? this.retweets,
      replies: replies ?? this.replies,
      isLiked: isLiked ?? this.isLiked,
      isRetweeted: isRetweeted ?? this.isRetweeted,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
} 