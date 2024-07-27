import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cubit/cubits/test_cubit/test_cubit.dart';
import 'package:test_cubit/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test state management',
      home: BlocProvider(
        // this is a bloc provider to create the test cubit and provide it to
        // the home screen so we can access it in the home screen
        create: (context) => TestCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}
