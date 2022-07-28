import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

Future<void> createNotification()async {

 await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'basic_channel',
          title: 'Simple Notification',
          body: 'Simple body'
      )
  );
}

Future<void> createScheduledNotification({
  required int week,
  required int timeOfDayHour,
  required int timeOfDayMinute,
  required int day,
  required int month,
  required int year,
  required String title,
  required String note,

}) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'scheduled_channel',
      title: title,
      body: note,
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'MARK_DONE',
        label: 'Mark Done',
      ),
    ],
    schedule: NotificationCalendar(
      day: day,
      month: month,
      year: year,
      hour: timeOfDayHour,
      minute: timeOfDayMinute,
      second: 0,
      millisecond: 0,
      repeats: true,
    ),
  );
}



Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}

Future<void> cancelScheduledNotificationsById(id) async {
  await AwesomeNotifications().cancelSchedule(id);
}





int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}
// class NotificationWeekAndTime {
//   final int dayOfTheWeek;
//   final TimeOfDay timeOfDay;
//
//   NotificationWeekAndTime({
//     required this.dayOfTheWeek,
//     required this.timeOfDay,
//   });
// }
//
// Future<NotificationWeekAndTime?> pickSchedule(
//     BuildContext context,
//     ) async {
//   List<String> weekdays = [
//     'Mon',
//     'Tue',
//     'Wed',
//     'Thu',
//     'Fri',
//     'Sat',
//     'Sun',
//   ];
//   TimeOfDay? timeOfDay;
//   DateTime now = DateTime.now();
//   int? selectedDay;
//
//   await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             'I want to be reminded every:',
//             textAlign: TextAlign.center,
//           ),
//           content: Wrap(
//             alignment: WrapAlignment.center,
//             spacing: 3,
//             children: [
//               for (int index = 0; index < weekdays.length; index++)
//                 ElevatedButton(
//                   onPressed: () {
//                     selectedDay = index + 1;
//                     Navigator.pop(context);
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                       Colors.teal,
//                     ),
//                   ),
//                   child: Text(weekdays[index]),
//                 ),
//             ],
//           ),
//         );
//       });
//
//   if (selectedDay != null) {
//     timeOfDay = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.fromDateTime(
//           now.add(
//             Duration(minutes: 1),
//           ),
//         ),
//         builder: (BuildContext context, Widget? child) {
//           return Theme(
//             data: ThemeData(
//               colorScheme: ColorScheme.light(
//                 primary: Colors.teal,
//               ),
//             ),
//             child: child!,
//           );
//         });
//
//     if (timeOfDay != null) {
//       return NotificationWeekAndTime(
//           dayOfTheWeek: selectedDay!, timeOfDay: timeOfDay);
//     }
//   }
//   return null;
// }