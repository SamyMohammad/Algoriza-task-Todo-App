import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_algoriza/data/data_sources/db_helper.dart';
import 'package:to_do_algoriza/presentation/bloc/todo_cubit/todo_cubit.dart';

import 'core/route_manager.dart';
import 'core/theme_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await DbHelper().initialDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit()..createDataBase(),),

      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
          title: 'To Do Algoriza',
          theme: ThemeManager.light


      ),
    );
  }
}
