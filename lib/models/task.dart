class Task {
  Task({required this.id, required this.title, this.description = '', required this.date});

  late int id;
  String title;
  String description;
  DateTime date;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
    };
  }
}
