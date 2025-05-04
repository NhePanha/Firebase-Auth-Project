import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'change_colors_event.dart';
part 'change_colors_state.dart';

class ChangeColorsBloc extends Bloc<ChangeColorsEvent, ChangeColorsState> {
  ChangeColorsBloc() : super(ChangeColorsInitial()) {
    on<ChangeColorsEvent>((event, emit) {
      print("Hello");
    });
  }
}
