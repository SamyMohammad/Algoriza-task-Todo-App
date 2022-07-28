import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_algoriza/core/constants.dart';
import 'package:to_do_algoriza/presentation/bloc/todo_cubit/todo_cubit.dart';
import 'package:to_do_algoriza/presentation/pages/schedule_page/widgets/scheduled_todos_list.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);
  static const String routeName = 'SchedulePage';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        DateTime selectedDate = TodoCubit.get(context).selectedDayScheduled;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Schedule'),
            leading: const BackButton(color: Colors.black),
          ),
          body: Container(

            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DatePicker(
                  monthTextStyle: const TextStyle(fontSize: 0),
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Colors.green,
                  selectedTextColor: Colors.white,
                  onDateChange: TodoCubit.get(context).setNewSelectedDayInSchedule,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(color: Colors.grey,thickness: .9,),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    children: [
                      Text(
                        getDayString(selectedDate)!,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                       Text(
                        '${selectedDate.day} ${getMonthString(selectedDate.month)} , ${selectedDate.year}' ,
                        style: const TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                 Expanded(child: ScheduledTodosList())
              ],
            ),
          ),
        );
      },
    );
  }
}
//table

// TableCalendar(
//
// daysOfWeekStyle: const DaysOfWeekStyle(
// decoration: BoxDecoration(color: Colors.green)),
// headerVisible: false,
// selectedDayPredicate: (day) {
// return isSameDay(ScheduleCubit.get(context).selectedDay, day);
// },
// onDaySelected: (sDay, fDay) {
// ScheduleCubit.get(context).setNewSelectedDay(sDay);
// ScheduleCubit.get(context).focusedDay = fDay;
// Future.delayed(const Duration(milliseconds: 500), () {
// // listProvider.refreshTodo();
// });
// },
// weekendDays: const [],
// calendarStyle: CalendarStyle(
// selectedDecoration: BoxDecoration(
// color: Colors.green,
// borderRadius: BorderRadius.circular(8)),
// selectedTextStyle: const TextStyle(color: Colors.white),
// todayDecoration: BoxDecoration(
// color: Colors.grey,
// borderRadius: BorderRadius.circular(8)),
// todayTextStyle: const TextStyle(color: Colors.white),
// defaultDecoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(8)),
// defaultTextStyle: const TextStyle(color: Colors.black)),
// calendarFormat: CalendarFormat.week,
// focusedDay: ScheduleCubit.get(context).focusedDay,
// firstDay: DateTime.now().subtract(const Duration(days: 365)),
// lastDay: DateTime.now().add(const Duration(days: 365)),
// )
