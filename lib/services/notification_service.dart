import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  NotificationService() {
    _initializeNotifications();
  }

  void _initializeNotifications() {
    const androidInitSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSInitSettings = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
        android: androidInitSettings, iOS: iOSInitSettings);

    _flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> showReminderNotification(String message) async {
    const androidDetails = AndroidNotificationDetails(
      'reminder_channel',
      'Hatırlatmalar',
      channelDescription: 'Hatırlatıcı bildirimleri',
      importance: Importance.high,
      priority: Priority.high,
    );
    const iOSDetails = DarwinNotificationDetails();
    const platformDetails = NotificationDetails(android: androidDetails, iOS: iOSDetails);

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Dijital Detoks',
      message,
      platformDetails,
    );
  }
}
