import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  AwesomeNotifications().initialize(
    'resource://drawable/nama-gambar',
    [
      NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Colors.blue,
          ledColor: Colors.white)
    ],
    debug: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
