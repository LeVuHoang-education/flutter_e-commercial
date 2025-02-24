import 'package:equatable/equatable.dart';

abstract class LayoutState extends Equatable {
  final int tabIndex;
  const LayoutState({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}

class LayoutInitial extends LayoutState{
  const LayoutInitial({required super.tabIndex});
}

