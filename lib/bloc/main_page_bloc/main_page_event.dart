part of 'main_page_bloc.dart';

@immutable
sealed class MainPageEvent {}

class PlayEvent extends MainPageEvent {}

class PauseEvent extends MainPageEvent {}

class StopEvent extends MainPageEvent {}

class NextEvent extends MainPageEvent {}

class PrevEvent extends MainPageEvent {}

class SetCurrent extends MainPageEvent {
  SetCurrent({required this.current});

  final PlayableItem? current;
}

class SetMetadata extends MainPageEvent {
  SetMetadata({required this.metadata});

  final Metadata metadata;
}

class AddEvent extends MainPageEvent {}
