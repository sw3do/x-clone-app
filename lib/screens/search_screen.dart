import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/tweet_widget.dart';
import '../models/user.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  bool _isSearching = false;
  List<User> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    if (query.isEmpty) {
      setState(() {
        _isSearching = false;
        _searchResults = [];
      });
      return;
    }

    setState(() {
      _isSearching = true;
      _searchResults = MockData.users
          .where((user) =>
              user.displayName.toLowerCase().contains(query.toLowerCase()) ||
              user.username.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search Twitter',
              hintStyle: TextStyle(color: Colors.grey[500]),
              prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
            ),
            onChanged: _performSearch,
          ),
        ),
      ),
      body: Column(
        children: [
          if (!_isSearching) ...[
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
                  Tab(text: 'For you'),
                  Tab(text: 'Trending'),
                  Tab(text: 'News'),
                  Tab(text: 'Sports'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildForYouTab(),
                  _buildTrendingTab(),
                  _buildNewsTab(),
                  _buildSportsTab(),
                ],
              ),
            ),
          ] else ...[
            Expanded(
              child: _searchResults.isEmpty
                  ? Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final user = _searchResults[index];
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 200 + (index * 50)),
                          curve: Curves.easeInOut,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[800],
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  user.profileImageUrl,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.person,
                                      color: Colors.grey[400],
                                    );
                                  },
                                ),
                              ),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  user.displayName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (user.isVerified) ...[
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.verified,
                                    color: Colors.blue[400],
                                    size: 16,
                                  ),
                                ],
                              ],
                            ),
                            subtitle: Text(
                              '@${user.username}',
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text('Follow'),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildForYouTab() {
    return ListView.builder(
      itemCount: MockData.tweets.length,
      itemBuilder: (context, index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200 + (index * 50)),
          curve: Curves.easeInOut,
          child: TweetWidget(tweet: MockData.tweets[index]),
        );
      },
    );
  }

  Widget _buildTrendingTab() {
    final trendingTopics = [
      {'topic': '#FlutterDev', 'tweets': '125K Tweets'},
      {'topic': '#TechNews', 'tweets': '89K Tweets'},
      {'topic': '#AI', 'tweets': '245K Tweets'},
      {'topic': '#Programming', 'tweets': '67K Tweets'},
      {'topic': '#Mobile', 'tweets': '34K Tweets'},
    ];

    return ListView.builder(
      itemCount: trendingTopics.length,
      itemBuilder: (context, index) {
        final topic = trendingTopics[index];
        return AnimatedContainer(
          duration: Duration(milliseconds: 200 + (index * 100)),
          curve: Curves.easeInOut,
          child: ListTile(
            title: Text(
              topic['topic']!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              topic['tweets']!,
              style: TextStyle(color: Colors.grey[500]),
            ),
            trailing: Icon(Icons.trending_up, color: Colors.grey[500]),
          ),
        );
      },
    );
  }

  Widget _buildNewsTab() {
    final newsItems = [
      {
        'title': 'Tech Companies Report Strong Q4 Earnings',
        'source': 'Tech News • 2h ago'
      },
      {
        'title': 'New AI Breakthrough Announced',
        'source': 'Science Daily • 4h ago'
      },
      {
        'title': 'Mobile App Usage Reaches All-Time High',
        'source': 'Mobile Times • 6h ago'
      },
    ];

    return ListView.builder(
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        final news = newsItems[index];
        return AnimatedContainer(
          duration: Duration(milliseconds: 200 + (index * 100)),
          curve: Curves.easeInOut,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  news['source']!,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSportsTab() {
    final sportsItems = [
      {'title': 'Championship Finals Tonight', 'info': 'Live updates'},
      {'title': 'Transfer News Update', 'info': 'Latest rumors'},
      {'title': 'Olympic Preparations', 'info': 'Team announcements'},
    ];

    return ListView.builder(
      itemCount: sportsItems.length,
      itemBuilder: (context, index) {
        final sport = sportsItems[index];
        return AnimatedContainer(
          duration: Duration(milliseconds: 200 + (index * 100)),
          curve: Curves.easeInOut,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: const Icon(Icons.sports_soccer, color: Colors.white),
            ),
            title: Text(
              sport['title']!,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              sport['info']!,
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
        );
      },
    );
  }
} 