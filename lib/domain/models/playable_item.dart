import 'dart:io';

import 'sources.dart';

class PlayableItem {
  PlayableItem.fromFile(String filename) : source = FileSource(filename) {
    assert(filename.isNotEmpty, 'filename cannot be empty');

    var nameOnly = filename;
    var index = nameOnly.lastIndexOf('.');
    if (index > -1) {
      nameOnly = nameOnly.substring(0, index);
    }
    index = nameOnly.lastIndexOf(Platform.pathSeparator);
    if (index > -1) {
      nameOnly = nameOnly.substring(index + 1, nameOnly.length);
    }
    name = nameOnly;
  }

  final PlayableSource source;
  late final String name;
}
