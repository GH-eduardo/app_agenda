class Event {
  Event({required this.id, required this.name, this.description = '', required this.date});

  late int id;
  String name;
  String description;
  DateTime date;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date.toIso8601String(),
    };
  }
}
