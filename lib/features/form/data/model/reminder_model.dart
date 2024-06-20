class ReminderModel {
  final String reminderTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  static const columnReminderTime = 'reminder_time';
  static const columnCreatedAt = 'created_at';
  static const columnUpdatedAt = 'updated_at';

  ReminderModel({
    required this.reminderTime,
    this.createdAt,
    this.updatedAt
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      reminderTime: json[columnReminderTime],
      createdAt: DateTime.tryParse(json[columnCreatedAt] ?? ''),
      updatedAt: DateTime.tryParse(json[columnUpdatedAt] ?? '')
    );
  }

  Map<String, dynamic> get toJson => {
    columnReminderTime: reminderTime,
    columnCreatedAt: createdAt,
    columnUpdatedAt: updatedAt
  };
}