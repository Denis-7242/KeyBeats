// lib/screens/now_playing_screen.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/song_model.dart';
import '../widgets/player_controls.dart';

class NowPlayingScreen extends StatefulWidget {
  final Song song;

  const NowPlayingScreen({Key? key, required this.song}) : super(key: key);

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = true;
  double _currentPosition = 0.3; // 30% progress for demo
  bool _isFavorite = false;
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    
    if (_isPlaying) {
      _rotationController.repeat();
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.accentPurple.withOpacity(0.3),
              AppTheme.primaryDark,
              AppTheme.primaryDark,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Album art with rotation animation
                Expanded(
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _rotationController,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _rotationController.value * 2 * 3.14159,
                          child: child,
                        );
                      },
                      child: Hero(
                        tag: 'album_${widget.song.id}',
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: MediaQuery.of(context).size.width * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.accentPurple.withOpacity(0.4),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.network(
                              widget.song.coverUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    gradient: AppTheme.accentGradient,
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  child: const Icon(
                                    Icons.music_note,
                                    size: 100,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Song info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.song.title,
                            style: Theme.of(context).textTheme.displayMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.song.artist,
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? AppTheme.accentPink : AppTheme.textSecondary,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Progress bar
                Column(
                  children: [
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 4,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 6,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 14,
                        ),
                        activeTrackColor: AppTheme.accentPurple,
                        inactiveTrackColor: AppTheme.textSecondary.withOpacity(0.3),
                        thumbColor: Colors.white,
                        overlayColor: AppTheme.accentPurple.withOpacity(0.3),
                      ),
                      child: Slider(
                        value: _currentPosition,
                        onChanged: (value) {
                          setState(() {
                            _currentPosition = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(_currentPosition),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            widget.song.duration,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Player controls
                PlayerControls(
                  isPlaying: _isPlaying,
                  onPlayPause: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                      if (_isPlaying) {
                        _rotationController.repeat();
                      } else {
                        _rotationController.stop();
                      }
                    });
                  },
                  onPrevious: () {},
                  onNext: () {},
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDuration(double progress) {
    // Convert song duration to seconds (simplified)
    final parts = widget.song.duration.split(':');
    final totalSeconds = int.parse(parts[0]) * 60 + int.parse(parts[1]);
    final currentSeconds = (totalSeconds * progress).round();
    final minutes = currentSeconds ~/ 60;
    final seconds = currentSeconds % 60;
    return '${minutes}:${seconds.toString().padLeft(2, '0')}';
  }
}