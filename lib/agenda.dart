import 'evento.dart';

class Agenda {
  Agenda({required this.name, required this.description});

  String name;
  String description;
  List<Evento>? eventos;
}
