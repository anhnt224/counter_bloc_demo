import 'package:counter_bloc/bloc/counter_state.dart';
import 'package:counter_bloc/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_cubit.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  Widget _buildLabel(CounterState state, BuildContext context) {
    if (state is IncrementState) {
      return Text('TĂNG',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.green));
    }
    if (state is DecrementState) {
      return Text('GIẢM',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.red));
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLabel(state, context),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: cubit.decrement,
                      backgroundColor: Colors.amber,
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(width: 16),
                    FloatingActionButton(
                      onPressed: cubit.increment,
                      backgroundColor: Colors.amber,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.screen2);
                  },
                  child: const Text("Push to page2"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
