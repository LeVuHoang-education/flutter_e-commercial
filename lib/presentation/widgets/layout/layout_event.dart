import 'package:equatable/equatable.dart';

abstract class LayoutEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LayoutEventChangeTab extends LayoutEvent {
  final int tabIndex;
  LayoutEventChangeTab({required this.tabIndex});

  @override
  List<Object> get props => [tabIndex];
}