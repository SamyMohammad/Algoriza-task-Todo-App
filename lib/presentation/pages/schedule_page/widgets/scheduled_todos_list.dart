import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_algoriza/presentation/bloc/todo_cubit/todo_cubit.dart';
import 'package:to_do_algoriza/presentation/pages/schedule_page/widgets/scheduled_todo_item.dart';

import '../../../../data/models/task_model.dart';

class ScheduledTodosList extends StatelessWidget {
  ScheduledTodosList({this.taskModel, Key? key}) : super(key: key);
  TaskModel? taskModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        return ListView.builder(
          itemCount: TodoCubit.get(context).tasksList.length,
            itemBuilder: (context, index){
          var task =  TodoCubit.get(context).tasksList[index];
           return ScheduledTodoItem( taskModel: task,);});
      },
    );
  }
}
