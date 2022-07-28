import 'package:flutter/material.dart';
import 'package:to_do_algoriza/core/size_config.dart';

const List<Widget> tabs = [
  Tab(child: Text('All')),
  Tab(child: Text('Completed')),
  Tab(child: Text('Uncompleted')),
  Tab(child: Text('Favourites')),
];


  String getMonthString(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Err';
    }
  }



  String? getDayString(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';

    }

  }
