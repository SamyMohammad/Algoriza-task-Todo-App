import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_algoriza/data/models/task_model.dart';
import 'package:to_do_algoriza/presentation/bloc/todo_cubit/todo_cubit.dart';
import 'package:to_do_algoriza/presentation/pages/all_page/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        return ListView.builder(
            itemCount: TodoCubit.get(context).tasksList.length,
            itemBuilder: (context, index) {
            var task =  TodoCubit.get(context).tasksList[index];
            return  TodoItem(taskModel: task,);},);
      },
    );
  }
}
