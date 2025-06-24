import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../models/tweet.dart';

class TweetWidget extends StatefulWidget {
  final Tweet tweet;
  final VoidCallback? onTap;

  const TweetWidget({
    super.key,
    required this.tweet,
    this.onTap,
  });

  @override
  State<TweetWidget> createState() => _TweetWidgetState();
}

class _TweetWidgetState extends State<TweetWidget>
    with TickerProviderStateMixin {
  late bool isLiked;
  late bool isRetweeted;
  late int likes;
  late int retweets;
  late AnimationController _likeAnimationController;
  late AnimationController _retweetAnimationController;
  late Animation<double> _likeAnimation;
  late Animation<double> _retweetAnimation;

  @override
  void initState() {
    super.initState();
    isLiked = widget.tweet.isLiked;
    isRetweeted = widget.tweet.isRetweeted;
    likes = widget.tweet.likes;
    retweets = widget.tweet.retweets;

    _likeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _retweetAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _likeAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _likeAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _retweetAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: _retweetAnimationController,
        curve: Curves.elasticOut,
      ),
    );
  }

  @override
  void dispose() {
    _likeAnimationController.dispose();
    _retweetAnimationController.dispose();
    super.dispose();
  }

  void _toggleLike() {
    if (!mounted) return;
    
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });

    if (isLiked && _likeAnimationController.status != AnimationStatus.forward) {
      _likeAnimationController.forward().then((_) {
        if (mounted) {
          _likeAnimationController.reverse();
        }
      });
    }
  }

  void _toggleRetweet() {
    if (!mounted) return;
    
    setState(() {
      isRetweeted = !isRetweeted;
      retweets += isRetweeted ? 1 : -1;
    });

    if (isRetweeted && _retweetAnimationController.status != AnimationStatus.forward) {
      _retweetAnimationController.forward().then((_) {
        if (mounted) {
          _retweetAnimationController.reverse();
        }
      });
    }
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF2F3336), width: 0.5),
        ),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[800],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.tweet.profileImageUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 40,
                        height: 40,
                        color: Colors.grey[800],
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[400],
                          size: 20,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.tweet.displayName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4),
                      AnimatedScale(
                        scale: 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          Icons.verified,
                          size: 16,
                          color: Colors.blue[400],
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '@${widget.tweet.username}',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '·',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        timeago.format(widget.tweet.timestamp),
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.tweet.content,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                  if (widget.tweet.imageUrl != null) ...[
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.tweet.imageUrl!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 200,
                            color: Colors.grey[800],
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.grey[400],
                              size: 48,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildActionButton(
                        icon: Icons.chat_bubble_outline,
                        count: widget.tweet.replies,
                        color: Colors.grey[500]!,
                        onPressed: () {},
                      ),
                      AnimatedBuilder(
                        animation: _retweetAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _retweetAnimation.value,
                            child: _buildActionButton(
                              icon: isRetweeted ? Icons.repeat : Icons.repeat,
                              count: retweets,
                              color: isRetweeted ? Colors.green : Colors.grey[500]!,
                              onPressed: _toggleRetweet,
                            ),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _likeAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _likeAnimation.value,
                            child: _buildActionButton(
                              icon: isLiked ? Icons.favorite : Icons.favorite_border,
                              count: likes,
                              color: isLiked ? Colors.red : Colors.grey[500]!,
                              onPressed: _toggleLike,
                            ),
                          );
                        },
                      ),
                      _buildActionButton(
                        icon: Icons.share_outlined,
                        count: 0,
                        color: Colors.grey[500]!,
                        onPressed: () {},
                        showCount: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required int count,
    required Color color,
    required VoidCallback onPressed,
    bool showCount = true,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: color,
            ),
            if (showCount && count > 0) ...[
              const SizedBox(width: 4),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  _formatNumber(count),
                  key: ValueKey(count),
                  style: TextStyle(
                    color: color,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
} 