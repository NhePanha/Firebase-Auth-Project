part of 'button_change_colors_bloc.dart';

@immutable
sealed class ButtonChangeColorsEvent {}

class ChangeColorsEvent extends ButtonChangeColorsEvent {
  final bool isSelected;
  ChangeColorsEvent({required this.isSelected});
}
