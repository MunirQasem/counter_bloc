import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_bloc/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  // CounterCubit(CounterStates initialState) : super(initialState);

  CounterCubit() : super(CounterInitialState());

// to be more easily when use this cubit in many places
  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 1;

  void minus() {
    counter--;
    emit(CounterMinusState(counter));
  }

  void plus() {
    counter++;
    emit(CounterPlusState(counter));
  }
}
