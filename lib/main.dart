import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test2_algoriza/presentaion/todo/pages/todo/todo_screen/todo_screen.dart';

import 'core/unit/blocs/app/cubit.dart';
import 'core/unit/blocs/app/states.dart';

void main()async {
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          //defaultColor: Color(0xFF9D50DD),
          importance: NotificationImportance.High,
          channelShowBadge: true,
          channelDescription: 'tests',
          ledColor: Colors.white
      ),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'scheduled notifications',
        // defaultColor: Color(0xFF9D50DD),
        locked: true,
        importance: NotificationImportance.High,
        channelDescription: 'tests',
      ),
    ],

  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => AppBloc()..initDataBase() ),
        ],
        child: BlocConsumer<AppBloc, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(

                    primarySwatch: Colors.blue,
                  ),
                  home:const TodoScreen()
              );
            }
        )
    );
  }
}

