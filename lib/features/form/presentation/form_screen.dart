import '../../../ui_export.dart';

class FormScreen extends StatefulWidget {
  static const routeName = '/form_screen';

  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  late String isDay;
  String hour = '00', minutes = '00';

  @override
  void initState() {
    isDay = DateTime.now().hour <= 12 ? 'AM' : 'PM';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      children: [
        const Align(
          alignment: Alignment.center,
          child: MyText('Add Reminder',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            margin: EdgeInsets.only(bottom: 20),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SelectionWidget(
              itemLength: 12,
              onItemChanged: (value) {
                hour = '$value';
              },
            ),
            SelectionWidget(
              itemLength: 60,
              onItemChanged: (value) => minutes = '$value',
            ),
            Column(
              children: ['AM','PM'].map((e) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isDay = e;
                    });
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: isDay == e ? Colors.grey.shade400 : null
                      ),
                      padding: const EdgeInsets.all(6),
                      child: MyText(e,
                        fontSize: 22,
                      )
                  ),
                );
              }).toList(),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyButton(
                onPressed: () => locator<NavigationHandler>().pop(),
                color: Colors.red,
                child: const MyText('Cancel',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              MyButton(
                onPressed: isSaveEnable ? () async {
                  await DbHelper.instance.add(ReminderModel(
                    reminderTime: '$hour:$minutes $isDay'
                  ).toJson).whenComplete(() {
                    locator<NavigationHandler>().pop();
                  });
                } : null,
                color: Colors.green,
                child: const MyText('Save',
                  fontSize: 14,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  bool get isSaveEnable => hour.isNotEmpty && minutes.isNotEmpty;
}
