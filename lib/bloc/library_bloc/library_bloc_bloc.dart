import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'library_bloc_event.dart';
part 'library_bloc_state.dart';

class LibraryBloc extends Bloc<LibraryBlocEvent, LibraryBlocState> {
  LibraryBloc() : super(LibraryBlocInitial()) {
    on<LibraryBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
