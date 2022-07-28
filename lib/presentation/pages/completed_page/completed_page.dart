import 'package:flutter/material.dart';
import 'package:to_do_algoriza/presentation/pages/completed_page/widgets/todo_list.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key}) : super(key: key);
  static const String routeName = 'CompletedPage';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:  [
          Expanded(child:  CompletedTodoList()),

        ],
      ),
    );
  }
}
