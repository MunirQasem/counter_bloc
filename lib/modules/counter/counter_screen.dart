import 'package:counter_bloc/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_bloc/modules/counter/cubit/cubit.dart';
import 'package:counter_bloc/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        // listener: (context, state) {
        listener: (BuildContext context, CounterStates state) {
          if (state is CounterMinusState) {
            // print('minus state ${state.counter}');
          }
          if (state is CounterPlusState) {
            // print('plus state ${state.counter}');
          }
        },
        // builder: (context, state) {
        builder: (BuildContext context, CounterStates state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Counter Bloc'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      defaultButton(
                        text: 'minus',
                        width: 100,
                        function: () {
                          CounterCubit.get(context).minus();
                        },
                      ),
                      Text(
                        '${CounterCubit.get(context).counter}',
                        style: const TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900),
                      ),
                      defaultButton(
                        text: 'plus',
                        width: 100,
                        function: () {
                          CounterCubit.get(context).plus();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
