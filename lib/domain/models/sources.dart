abstract class PlayableSource {
  PlayableSource(this.source);
  final String source;
}

class FileSource extends PlayableSource {
  FileSource(String source) : super(source);
}
