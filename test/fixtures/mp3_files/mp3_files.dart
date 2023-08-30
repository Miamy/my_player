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

  List<String> get fileInSimpleFolder => [
        withPath('01. Гори по полной!.mp3'),
        withPath('02. Пляска святого Вита.mp3'),
        withPath('03. Ловец змей.mp3'),
        withPath('04. Проснись во мне зверь.mp3'),
        withPath('05. Именем леса.mp3'),
        withPath('06. Безбожники.mp3'),
        withPath('07. Сто дней.mp3'),
        withPath('08. Так долго ждать.mp3'),
        withPath('09. Бесхвостая лиса.mp3'),
        withPath('10. Сёстры бога.mp3'),
      ];

  String withPath(String name) => withBasePath('$_simpleFolder\\$name');
}
