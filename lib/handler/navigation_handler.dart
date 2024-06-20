import 'package:flutter/cupertino.dart';
import 'package:reminder/features/form/presentation/form_screen.dart';

import '../features/home/presentation/home_screen.dart';
import '../ui_export.dart';

class NavigationHandler {
  // global navigation key
  final navKey = GlobalKey<NavigatorState>();

  // func action back to previous screen with optional return value
  void pop({Object? data}) => navKey.currentState!.pop(data);

  // func action checking whether screen can be popped or has previous screen
  bool canPop() => navKey.currentState!.canPop();

  // func action to next screen with [routeName] and optional passing an [arguments]
  Future<T?> pushTo<T extends Object>(String routeName, {
    Object? arguments
  }) async {
    return await navKey.currentState!.pushNamed(routeName, arguments: arguments);
  }
}

Route? onGenerateRoute(RouteSettings settings) {
  Route<dynamic>? builder({
    Widget child = const Scaffold(),
    Widget Function(BuildContext context)? builder
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        builder: builder ?? (ctx) => child,
        settings: settings,
      );
    }

    return MaterialPageRoute(
      builder: builder ?? (ctx) => child,
      settings: settings,
    );
  }

  if (settings.name == HomeScreen.routeName) {
    return builder(child: const HomeScreen());
  }

  return null;
}