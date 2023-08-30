import 'sources.dart';

class PlayableItem {
  PlayableItem.fromFile(String filename) : source = FileSource(filename);

  final PlayableSource source;
}
