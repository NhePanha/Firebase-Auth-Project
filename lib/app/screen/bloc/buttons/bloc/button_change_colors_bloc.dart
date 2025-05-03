import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'button_change_colors_event.dart';
part 'button_change_colors_state.dart';

class ButtonChangeColorsBloc
    extends Bloc<ButtonChangeColorsEvent, ButtonChangeColorsState> {
  ButtonChangeColorsBloc() : super(ButtonChangeColorsInitial()) {
    on<ChangeColorsEvent>((event, emit) {
      bool isText = event.isSelected;
      print('bool $isText');
      emit(ChangeColors(isSelected: isText));
    });
  }
}
