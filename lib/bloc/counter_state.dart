class CounterState {
  int counter;
  CounterState({required this.counter});
}

class IncrementState extends CounterState {
  IncrementState({required super.counter});
}

class DecrementState extends CounterState {
  DecrementState({required super.counter});
}
