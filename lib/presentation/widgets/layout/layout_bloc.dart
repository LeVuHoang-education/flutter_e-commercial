import 'package:bloc/bloc.dart';
import 'package:e_commercial_app/presentation/widgets/layout/layout_event.dart';
import 'package:e_commercial_app/presentation/widgets/layout/layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  LayoutBloc() : super(LayoutInitial(tabIndex: 0)) {
    on<LayoutEvent>((event, emit) {
      if (event is LayoutEventChangeTab) {
        emit(LayoutInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
