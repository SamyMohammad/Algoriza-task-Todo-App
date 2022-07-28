import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_algoriza/data/models/task_model.dart';
import 'package:to_do_algoriza/presentation/bloc/todo_cubit/todo_cubit.dart';

class CompletedTodoItem extends StatelessWidget {
   CompletedTodoItem({required this.taskModel,Key? key}) : super(key: key);
TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                       side:const BorderSide(color: Colors.red,width: 2,),
                      value: TodoCubit.get(context).isSelectedCheckBox,
                      onChanged: (bool? newValue){
                        TodoCubit.get(context).changeCheckBox(newValue, taskModel.id!, taskModel.isCompleted??0,taskModel);
                      }),
                ),
                Text(taskModel.title!)
              ],
            ),
          );
        },
      ),
    );
  }
}
