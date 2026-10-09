import 'package:tsuki_music/core/models/song_model.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class SearchRepository {
  final YoutubeExplode _yt = YoutubeExplode();

  Future<List<Song>> searchSongs(String query) async {
    final results = await _yt.search.search(query);

    return results.map((video) {
      return Song(
        id: video.id.value,
        artist: video.author,
        title: video.title,
        duration: video.duration?.inSeconds ?? 0,
        streamUrl: '',
        albumImage: video.thumbnails.standardResUrl,
      );
    }).toList();
  }

  Future<String> getStreamUrl(String videoId) async {
    final manifest = await _yt.videos.streamsClient.getManifest(videoId);
    var result = manifest.audioOnly.withHighestBitrate();
    return result.url.toString();
  }
}
