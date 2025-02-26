import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("ic_launcher");
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false);

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: receivedNotificationResponse,
    );
  }

  void receivedNotificationResponse(NotificationResponse notificationResponse) {
    final String? payload = notificationResponse.payload;
    print(payload);
    if (notificationResponse.payload != null) {
      print(payload);
    }
  }

  Future<void> requestPermissions() async {
    if (Platform.isAndroid) {
      bool isGranted = await Permission.scheduleExactAlarm.isGranted;
      if (!isGranted) {
        await Permission.scheduleExactAlarm.request();
      }
    }
  }

  Future<void> scheduleNotification(
      int id, String title, String body, Duration duration) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(duration),
        const NotificationDetails(
          android: AndroidNotificationDetails("id", "tasks"),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: title);
  }
}
