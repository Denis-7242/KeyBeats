import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/song_model.dart';
import '../widgets/song_card.dart';
import 'now_playing_screen.dart';
import 'playlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Song> _songs = MockData.getSongs();
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize data only, not widgets using context
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Safe to build widgets with context here
    _pages = [
      _buildHomePage(),
      const PlaylistScreen(),
      _buildLibraryPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.playlist_play_rounded),
                label: 'Playlists',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music_rounded),
                label: 'Library',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -----------------------------
  // Build the Home Page
  // -----------------------------
  Widget _buildHomePage() {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: AppTheme.accentGradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 12),
                        ShaderMask(
                          shaderCallback: (bounds) =>
                              AppTheme.accentGradient.createShader(bounds),
                          child: const Text(
                            'KeyBeats',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good ${_getGreeting()}',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'What do you want to hear?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Recently Played',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20,
                    ),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final song = _songs[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: SongCard(
                      song: song,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    NowPlayingScreen(song: song),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 1),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
                childCount: _songs.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  // -----------------------------
  // Build the Library Page
  // -----------------------------
  Widget _buildLibraryPage() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Library',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 30),
            _buildLibraryOption(Icons.favorite, 'Liked Songs', '42 songs'),
            _buildLibraryOption(Icons.download, 'Downloads', '18 songs'),
            _buildLibraryOption(Icons.history, 'Recently Played', '24 songs'),
            _buildLibraryOption(Icons.album, 'Albums', '12 albums'),
            _buildLibraryOption(Icons.person, 'Artists', '28 artists'),
          ],
        ),
      ),
    );
  }

  Widget _buildLibraryOption(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: AppTheme.accentGradient,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppTheme.textSecondary),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppTheme.textSecondary,
          size: 16,
        ),
      ),
    );
  }

  // -----------------------------
  // Greeting Function
  // -----------------------------
  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Morning';
    if (hour < 17) return 'Afternoon';
    return 'Evening';
  }
}
