import 'package:flutter_test/flutter_test.dart';
import 'package:my_player/core/enums.dart';
import 'package:my_player/domain/models/playlist.dart';

import '../../fixtures/files.dart';
import '../../fixtures/mp3_files/mp3_files.dart';

void main() {
  group(
    'Playlist constructor tests:',
    () {
      late Mp3Files mp3Files;

      setUp(() {
        mp3Files = const Mp3Files(basePath: fixturesPath);
      });

      tearDown(() {});

      test(
        'Playlist with added single file test',
        () {
          final Playlist playlist = Playlist.fromFile(mp3Files.singleMp3File);
          expect(playlist.length, 1);
        },
      );

      test(
        'Playlist with added simple folder test',
        () async {
          final Playlist playlist = Playlist.fromFolder(mp3Files.simpleFolder);
          expect(playlist.length, 10);
        },
      );

      test(
        'Playlist with added one subfolder test',
        () async {
          final Playlist playlist =
              Playlist.fromFolder(mp3Files.folderWithOneSubfolder);
          expect(playlist.length, 10);
        },
      );

      test(
        'Playlist with added two subfolders test',
        () async {
          final Playlist playlist =
              Playlist.fromFolder(mp3Files.folderWithTwoSubfolders);
          expect(playlist.length, 17);
        },
      );

      test(
        'Playlist with added subsubfolder test',
        () async {
          final Playlist playlist =
              Playlist.fromFolder(mp3Files.folderWithSubSubfolder);
          expect(playlist.length, 22);
        },
      );
    },
  );

  group(
    'Miscellanious playlist tests:',
    () {
      late Mp3Files mp3Files;
      late Playlist playlist;

      setUp(() {
        mp3Files = const Mp3Files(basePath: fixturesPath);
        playlist = Playlist.fromFolder(mp3Files.simpleFolder);
      });

      tearDown(() {});

      test(
        'Current item for empty playlist is null',
        () {
          playlist.clear();
          expect(playlist.current, null);
        },
      );

      test(
        'Clear playlist test',
        () {
          expect(playlist.length, 10);
          playlist.clear();
          expect(playlist.length, 0);
        },
      );
    },
  );

  group(
    'Playlist navigation tests:',
    () {
      group(
        'Empty playlist navigation tests:',
        () {
          late Playlist playlist;

          setUp(() {
            playlist = Playlist();
          });

          tearDown(() {});

          test(
            'Next operation for empty playlist is null',
            () {
              for (final value in RepeatType.values) {
                playlist.next(value);
                expect(playlist.current, null);
              }
            },
          );

          test(
            'Prev operation for empty playlist is null',
            () {
              for (final value in RepeatType.values) {
                playlist.prev(value);
                expect(playlist.current, null);
              }
            },
          );

          test(
            'First operation for empty playlist is null',
            () {
              playlist.first();
              expect(playlist.current, null);
            },
          );

          test(
            'Last operation for empty playlist is null',
            () {
              playlist.last();
              expect(playlist.current, null);
            },
          );
        },
      );

      group(
        'Filled playlist navigation tests:',
        () {
          late Mp3Files mp3Files;
          late Playlist playlist;

          setUp(() {
            mp3Files = const Mp3Files(basePath: fixturesPath);
            playlist = Playlist.fromFolder(mp3Files.simpleFolder);
          });

          tearDown(() {});

          test(
            'Navigation to the first item in the list',
            () {
              expect(playlist.current, null);
              playlist.first();
              expect(playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder.first);
            },
          );

          test(
            'Navigation to the last item in the list',
            () {
              expect(playlist.current, null);
              playlist.last();
              expect(playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder.last);
            },
          );

          test(
            'Navigation to the next item in the list',
            () {
              expect(playlist.current, null);
              playlist.first();

              playlist.next(RepeatType.none);
              expect(playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder[1]);

              playlist.next(RepeatType.all);
              expect(playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder[2]);

              playlist.next(RepeatType.current);
              expect(playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder[2]);

              playlist.last();
              playlist.next(RepeatType.none);
              expect(playlist.current, null);

              playlist.last();
              playlist.next(RepeatType.all);
              expect(playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder[0]);

              playlist.last();
              playlist.next(RepeatType.current);
              expect(playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder.last);
            },
          );

          test(
            'Navigation to the prev item in the list',
            () {
              expect(playlist.current, null);
              playlist.last();

              playlist.prev(RepeatType.none);
              expect(
                  playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder[
                      mp3Files.fileInSimpleFolder.length - 2]);

              playlist.prev(RepeatType.all);
              expect(
                  playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder[
                      mp3Files.fileInSimpleFolder.length - 3]);

              playlist.prev(RepeatType.current);
              expect(
                  playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder[
                      mp3Files.fileInSimpleFolder.length - 3]);

              playlist.first();
              playlist.prev(RepeatType.none);
              expect(playlist.current, null);

              playlist.first();
              playlist.prev(RepeatType.all);
              expect(
                  playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder[
                      mp3Files.fileInSimpleFolder.length - 1]);

              playlist.first();
              playlist.prev(RepeatType.current);
              expect(playlist.current?.source.source,
                  mp3Files.fileInSimpleFolder.first);
            },
          );
        },
      );
    },
  );
}
