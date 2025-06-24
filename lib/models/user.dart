class User {
  final String id;
  final String username;
  final String displayName;
  final String bio;
  final String profileImageUrl;
  final String? bannerImageUrl;
  final int followersCount;
  final int followingCount;
  final int tweetsCount;
  final DateTime joinDate;
  final bool isFollowing;
  final bool isVerified;

  User({
    required this.id,
    required this.username,
    required this.displayName,
    required this.bio,
    required this.profileImageUrl,
    this.bannerImageUrl,
    this.followersCount = 0,
    this.followingCount = 0,
    this.tweetsCount = 0,
    required this.joinDate,
    this.isFollowing = false,
    this.isVerified = false,
  });

  User copyWith({
    String? id,
    String? username,
    String? displayName,
    String? bio,
    String? profileImageUrl,
    String? bannerImageUrl,
    int? followersCount,
    int? followingCount,
    int? tweetsCount,
    DateTime? joinDate,
    bool? isFollowing,
    bool? isVerified,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      bio: bio ?? this.bio,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      bannerImageUrl: bannerImageUrl ?? this.bannerImageUrl,
      followersCount: followersCount ?? this.followersCount,
      followingCount: followingCount ?? this.followingCount,
      tweetsCount: tweetsCount ?? this.tweetsCount,
      joinDate: joinDate ?? this.joinDate,
      isFollowing: isFollowing ?? this.isFollowing,
      isVerified: isVerified ?? this.isVerified,
    );
  }
} 