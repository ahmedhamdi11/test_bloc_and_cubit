import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cubit/cubits/test_cubit/test_cubit.dart';

// BlocListener: is a widget used to listen to a cubit states,

// BlocBuilder:is a widget used to rebuild the widgets inside it when
// its cubit changes the current state

// BlocConsumer: is a widget the have both the listener and the bloc builder
// so it listen to the cubit states and also rebuild the widgets inside its builder method when
// the states changes

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // access the test cubit
    final cubit = context.read<TestCubit>();

    // bloc lister is a widget used to listen to a cubit states
    return BlocListener<TestCubit, TestState>(
      listener: (context, state) {
        // for example if we want to display a snack bar
        // when the request state is success
        if (state is RequestSuccess) {
          SnackBar snackBar = const SnackBar(
            content: Text(
              'api request done successfully',
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('handle request state with cubit'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // bloc builder is a widget used to rebuild the widgets inside it
              // when its cubit changes the current state
              BlocBuilder<TestCubit, TestState>(
                builder: (context, state) {
                  // build the ui based on the current state in the TestCubit
                  if (state is RequestLoading) {
                    // if the state is loading display the loading widget
                    return const CircularProgressIndicator();
                  } else if (state is RequestFailure) {
                    // if the state is failure display the error message
                    return Text(
                      state.errMessage,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else if (state is RequestSuccess) {
                    // if the state is success display the response of the api request
                    return Text(
                      state.data.toString(),
                      style: const TextStyle(color: Colors.green),
                    );
                  } else {
                    // the state is the initial state
                    return const Text('int');
                  }
                },
              ),
              const SizedBox(height: 50),
              MaterialButton(
                onPressed: () => cubit
                    .getData(), // start the request on pressing this button
                color: Colors.blue,
                child: const Text("get data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
