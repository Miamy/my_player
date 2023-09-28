import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/models/playable_item.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitial(current: null, isPlaying: false)) {
    on<MainPageEvent>((event, emit) {});
  }
}
