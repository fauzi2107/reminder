import '../../../ui_export.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, this.data});

  final ReminderModel? data;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  String hour = '00', minutes = '00';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormBloc>(
      create: (_) => FormBloc(true),
      child: BlocBuilder<FormBloc, bool>(
        builder: (context, state) {
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
                    title: 'Hour',
                    itemLength: 24,
                    onItemChanged: (value) {
                      hour = value >= 10 ? '$value' : '0$value';
                    },
                  ),
                  SelectionWidget(
                    title: 'Minutes',
                    itemLength: 60,
                    onItemChanged: (value) {
                      minutes = value >= 10 ? '$value' : '0$value';
                    },
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MyButton(
                      onPressed: () => sl<NavigationHandler>().pop(),
                      color: Colors.red,
                      child: const MyText('Cancel',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    MyButton(
                      onPressed: isSaveEnable ? () {
                        context.read<FormBloc>()
                            .add(AddReminderEvent('$hour:$minutes'));
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
      ),
    );
  }

  bool get isSaveEnable => hour.isNotEmpty && minutes.isNotEmpty;
}
