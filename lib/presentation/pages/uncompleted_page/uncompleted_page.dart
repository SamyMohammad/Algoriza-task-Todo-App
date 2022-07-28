import 'package:flutter/material.dart';

class UncompletedPage extends StatelessWidget {
  const UncompletedPage({Key? key}) : super(key: key);
static const String routeName = 'UncompletedPage';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child:   Text('UncompletedPage')
      ),
    );
  }
}
