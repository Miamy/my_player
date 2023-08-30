bool isItemPlayable(String name) {
  if (name.length < 4) {
    return false;
  }
  final lowerCase = name.toLowerCase();
  return lowerCase.endsWith('.mp3') || lowerCase.endsWith('.m4a');
}
