import '../../../../ui_export.dart';

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({super.key,
    this.onItemChanged,
    required this.itemLength
  });

  final Function(int)? onItemChanged;
  final int itemLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
