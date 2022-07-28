part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}
class TodoCubitCheckBoxChangedState extends TodoState {}
class SetSelectedDayState extends TodoState {}
class SetNewStartTimeState extends TodoState {}
class SetNewEndTimeState extends TodoState {}
class SetDeadLineDayState extends TodoState {}
class SetDropDownMenuItemState extends TodoState {}
class IsColorSelected extends TodoState {}
class AppUpdateDatabaseState extends TodoState {}
class AppDeleteDatabaseState extends TodoState {}
class AppCreateDatabaseState extends TodoState {}
class AppReadDatabaseState extends TodoState {}
class AppInsertDatabaseState extends TodoState {}
class AddToCompletedState extends TodoState {}