import '../../../ui_export.dart';

part 'my_text_theme.dart';
part 'my_text_style.dart';

class AppTheme implements MyTextTheme, MyTextStyle {
  static ThemeData light = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: "Poppins",
      primaryColor: MyColor.primary,
      buttonTheme: ButtonThemeData(
        buttonColor: MyColor.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        disabledColor: MyColor.disableColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(
                  vertical: 7, horizontal: 12
              )),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              )),
              // backgroundColor: MaterialStatePropertyAll(VColor.PRIMARY),
              elevation: const MaterialStatePropertyAll(0)
          )
      ),
      textTheme: MyTextTheme.light,
      primaryTextTheme: MyTextTheme.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: MyColor.primary
      )
  );
}