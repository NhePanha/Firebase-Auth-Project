part of 'change_colors_bloc.dart';

@immutable
sealed class ChangeColorsState {
}

final class ChangeColorsInitial extends ChangeColorsState {}

class CheckColors extends ChangeColorsBloc {
  bool isSelected = false;
}
