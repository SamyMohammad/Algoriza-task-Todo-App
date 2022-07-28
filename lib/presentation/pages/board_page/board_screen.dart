import 'package:flutter/material.dart';
import 'package:to_do_algoriza/data/models/task_model.dart';
import 'package:to_do_algoriza/presentation/pages/schedule_page/schedule_page.dart';

import '../../../core/constants.dart';
import '../../reusable_components/default_button.dart';
import '../add_task_page/add_task_page.dart';
import '../all_page/all_page.dart';
import '../completed_page/completed_page.dart';
import '../favourits_page/favourits_page.dart';
import '../uncompleted_page/uncompleted_page.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> with TickerProviderStateMixin {
// static const String routeName ='BoardPage';
// late TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(

            title: const Text('Board'),

            // elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SchedulePage.routeName);
                  },
                  icon: const Icon(Icons.calendar_month_outlined)),
              const SizedBox(
                width: 19,
              ),
            ],
            bottom: const TabBar(

              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: Colors.black)),
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.only(left: 10, right: 10),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              // isScrollable: true,
              tabs: tabs,
            ),
          ),
          body: Column(
            children: [
               Expanded(
                child: TabBarView(children: [
                  AllPage(),
                  CompletedPage(),
                  UncompletedPage(),
                  FavouritesPage(),
                ]),
              ),
              SizedBox(height: 40,),
              CustomButton(onTap: (){Navigator.of(context).pushNamed(AddTaskPage.routeName);}, buttonText: 'Add Task')
            ],
          )),
    );
  }
}
