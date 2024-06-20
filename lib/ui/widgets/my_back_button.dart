import '../../../ui_export.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, this.onPressed});

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: onPressed,
      iconSize: 24,
      padding: EdgeInsets.zero,
    );
  }
}
