import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class PushNotification {
  Future init();
  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload);
  Future onTapNotification(NotificationResponse response);
}