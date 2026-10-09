class Song {
  final String id;
  final String streamUrl;
  final String title;
  final String artist;
  final num duration;
  final String? albumImage;
  final String? album;
  final List<String>? genres;
  final String? lyrics;

  Song({
    required this.id,
    required this.streamUrl,
    required this.title,
    required this.artist,
    required this.duration,
    this.albumImage,
   this.album,
   this.genres,
   this.lyrics
  });
}
