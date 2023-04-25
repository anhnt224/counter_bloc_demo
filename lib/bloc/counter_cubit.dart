import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  void increment() => emit(IncrementState(counter: state.counter + 1));
  void decrement() => emit(DecrementState(counter: state.counter - 1));
}
