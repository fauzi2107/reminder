import 'package:reminder/handler/push_notif/push_notif.dart';
import 'package:reminder/ui_export.dart';

part 'form_event.dart';

class FormBloc extends Bloc<FormEvent, bool> {
  FormBloc(super.initialState) {
    on<AddReminderEvent>(_addReminder);
    on<UpdateReminderEvent>(_updateReminder);
  }

  /// Add/Insert new reminder to local database
  Future _addReminder(AddReminderEvent event, Emitter emit) async {
    final data = ReminderModel(reminderTime: event.reminder);
    await DbHelper.instance.add(data.toJson).whenComplete(() async {
      sl<PushNotification>().scheduleNotification(data);
      sl<NavigationHandler>().pop();
    });
  }

  /// Update reminder to local database
  Future _updateReminder(UpdateReminderEvent event, Emitter emit) async {
    await DbHelper.instance.update(event.data.toJson).whenComplete(() {
      sl<NavigationHandler>().pop();
    });
  }
}