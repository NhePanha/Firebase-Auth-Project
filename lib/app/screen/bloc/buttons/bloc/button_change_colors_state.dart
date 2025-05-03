part of 'button_change_colors_bloc.dart';

@immutable
sealed class ButtonChangeColorsState {}

final class ButtonChangeColorsInitial extends ButtonChangeColorsState {}

class ChangeColors extends ButtonChangeColorsState {
  bool isSelected;
  ChangeColors({required this.isSelected});
}
