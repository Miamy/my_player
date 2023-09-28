part of 'main_page_bloc.dart';

@immutable
class MainPageState {
  const MainPageState({
    required this.current,
    required this.isPlaying,
    required this.metadata,
  });

  final PlayableItem? current;
  final bool isPlaying;
  final Metadata? metadata;

  MainPageState copyWidth({
    PlayableItem? current,
    bool? isPlaying,
    Metadata? metadata,
  }) {
    return MainPageState(
      current: current ?? this.current,
      isPlaying: isPlaying ?? this.isPlaying,
      metadata: metadata ?? this.metadata,
    );
  }
}
