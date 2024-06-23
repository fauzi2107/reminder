import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:reminder/handler/push_notif/push_notif.dart';
import 'package:reminder/handler/push_notif/push_notif_impl.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../ui_export.dart';

GetIt sl = GetIt.I;

setupLocator() async {
  sl.registerLazySingleton(() => NavigationHandler());

  sl.registerLazySingleton(() => FlutterLocalNotificationsPlugin());
  sl.registerLazySingleton<PushNotification>(() => PushNotificationImpl(
    flutterLocalNotificationsPlugin: sl<FlutterLocalNotificationsPlugin>()
  ));
  await sl<PushNotification>().init();
  tz.initializeTimeZones();
}