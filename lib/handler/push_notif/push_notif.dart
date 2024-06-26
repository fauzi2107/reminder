import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../ui_export.dart';

abstract class PushNotification {
  Future init();
  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload);
  Future onTapNotification(NotificationResponse response);
  Future scheduleNotification(ReminderModel data);
}