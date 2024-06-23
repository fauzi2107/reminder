import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:reminder/features/form/data/model/reminder_model.dart';
import 'package:reminder/handler/permission_handler.dart';
import 'package:reminder/handler/push_notif/push_notif.dart';
import 'package:timezone/timezone.dart' as tz;

class PushNotificationImpl implements PushNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  PushNotificationImpl({required this.flutterLocalNotificationsPlugin});

  @override
  Future init() async {
    // do request notification permission
    await PermissionHandler().notification();
    await PermissionHandler().alarm();

    const initializeAndroid = AndroidInitializationSettings('ic_launcher');
    final initializationSettingsDarwin = DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final initializationSettings = InitializationSettings(
      android: initializeAndroid,
      iOS: initializationSettingsDarwin);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: onTapNotification,
      onDidReceiveBackgroundNotificationResponse: onTapNotificationBackground);
  }

  @override
  Future onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    const androidChannel = AndroidNotificationChannel(
      'saham_rakyat_channel', // id
      'Saham Rakyat', // title
      importance: Importance.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
    );
    final notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        androidChannel.id,
        androidChannel.name,
        icon: 'ic_launcher',
        autoCancel: true,
        priority: Priority.high,
        importance: Importance.max,
        playSound: true,
      ),
      iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
      ),
    );

    flutterLocalNotificationsPlugin.show(
        id, title, body, notificationDetails, payload: payload);
  }

  @override
  Future onTapNotification(NotificationResponse response) {
    // TODO: implement onTapNotification
    throw UnimplementedError();
  }

  @override
  Future scheduleNotification(ReminderModel data) async {
    final times = data.reminderTime.split(' ').first.split(':');

    await flutterLocalNotificationsPlugin.zonedSchedule(
        int.tryParse(data.id ?? '') ?? 0,
        'Reminder',
        'Reminder of ${data.reminderTime}',
        tz.TZDateTime.from(DateTime.now().copyWith(
          hour: int.parse(times.first),
          minute: int.parse(times.last),
          second: 0
        ), tz.getLocation('Asia/Jakarta')),
        const NotificationDetails(
          android: AndroidNotificationDetails(
              'your channel id', 'your channel name',
              channelDescription: 'your channel description')),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );
  }
}

@pragma('vm:entry-point')
Future onTapNotificationBackground(NotificationResponse response) async {
  // TODO: implement onTapNotification
  throw UnimplementedError();
}