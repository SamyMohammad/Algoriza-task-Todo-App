import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_algoriza/data/data_sources/db_helper.dart';
import 'package:to_do_algoriza/data/models/task_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  static TodoCubit get(BuildContext context) => BlocProvider.of(context);
  DateTime selectedDayScheduled = DateTime.now();
  DateTime focusedDayScheduled = DateTime.now();
  setNewSelectedDayInSchedule(DateTime selectedDay) {
    selectedDayScheduled = selectedDay;
     emit(SetSelectedDayState());
  }
  //AddTask

  DateTime selectedDay = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();
  List<int>? reminders = [5, 10, 15, 20];
  int selectedItemReminder = 5;
  int selectedIndexColor = 0;
  List<Color> taskColors = [Colors.red, Colors.orange, Colors.blue];
  showDateDialoge(BuildContext context) {
    return showDatePicker(
            context: context,
            initialDate: selectedDay,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)))
        .then((date) {
      selectedDay = date!;
      emit(SetDeadLineDayState());

      if (kDebugMode) {
        print('in date');
      }
    });
  }

  showTimePickerStartTime(BuildContext context) {
    return showTimePicker(context: context, initialTime: selectedStartTime)
        .then((time) {
      selectedStartTime = time!;
      emit(SetNewStartTimeState());
    });
  }

  showTimePickerEndTime(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: selectedEndTime,
    ).then((time) {
      selectedEndTime = time!;
      emit(SetNewEndTimeState());
    });
  }

  setDropDownMenuItem(int newValue) {
    selectedItemReminder = newValue;
    emit(SetDropDownMenuItemState());
  }

  toggleColors(int newIndex) {
    selectedIndexColor = newIndex;
    emit(IsColorSelected());
  }

  //sqflite functions
   TaskModel? taskModel;
  List<TaskModel> tasksList = [];
  List<TaskModel> completedTasks = [];
  List<TaskModel> uncompletedTasks = [];

  TextEditingController titleController = TextEditingController();
   createDataBase() async {
    await DbHelper.initialDb();
    readAllData();
    debugPrint('dataBase fetched');
    emit(AppCreateDatabaseState());
  }


  addData(TaskModel taskModel) async{
   return await DbHelper.insertData(taskModel);

  }

  readAllData() async {
     tasksList=[];
     completedTasks=[];
     uncompletedTasks=[];
    List<Map<String, dynamic>> tasks = await DbHelper.readData();
    tasksList = tasks.map((data) => TaskModel.fromJson(data)).toList();
    for (var element in tasksList) {
      if (kDebugMode) {
        print(element.isCompleted);
        emit(AddToCompletedState());
      }
      if(element.isCompleted==1){
completedTasks.add(element);
      } if(element.isCompleted==0){
        uncompletedTasks.add(element);
      }
    }

    emit(AppReadDatabaseState());
  }
  // readCompletedData() async {
  //   List<Map<String, dynamic>> tasks = await DbHelper.readData();
  //   tasksList = tasks.map((data) => TaskModel.fromJson(data)).toList();
  //   tasksList.forEach((element) {
  //     if(element.isCompleted==1){
  //       completedTasks.add(element);
  //     } if(element.isCompleted==0){
  //       uncompletedTasks.add(element);
  //     }
  //   });
  //   debugPrint(tasksList.toString());
  //   emit(AppReadDatabaseState());
  // }

  addTaskToDB(BuildContext context)async{
    int value = await addData(
      TaskModel(
        title: titleController.text,
        date: DateFormat.yMd().format(selectedDay),
        startTime: selectedStartTime.format(context),
        endTime: selectedEndTime.format(context),
        color: selectedIndexColor,
        reminder: selectedItemReminder

      )
    );
    readAllData();
    debugPrint('data fetched');

    emit(AppInsertDatabaseState());
  }

  deleteData() async {
    await DbHelper.deleteData(taskModel);
    readAllData();
  }

  markAsCompleted(int id,int isCompleted) async {
    await DbHelper.updateData('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id = ?
    ''', id,isCompleted);
    print('is completed');
    readAllData();
  }

  // markAsUnCompleted(int id) async {
  //   await DbHelper.updateData('''
  //   UPDATE tasks
  //   SET isUnCompleted = ?
  //   WHERE id = ?
  //   ''', id);
  //   readData();
  // }
  //
  // markAsFavourite(int id) async {
  //   await DbHelper.updateData('''
  //   UPDATE tasks
  //   SET isFavourite = ?
  //   WHERE id = ?
  //   ''', id);
  //   readData();
  // }

  // void updateDatabase(String status, int id) async {
  //  await dbHelper!.updateData('''
  //   UPDATE ${dbHelper!.getDatabase}
  //   SET isCompleted
  //   WHERE id = ?
  //   ''', id);
  //     emit(AppUpdateDatabaseState());
  // }
  //
  // void deleteFromDatabase(int id) async {
  //   database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
  //     getDataBase(database);
  //     emit(AppDeleteDatabaseState());
  //   });
  // }
  //
  // void createDatabase() {
  //   openDatabase(
  //     'todo.db',
  //     version: 1,
  //     onCreate: (database, version) {
  //       database
  //           .execute(
  //         //id integer
  //         //title string
  //         //data string
  //         //time string
  //         //status string
  //           'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
  //           .then((value) => print('Table Created'))
  //           .catchError((error) {
  //         print('Error When Creating Table ${error.toString()}');
  //       });
  //     },
  //     onOpen: (database) {
  //       getDataBase(database);
  //       print('database opened');
  //     },
  //   ).then((value) {
  //     database = value;
  //     emit(AppCreateDatabaseState());
  //   });
  // }
  //
  // void getDataBase(database) async {
  //   newTasks = [];
  //   doneTasks = [];
  //   archivedTasks = [];
  //   database!.rawQuery('SELECT * FROM tasks').then((value) {
  //     //print(value);
  //     value.forEach((element) {
  //       print(element['id']);
  //       if (element['status'] == 'New') {
  //         newTasks.add(element);
  //       } else if (element['status'] == 'done') {
  //         doneTasks.add(element);
  //       } else {
  //         archivedTasks.add(element);
  //       }
  //     });
  //     emit(AppGetDatabaseState());
  //   });
  // }
  //
  // inserToDatabase(
  //     {required String title,
  //       required String time,
  //       required String date}) async {
  //   await database!.transaction((txn) async {
  //     txn
  //         .rawInsert(
  //         'INSERT INTO tasks (title, date, time, status) VALUES ("$title","$date","$time","New")')
  //         .then((value) {
  //       getDataBase(database);
  //       print('$value Inserted Successfully');
  //       emit(AppInsertDatabaseState());
  //     }).catchError((error) {
  //       print('Error When inserting Table ${error.toString()}');
  //     });
  //   });
  // }
bool? isSelectedCheckBox= false;
   changeCheckBox(bool? newValue,int id,int isCompleted,TaskModel taskModel) {
    if (newValue != isSelectedCheckBox) {
      isSelectedCheckBox = newValue;
      if(isSelectedCheckBox==false){
        taskModel.isCompleted = 0;
      }
      else{
        taskModel.isCompleted = 1;

      }
    }
    markAsCompleted(id,isCompleted);
    print(taskModel.isCompleted);
    emit(TodoCubitCheckBoxChangedState());
  }
}
