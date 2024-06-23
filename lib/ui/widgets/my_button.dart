import '../../../ui_export.dart';

@immutable
class MyButton extends StatelessWidget {
  const MyButton({super.key,
    required this.onPressed,
    required this.child,
    this.color,
  });

  final Function()? onPressed;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      disabledColor: Colors.grey,
      child: child,
    );
  }
}