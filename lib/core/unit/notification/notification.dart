import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

Future<void> createNotification()async {

 await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'basic_channel',
          title: 'Simple Notification',
          body: 'Simple body',
         // 'asset://assets/notification_map.png',
        bigPicture: 'asset://assets/notification_map.png',
        notificationLayout: NotificationLayout.BigPicture,

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
      bigPicture: 'asset://assets/notification_map.png',
      notificationLayout: NotificationLayout.BigPicture,    ),
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
