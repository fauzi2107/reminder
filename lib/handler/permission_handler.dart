import '../ui_export.dart';

class PermissionHandler {

  /// request notification permission android 13 or sdk 33 or higher
  Future<bool> notification() async {
    if (!(await isAndroid13())) return false;

    try {
      const permission = Permission.notification;
      var status = await permission.status;

      if (!status.isGranted) {
        status = await permission.request();
      }

      return status.isGranted;
    } catch (e) {
      return false;
    }
  }

  /// request alarm permission
  Future<bool> alarm() async {
    if (!(await isAndroid13())) return false;

    try {
      const permission = Permission.scheduleExactAlarm;
      var status = await permission.status;

      if (!status.isGranted) {
        status = await permission.request();
      }

      return status.isGranted;
    } catch (e) {
      return false;
    }
  }

  /// func to detect isAndroid 13
  Future<bool> isAndroid13() async {
    if (Platform.isIOS) return false;

    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    return Platform.isAndroid && androidInfo.version.sdkInt >= 33;
  }
}