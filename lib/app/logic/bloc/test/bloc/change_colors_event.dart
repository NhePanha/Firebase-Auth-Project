part of 'change_colors_bloc.dart';

@immutable
sealed class ChangeColorsEvent {}

class ChangeColors extends ChangeColorsBloc{
  bool isSelected = false;
}