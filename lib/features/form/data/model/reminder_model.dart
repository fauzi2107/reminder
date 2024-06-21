class ReminderModel {
  final String? id;
  final String reminderTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  static const columnReminderTime = 'reminder_time';
  static const columnCreatedAt = 'created_at';
  static const columnUpdatedAt = 'updated_at';

  ReminderModel({
    this.id,
    required this.reminderTime,
    this.createdAt,
    this.updatedAt
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      id: '${json['id']}',
      reminderTime: json[columnReminderTime],
      createdAt: DateTime.tryParse(json[columnCreatedAt] ?? ''),
      updatedAt: DateTime.tryParse(json[columnUpdatedAt] ?? '')
    );
  }

  Map<String, dynamic> get toJson => {
    columnReminderTime: reminderTime,
    columnCreatedAt: createdAt ?? '${DateTime.now()}',
    columnUpdatedAt: updatedAt,
    if ((id ?? '').isNotEmpty)
      'id': id
  };
}