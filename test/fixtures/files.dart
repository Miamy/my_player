import 'mp3_files/mp3_files.dart';

const fixturesPath = 'test/fixtures/';

abstract class Files {
  static const mp3Files = Mp3Files(basePath: fixturesPath);
}

abstract class BasePath {
  const BasePath({
    required this.basePath,
  });

  final String basePath;

  String withBasePath(String name) => '$basePath$name';
}
