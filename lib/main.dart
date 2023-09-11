import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/cubits/todo_cubit/todo_cubit.dart';
import 'package:todos_app/views/home.dart';

void main() {
  runApp(const TodosApp());
}

class TodosApp extends StatelessWidget {
  const TodosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
