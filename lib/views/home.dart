import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/cubits/todo_cubit/todo_cubit.dart';
import 'package:todos_app/models/todo_model.dart';
import 'package:todos_app/views/widgets/custom_button.dart';
// import 'package:todos_app/services/todo_service.dart';
// import 'package:todos_app/models/todo_model.dart';
import 'package:todos_app/views/widgets/custom_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees"),
        backgroundColor: const Color(0xff142a39),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xff142a39),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
              if (state is TodoLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TodoSuccess) {
                return Success(
                  listTodos: BlocProvider.of<TodoCubit>(context).todoList,
                );
              } else if (state is TodoFailure) {
                return Text(state.errorMessage!);
              } else {
                BlocProvider.of<TodoCubit>(context).getTodos(0);
                return const Center(child: CircularProgressIndicator());
              }
            })),
      ),
    );
  }
}

class Success extends StatelessWidget {
  const Success({super.key, required this.listTodos});
  final List<TodoModel>? listTodos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 225,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CustomCard(
                todo: listTodos![index],
              );
            },
            itemCount: listTodos!.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              CustomButton(
                buttonName: 'Previos',
                onPressed: () {
                  BlocProvider.of<TodoCubit>(context).getTodos(0);
                },
              ),
              const SizedBox(
                width: 20,
              ),
              CustomButton(
                buttonName: 'Next',
                onPressed: () {
                  BlocProvider.of<TodoCubit>(context).getTodos(1);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
