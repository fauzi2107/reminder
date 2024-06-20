part of 'my_theme.dart';

class MyTextTheme {
  static TextTheme light = ThemeData.light().textTheme.copyWith(
    displayLarge: MyTextStyle.displayLarge,
    displayMedium: MyTextStyle.displayMedium,
    displaySmall: MyTextStyle.displaySmall,
    headlineMedium: MyTextStyle.headlineMedium,
    headlineSmall: MyTextStyle.headlineSmall,
    titleLarge: MyTextStyle.titleLarge,
    bodyLarge: MyTextStyle.bodyLarge,
    bodyMedium: MyTextStyle.bodyMedium,
    bodySmall: MyTextStyle.bodySmall,
    titleMedium: MyTextStyle.titleMedium,
    titleSmall: MyTextStyle.titleSmall,
    labelLarge: MyTextStyle.labelLarge,
    labelSmall: MyTextStyle.labelSmall,
  );
}