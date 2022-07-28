import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:test2_algoriza/presentaion/todo/pages/todo/todo_screen/widgets/to_do_widget.dart';

import '../../../../../core/unit/notification/notification.dart';
import '../../../../../utils/const/const.dart';
import '../../../../../utils/styles/icon_broken.dart';
import '../../calender/calender_screen/calender.dart';

class TodoScreen extends StatefulWidget {

  const TodoScreen({Key? key,}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(context: context, builder: (context)=> AlertDialog(title:Text('Allow Notification'),
        content: Text('Our App would like to send tou Notification'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Don\t Allow',style: TextStyle(
              color: Colors.grey,
              fontSize: 18
            ),)),
            TextButton(onPressed: (){
              AwesomeNotifications().requestPermissionToSendNotifications().then((_) => Navigator.pop(context));
            },
                child: Text('Allow',style: TextStyle(
              color: Colors.teal,
              fontSize: 18,
                  fontWeight: FontWeight.bold
            ),)),
          ],
        ));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Board',
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(context, CalenderScreen());
              },
              icon: const Icon(IconBroken.Calendar)),
          IconButton(
              onPressed:createNotification,

          icon: const Icon(Icons.notifications)),
        ],
      ),
      body: const TodoWidget(),
    );
  }
}
