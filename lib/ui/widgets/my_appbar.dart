import '../../../ui_export.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({super.key,
    this.titleWidget,
    this.title,
    this.bgColor,
    this.onBackPressed,
    this.systemUiOverlayStyle,
    this.statusBarColor,
    this.actions = const <Widget>[],
    this.isCenter = true,
    this.showLeading = true,
    this.titleColor,
    this.leading
  });

  final Widget? titleWidget, leading;
  final String? title;
  final Color? bgColor, statusBarColor, titleColor;
  final Function()? onBackPressed;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final List<Widget> actions;
  final bool isCenter, showLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? MyText(title ?? 'Reminder',
        textStyle: MyTextStyle.titleLarge.copyWith(
          fontWeight: FontWeight.w700,
          color: titleColor,
        ),
      ),
      elevation: 0,
      backgroundColor: bgColor,
      leading: !showLeading ? null : leading ?? MyBackButton(
        onPressed: onBackPressed ??
                () => sl<NavigationHandler>().pop(),
      ),
      systemOverlayStyle: systemUiOverlayStyle ??
          SystemUiOverlayStyle.light.copyWith(
            statusBarColor: bgColor ?? Colors.white,
          ),
      actions: actions,
      centerTitle: isCenter,
      toolbarHeight: kToolbarHeight,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
