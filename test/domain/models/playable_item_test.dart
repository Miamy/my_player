import 'package:flutter_test/flutter_test.dart';
import 'package:my_player/domain/models/playable_item.dart';

void main() {
  group(
    'PlayableItem constructor tests:',
    () {
      const String nameOnly = 'nameOnly';
      const String nameWithExt = 'nameOnly.ext';
      const String longNameOnly = 'folder\\nameOnly';
      const String longNameWithExt = 'folder\\nameOnly.ext';
      const String veryLongNameOnly =
          'folder\\folder\\folder\\folder\\nameOnly';
      const String veryLongNameWithExt =
          'folder\\folder\\folder\\folder\\nameOnly.ext';

      setUp(() {});

      tearDown(() {});

      test(
        'Test name only',
        () {
          final item = PlayableItem.fromFile(nameOnly);
          expect(item.name, nameOnly);
        },
      );

      test(
        'Test name with ext',
        () {
          final item = PlayableItem.fromFile(nameWithExt);
          expect(item.name, nameOnly);
        },
      );

      test(
        'Test long name only',
        () {
          final item = PlayableItem.fromFile(longNameOnly);
          expect(item.name, nameOnly);
        },
      );

      test(
        'Test long name with ext',
        () {
          final item = PlayableItem.fromFile(longNameWithExt);
          expect(item.name, nameOnly);
        },
      );

      test(
        'Test very long name only',
        () {
          final item = PlayableItem.fromFile(veryLongNameOnly);
          expect(item.name, nameOnly);
        },
      );

      test(
        'Test very long name with ext',
        () {
          final item = PlayableItem.fromFile(veryLongNameWithExt);
          expect(item.name, nameOnly);
        },
      );
    },
  );
}
