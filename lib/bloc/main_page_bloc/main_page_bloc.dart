import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:meta/meta.dart';
import 'package:my_player/domain/audioplayer/audioplayer.dart';

import '../../core/enums.dart';
import '../../domain/models/playable_item.dart';
import '../../domain/models/playlist.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc()
      : super(const MainPageState(
          current: null,
          isPlaying: false,
          metadata: null,
        )) {
    on<MainPageEvent>((event, emit) => switch (event) {
          PlayEvent _ => _onPlay(emit, event),
          PauseEvent _ => _onPause(emit, event),
          StopEvent _ => _onStop(emit, event),
          NextEvent _ => _onNext(emit, event),
          PrevEvent _ => _onPrev(emit, event),
          SetCurrent setCurrent => _onSetCurrent(emit, setCurrent),
          SetMetadata setMetadata => _onSetMetadata(emit, setMetadata),
          AddEvent addEvent => _onAddEvent(emit, addEvent),
        });

    //audioPlayer = AudioPlayer();
  }

  late final AudioPlayer audioPlayer;
  final Playlist playlist = Playlist();
  RepeatType repeatType = RepeatType.all;

  Future<void> _onPlay(
    Emitter emit,
    PlayEvent playEvent,
  ) async {
    audioPlayer.play();
    emit(
      state.copyWidth(
        isPlaying: true,
      ),
    );
  }

  Future<void> _onPause(
    Emitter emit,
    PauseEvent pauseEvent,
  ) async {
    audioPlayer.pause();
    emit(
      state.copyWidth(
        isPlaying: false,
      ),
    );
  }

  Future<void> _onStop(
    Emitter emit,
    StopEvent stopEvent,
  ) async {
    audioPlayer.stop();
    emit(
      state.copyWidth(
        isPlaying: false,
      ),
    );
  }

  Future<void> _onPrev(
    Emitter emit,
    PrevEvent prevEvent,
  ) async {
    playlist.prev(repeatType);
    add(
      SetCurrent(current: playlist.current),
    );
  }

  Future<void> _onNext(
    Emitter emit,
    NextEvent nextEvent,
  ) async {
    playlist.next(repeatType);
    add(
      SetCurrent(current: playlist.current),
    );
  }

  Future<void> _onSetCurrent(
    Emitter emit,
    SetCurrent event,
  ) async {
    emit(
      state.copyWidth(
        current: event.current,
      ),
    );
    if (event.current != null) {
      final metadata = await MetadataRetriever.fromFile(
        File(event.current!.source.source),
      );
      add(
        SetMetadata(metadata: metadata),
      );
    }
  }

  Future<void> _onSetMetadata(
    Emitter emit,
    SetMetadata event,
  ) async {
    emit(
      state.copyWidth(
        metadata: event.metadata,
      ),
    );
  }

  Future<void> _onAddEvent(Emitter emit, AddEvent addEvent) async {}
}
