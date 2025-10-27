// lib/models/song_model.dart
class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String duration;
  final String coverUrl;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    required this.coverUrl,
  });
}

class Playlist {
  final String id;
  final String name;
  final int songCount;
  final String coverUrl;

  Playlist({
    required this.id,
    required this.name,
    required this.songCount,
    required this.coverUrl,
  });
}

// Mock data for songs
class MockData {
  static List<Song> getSongs() {
    return [
      Song(
        id: '1',
        title: 'Midnight Dreams',
        artist: 'Luna Eclipse',
        album: 'Night Whispers',
        duration: '3:45',
        coverUrl: 'https://images.unsplash.com/photo-1611339555312-e607c8352fd7?w=300',
      ),
      Song(
        id: '2',
        title: 'Neon Lights',
        artist: 'Cyber Wave',
        album: 'Digital Paradise',
        duration: '4:12',
        coverUrl: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=300',
      ),
      Song(
        id: '3',
        title: 'Ocean Breeze',
        artist: 'Sunset Horizon',
        album: 'Coastal Vibes',
        duration: '3:28',
        coverUrl: 'https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?w=300',
      ),
      Song(
        id: '4',
        title: 'Electric Soul',
        artist: 'Nova Sound',
        album: 'Future Beats',
        duration: '5:01',
        coverUrl: 'https://images.unsplash.com/photo-1514320291840-2e0a9bf2a9ae?w=300',
      ),
      Song(
        id: '5',
        title: 'Starlight',
        artist: 'Aurora Keys',
        album: 'Celestial',
        duration: '4:33',
        coverUrl: 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?w=300',
      ),
      Song(
        id: '6',
        title: 'Urban Rhythm',
        artist: 'Metro Beats',
        album: 'City Nights',
        duration: '3:56',
        coverUrl: 'https://images.unsplash.com/photo-1485579149621-3123dd979885?w=300',
      ),
      Song(
        id: '7',
        title: 'Cosmic Journey',
        artist: 'Space Echo',
        album: 'Beyond Stars',
        duration: '6:18',
        coverUrl: 'https://images.unsplash.com/photo-1511379938547-c1f69419868d?w=300',
      ),
      Song(
        id: '8',
        title: 'Purple Haze',
        artist: 'Velvet Dreams',
        album: 'Smooth Melodies',
        duration: '4:47',
        coverUrl: 'https://images.unsplash.com/photo-1487180144351-b8472da7d491?w=300',
      ),
    ];
  }

  static List<Playlist> getPlaylists() {
    return [
      Playlist(
        id: '1',
        name: 'Chill Vibes',
        songCount: 24,
        coverUrl: 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=300',
      ),
      Playlist(
        id: '2',
        name: 'Workout Mix',
        songCount: 32,
        coverUrl: 'https://images.unsplash.com/photo-1571330735066-03aaa9429d89?w=300',
      ),
      Playlist(
        id: '3',
        name: 'Night Drive',
        songCount: 18,
        coverUrl: 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?w=300',
      ),
      Playlist(
        id: '4',
        name: 'Focus Flow',
        songCount: 45,
        coverUrl: 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=300',
      ),
      Playlist(
        id: '5',
        name: 'Party Hits',
        songCount: 28,
        coverUrl: 'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=300',
      ),
      Playlist(
        id: '6',
        name: 'Acoustic Sessions',
        songCount: 21,
        coverUrl: 'https://images.unsplash.com/photo-1510915228340-29c85a43dcfe?w=300',
      ),
    ];
  }
}