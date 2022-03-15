import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

    // final IOSInitializationSettings initializationSettingsIOS =
    // IOSInitializationSettings(
    //   requestSoundPermission: false,
    //   requestBadgePermission: false,
    //   requestAlertPermission: false,
    //   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    // );

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid, iOS: null, macOS: null);

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: selectNotification);
  }

  Future selectNotification(String payload) async {
    //Handle notification tapped logic here
  }

  Future<void> sendNotification(String payload, String text) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "String", //Required for Android 8.0 or after
        "String", //Required for Android 8.0 or after
        "String", //Required for Android 8.0 or after
        importance: Importance.high,
        priority: Priority.high);

    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(12345, payload, text, platformChannelSpecifics, payload: 'data');
  }

  Future<void> sendProgressNotification(String payload, String text, int progress, maxProgress, flutterLocalNotificationsPlugin) async {

    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        "String", //Required for Android 8.0 or after
        "String", //Required for Android 8.0 or after
        "String", //Required for Android 8.0 or after
        importance: Importance.high,
        priority: Priority.high,
        onlyAlertOnce: true,
        showProgress: true,
        progress: progress,
        maxProgress: maxProgress);

    final NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(12345, payload, text, platformChannelSpecifics, payload: 'data');
  }
}
