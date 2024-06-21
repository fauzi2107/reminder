part of 'form_bloc.dart';

abstract class FormEvent {
  const FormEvent();
}

class AddReminderEvent extends FormEvent {
  final String reminder;

  AddReminderEvent(this.reminder);
}

class UpdateReminderEvent extends FormEvent {
  final ReminderModel data;

  UpdateReminderEvent({required this.data});
}