part of 'main_page_bloc.dart';

@immutable
sealed class MainPageEvent {}

class PlayEvent extends MainPageEvent {}

class PauseEvent extends MainPageEvent {}

class StopEvent extends MainPageEvent {}

class NextEvent extends MainPageEvent {}

class PrevEvent extends MainPageEvent {}
