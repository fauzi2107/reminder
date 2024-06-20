import '../../../ui_export.dart';

Future<T?> showMyDialog<T>(BuildContext context, {
  required Widget child
}) {
  return showDialog<T?>(
    context: context,
    builder: (ctx) {
      return MyDialog(child: child);
    }
  );
}

class MyDialog extends StatelessWidget {
  const MyDialog({super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
          minHeight: MediaQuery.of(context).size.height * 0.25
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 20
        ),
        child: child,
      ),
    );
  }
}
