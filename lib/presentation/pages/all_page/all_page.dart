import 'package:flutter/material.dart';
import 'package:to_do_algoriza/data/models/task_model.dart';
import 'package:to_do_algoriza/presentation/pages/add_task_page/add_task_page.dart';
import 'package:to_do_algoriza/presentation/pages/all_page/widgets/todo_list.dart';
import 'package:to_do_algoriza/presentation/reusable_components/default_button.dart';

class AllPage extends StatelessWidget {
   AllPage({Key? key}) : super(key: key);
  static const String routeName = 'AllPage';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:  [
          Expanded(child:  TodoList()),

        ],
      ),
    );
  }
}
