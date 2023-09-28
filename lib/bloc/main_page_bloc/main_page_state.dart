part of 'main_page_bloc.dart';

@immutable
sealed class MainPageState {}

final class MainPageInitial extends MainPageState {
  MainPageInitial({
    required this.current,
    required this.isPlaying,
  });

  final PlayableItem? current;
  final bool isPlaying;
}
