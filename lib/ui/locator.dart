import 'package:get_it/get_it.dart';

import '../../ui_export.dart';

GetIt locator = GetIt.I;

setupLocator() {
  locator.registerLazySingleton(() => NavigationHandler());
}