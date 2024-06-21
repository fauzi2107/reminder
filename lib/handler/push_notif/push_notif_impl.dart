import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:reminder/handler/permission_handler.dart';
import 'package:reminder/handler/push_notif/push_notif.dart';

class PushNotificationImpl implements PushNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  PushNotificationImpl({required this.flutterLocalNotificationsPlugin});

  @override
  Future init() async {
    // do request notification permission
    await PermissionHandler().notification();

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
        // color: MyColor.primary,
        autoCancel: true,
        // styleInformation: BigTextStyleInformation(notificationBody),
        priority: Priority.high,
        importance: Importance.max,
        playSound: true,
        // sound: RawResourceAndroidNotificationSound('notification'),
      ),
      iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          // attachments: iosNotifAttach,
          // sound: 'notification.wav'
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
}

@pragma('vm:entry-point')
Future onTapNotificationBackground(NotificationResponse response) async {
  // TODO: implement onTapNotification
  throw UnimplementedError();
}