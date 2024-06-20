import '../../../../ui_export.dart';

class HomeItem extends StatefulWidget {
  const HomeItem({super.key, required this.item});

  final ReminderModel item;

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {

  var isActive = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12)
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: MyText(widget.item.reminderTime,
              fontSize: 22,
            ),
          ),
          Switch(
            value: isActive,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            inactiveThumbColor: Colors.black12,
            onChanged: (isActive) {
              setState(() {
                this.isActive = isActive;
              });
            },
          )
        ],
      ),
    );
  }
}
