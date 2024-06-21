import 'handler/push_notif/push_notif.dart';
import 'ui_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // do initialize setup locator
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: AppTheme.light,
      navigatorKey: sl<NavigationHandler>().navKey,
      onGenerateRoute: onGenerateRoute,
      onGenerateTitle: (ctx) => 'Reminder',
    );
  }
}
