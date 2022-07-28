import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_algoriza/presentation/bloc/todo_cubit/todo_cubit.dart';
import 'package:to_do_algoriza/presentation/pages/completed_page/widgets/todo_item.dart';

class CompletedTodoList extends StatelessWidget {
  CompletedTodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: TodoCubit.get(context).completedTasks.length,
          itemBuilder: (context, index) {
            var task = TodoCubit.get(context).completedTasks[index];
            return CompletedTodoItem(
              taskModel: task,
            );
          },
        );
      },
    );
  }
}
