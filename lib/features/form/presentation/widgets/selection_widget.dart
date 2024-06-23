import '../../../../ui_export.dart';

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({super.key,
    this.onItemChanged,
    required this.itemLength,
    required this.title
  });

  final Function(int)? onItemChanged;
  final int itemLength;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyText(title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          margin: EdgeInsets.only(bottom: 12),
        ),
        SizedBox(
          height: 120,
          width: 50,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 60,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: onItemChanged,
            overAndUnderCenterOpacity: 0.25,
            childDelegate: ListWheelChildLoopingListDelegate(
              children: List.generate(itemLength, (index) {
                var val = '$index';
                if (val.length == 1) {
                  val = '0$val';
                }

                return Align(
                  alignment: Alignment.center,
                  child: MyText(val,
                    fontSize: 32,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
