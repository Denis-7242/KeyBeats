// lib/widgets/player_controls.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PlayerControls extends StatefulWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const PlayerControls({
    Key? key,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onPrevious,
    required this.onNext,
  }) : super(key: key);

  @override
  State<PlayerControls> createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls>
    with SingleTickerProviderStateMixin {
  bool _isShuffle = false;
  int _repeatMode = 0; // 0: off, 1: all, 2: one
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    if (widget.isPlaying) {
      _glowController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(PlayerControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying != oldWidget.isPlaying) {
      if (widget.isPlaying) {
        _glowController.repeat(reverse: true);
      } else {
        _glowController.stop();
        _glowController.value = 0;
      }
    }
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top row: shuffle and repeat
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.shuffle,
                color: _isShuffle ? AppTheme.accentPurple : AppTheme.textSecondary,
              ),
              onPressed: () {
                setState(() {
                  _isShuffle = !_isShuffle;
                });
              },
            ),
            IconButton(
              icon: Icon(
                _repeatMode == 0
                    ? Icons.repeat
                    : _repeatMode == 1
                        ? Icons.repeat
                        : Icons.repeat_one,
                color: _repeatMode == 0
                    ? AppTheme.textSecondary
                    : AppTheme.accentPurple,
              ),
              onPressed: () {
                setState(() {
                  _repeatMode = (_repeatMode + 1) % 3;
                });
              },
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Main controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Previous button
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.cardBackground,
              ),
              child: IconButton(
                icon: const Icon(Icons.skip_previous, size: 32),
                color: AppTheme.textPrimary,
                onPressed: widget.onPrevious,
              ),
            ),

            const SizedBox(width: 20),

            // Play/Pause button with glow animation
            AnimatedBuilder(
              animation: _glowController,
              builder: (context, child) {
                return Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppTheme.accentGradient,
                    boxShadow: widget.isPlaying
                        ? [
                            BoxShadow(
                              color: AppTheme.accentPurple.withOpacity(
                                0.3 + (_glowController.value * 0.4),
                              ),
                              blurRadius: 20 + (_glowController.value * 15),
                              spreadRadius: 5 + (_glowController.value * 5),
                            ),
                          ]
                        : [],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(35),
                      onTap: widget.onPlayPause,
                      child: Icon(
                        widget.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 36,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(width: 20),

            // Next button
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.cardBackground,
              ),
              child: IconButton(
                icon: const Icon(Icons.skip_next, size: 32),
                color: AppTheme.textPrimary,
                onPressed: widget.onNext,
              ),
            ),
          ],
        ),
      ],
    );
  }
}