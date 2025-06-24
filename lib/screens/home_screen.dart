import 'package:flutter/material.dart';
import 'dart:math';
import '../data/mock_data.dart';
import '../widgets/tweet_widget.dart';
import '../screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreenBody();
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
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
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {
        if (!mounted) return;
        _animationController.reset();
        _animationController.forward();
        await Future.delayed(const Duration(milliseconds: 1000));
      },
      backgroundColor: Colors.grey[900],
      color: const Color(0xFF1DA1F2),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: MockData.tweets.length,
        itemBuilder: (context, index) {
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
                  curve: Curves.easeOutBack,
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
                  curve: Curves.easeIn,
                ),
              ));

              final scaleAnimation = Tween<double>(
                begin: 0.8,
                end: 1.0,
              ).animate(CurvedAnimation(
                parent: _animationController,
                curve: Interval(
                  startTime,
                  endTime,
                  curve: Curves.elasticOut,
                ),
              ));

              return SlideTransition(
                position: slideAnimation,
                child: FadeTransition(
                  opacity: fadeAnimation,
                  child: ScaleTransition(
                    scale: scaleAnimation,
                    child: TweetWidget(
                      tweet: MockData.tweets[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                ProfileScreen(
                              user: MockData.getUserById(MockData.tweets[index].userId),
                            ),
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
} 