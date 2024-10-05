import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, int> {
  HomeBloc() : super(0) {
    on<HomeTabChanged>((event, emit) {
      emit(event.tab);
    });
  }
}
