import 'ui_export.dart';

void main() {
  // do initialize setup locator
  setupLocator();

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
      navigatorKey: locator<NavigationHandler>().navKey,
      onGenerateRoute: onGenerateRoute,
      onGenerateTitle: (ctx) => 'Reminder',
    );
  }
}
