import 'dart:io';

import '../../core/enums.dart';
import '../../core/utils.dart';
import 'playable_item.dart';

class Playlist {
  Playlist();

  Playlist.fromFile(String filename) {
    _items.add(
      PlayableItem.fromFile(filename),
    );
  }

  Playlist.fromFolder(String foldername) {
    void addFolder(String foldername) {
      final dir = Directory(foldername);
      final List<FileSystemEntity> entities =
          dir.listSync(recursive: false).toList();

      for (final entity in entities) {
        switch (entity) {
          case File _:
            if (isItemPlayable(entity.path)) {
              _items.add(
                PlayableItem.fromFile(entity.path),
              );
            }
            break;
          case Directory _:
            addFolder(entity.path);
            break;
          default:
            break;
        }
      }
    }

    addFolder(foldername);
  }

  final List<PlayableItem> _items = [];
  int get length => _items.length;
  int _index = -1;
  PlayableItem? get current =>
      _index == -1 ? null : (_items.isEmpty ? null : _items[_index]);

  void clear() {
    _items.clear();
    _index = -1;
  }

  void next(RepeatType repeatType) {
    if (repeatType == RepeatType.current) {
      return;
    }
    _index++;
    if (_index == _items.length - 1) {
      switch (repeatType) {
        case RepeatType.none:
          _index = -1;
          break;
        case RepeatType.current:
          break;
        case RepeatType.all:
          _index = 0;
          break;
      }
    }
  }

  void prev(RepeatType repeatType) {
    if (repeatType == RepeatType.current) {
      return;
    }
    _index--;
    if (_index == 0) {
      switch (repeatType) {
        case RepeatType.none:
          _index = -1;
          break;
        case RepeatType.current:
          break;
        case RepeatType.all:
          _index = _items.length - 1;
          break;
      }
    }
  }

  void first() {
    _index = _items.isEmpty ? -1 : 0;
  }

  void last() {
    _index = _items.isEmpty ? -1 : _items.length - 1;
  }
}
