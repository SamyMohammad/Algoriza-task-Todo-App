import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_algoriza/data/models/task_model.dart';
import 'package:to_do_algoriza/presentation/bloc/todo_cubit/todo_cubit.dart';
import 'package:to_do_algoriza/presentation/reusable_components/clickable_widget.dart';
import 'package:to_do_algoriza/presentation/reusable_components/default_textfield.dart';

import '../../reusable_components/default_button.dart';
import '../../reusable_components/dropDownMenu.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({Key? key}) : super(key: key);
  static const String routeName = 'AddTaskPage';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Add Task')),
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //    title
              const Text(
                'Title',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTextField(
                controller: TodoCubit.get(context).titleController,
                isHidden: false,
                hintText: 'Title',
              ),
              const SizedBox(
                height: 35,
              ),
              //DeadLine
              const Text(
                'DeadLine',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              ClickableWidget(
                onTap: () async {
                  await TodoCubit.get(context).showDateDialoge(context);
                },
                text:
                    ' ${DateFormat('dd-MM-yyyy').format(TodoCubit.get(context).selectedDay)}',
                iconData: Icons.arrow_downward_outlined,
              ),
              const SizedBox(
                height: 35,
              ),
              //Start and end
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Start time',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ClickableWidget(
                            text:
                                '${TodoCubit.get(context).selectedStartTime.hour}:${TodoCubit.get(context).selectedStartTime.minute} ${TodoCubit.get(context).selectedStartTime.period.toString().substring(10, 12)}',
                            iconData: Icons.access_time_outlined,
                            onTap: () {
                              TodoCubit.get(context)
                                  .showTimePickerStartTime(context);
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'End time',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ClickableWidget(
                            text:
                                '${TodoCubit.get(context).selectedEndTime.hour}:${TodoCubit.get(context).selectedEndTime.minute} ${TodoCubit.get(context).selectedEndTime.period.toString().substring(10, 12)}',
                            iconData: Icons.access_time_outlined,
                            onTap: () {
                              TodoCubit.get(context)
                                  .showTimePickerEndTime(context);
                            }),
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 35,
              ),
              const Text(
                'Reminder',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: DropdownButton(
                  underline: Container(
                    height: 0,
                  ),
                  isExpanded: true,
                  iconSize: 17,
                  icon: Icon(
                    Icons.arrow_downward_outlined,
                    color: Colors.grey.shade400,
                  ),
                  value: TodoCubit.get(context).selectedItemReminder,
                  onChanged: (int? newValue) =>
                      TodoCubit.get(context).setDropDownMenuItem(newValue!),
                  items: TodoCubit.get(context)
                      .reminders!
                      .map((item) => DropdownMenuItem<int>(
                            value: item,
                            child: Text(
                              'after ${item.toString()} minutes',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                      .toList(),
                ),
              ),

              const SizedBox(
                height: 35,
              ),
              const Text(
                'Color',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              Wrap(
                children: List.generate(
                    TodoCubit.get(context).taskColors.length,
                    (index) => InkWell(
                        onTap: () {
                          TodoCubit.get(context).toggleColors(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: CircleAvatar(
                              backgroundColor:
                                  TodoCubit.get(context).taskColors[index],
                              child: TodoCubit.get(context).selectedIndexColor==index
                                  ? const Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : null),
                        ))),
              ),
              const Spacer(),
              CustomButton(
                  onTap: () {
                     TodoCubit.get(context).addTaskToDB(context);
                    Navigator.of(context).pushNamed('/');
                  },
                  buttonText: 'Create Task')
            ]),
          ),
        );
      },
    );
  }

}
