import 'dart:io';

class SampleTestHelper {
  late final String nowPlayingSample;
  late final String popularSample;
  late final String topRatedSample;
  late final String upcomingSample;
  late final String detailsSample;

  Future<void> loadFixture() async {
    nowPlayingSample =
        await File('test/data/samples/now_playing_sample.json').readAsString();
    popularSample =
        await File('test/data/samples/popular_sample.json').readAsString();
    topRatedSample =
        await File('test/data/samples/top_rated_sample.json').readAsString();
    upcomingSample =
        await File('test/data/samples/upcoming_sample.json').readAsString();
    detailsSample =
        await File('test/data/samples/details_sample.json').readAsString();
  }
}
