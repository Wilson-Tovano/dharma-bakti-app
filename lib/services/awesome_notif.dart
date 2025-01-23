import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class MyNotification {
  late BuildContext context;
  MyNotification(BuildContext context) {
    this.context = context;
  }

  Future<void> createBasicNotification() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications()
            .requestPermissionToSendNotifications()
            .then((_) => Navigator.pop(context));
      }
    });

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'basic_channel',
        title: 'Pembayaran SPP!',
        body: 'Sukses membayar SPP',
      ),
    );
  }

  Future<void> homeworkNotif(String mapel) async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications()
            .requestPermissionToSendNotifications()
            .then((_) => Navigator.pop(context));
      }
    });

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'basic_channel',
        title: mapel,
        body: 'Tugas telah dikumpulkan!',
      ),
    );
  }

  Future<void> createScheduleNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: "schedule_channel",
        title: "Ingat agar tidak terlambat ke sekolah",
        body: "Semangat merupakan bahan bakar menuju kemenangan",
      ),
      schedule: NotificationCalendar.fromDate(
        date: DateTime.now().add(
          const Duration(seconds: 60),
        ),
      ),
    );
  }
}
