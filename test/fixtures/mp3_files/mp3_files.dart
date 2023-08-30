import '../files.dart';

const _mp3FilesPath = 'mp3_files/';

const _singleMp3File = '02 - Час Предрассветный.mp3';
const _simpleFolder = '2023 - Пляска святого Вита';
const _folderWithTwoSubfolders = 'Alkonost';
const _folderWithSubSubfolder = 'Epica';
const _folderWithOneSubfolder = 'Калевала';

class Mp3Files extends BasePath {
  const Mp3Files({
    required String basePath,
  }) : super(basePath: '$basePath$_mp3FilesPath');

  String get singleMp3File => withBasePath(_singleMp3File);
  String get simpleFolder => withBasePath(_simpleFolder);
  String get folderWithTwoSubfolders => withBasePath(_folderWithTwoSubfolders);
  String get folderWithSubSubfolder => withBasePath(_folderWithSubSubfolder);
  String get folderWithOneSubfolder => withBasePath(_folderWithOneSubfolder);

  String get firstFileInSimpleFolder =>
      withBasePath('2023 - Пляска святого Вита\\01. Гори по полной!.mp3');
  String get lastFileInSimpleFolder =>
      withBasePath('2023 - Пляска святого Вита\\10. Сёстры бога.mp3');
}
