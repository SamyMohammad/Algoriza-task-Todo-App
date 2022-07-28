import 'package:flutter/material.dart';
import 'package:to_do_algoriza/presentation/pages/board_page/board_screen.dart';

import '../presentation/pages/add_task_page/add_task_page.dart';
import '../presentation/pages/schedule_page/schedule_page.dart';

class RouteGenerator {
// RouteGenerator._();
// static RouteGenerator routeGenerator =RouteGenerator._();
// GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const BoardPage());
      case 'SchedulePage':
        return MaterialPageRoute(builder: (context) => const SchedulePage());
      case 'AddTaskPage':
        return MaterialPageRoute(builder: (context) =>  AddTaskPage());

    }

    return null;
  }
}
