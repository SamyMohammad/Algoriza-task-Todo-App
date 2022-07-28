import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_algoriza/data/models/task_model.dart';

import '../../../bloc/todo_cubit/todo_cubit.dart';

class ScheduledTodoItem extends StatelessWidget {
   ScheduledTodoItem({this.taskModel,Key? key}) : super(key: key);
TaskModel? taskModel;
int? index;
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

      decoration: BoxDecoration(
          color: Colors.red,

          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 17),
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text(taskModel!.endTime!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
              Text(taskModel!.title!,style: TextStyle(color: Colors.white,fontSize: 18),),

            ]
        ),
        Spacer(),
        Checkbox(

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50)),
            side: const BorderSide(color: Colors.black,width: 2,),
            value: TodoCubit.get(context).isSelectedCheckBox,
            onChanged: (bool? newValue){
              TodoCubit.get(context).changeCheckBox(newValue, taskModel!.id!, taskModel!.isCompleted!,taskModel!);
            })
      ]),
    );
  },
),
);
  }
}
