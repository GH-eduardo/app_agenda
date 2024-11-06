import 'agenda.dart';

class User {
  User({required this.name}) {
    agendas.add(agendaPessoal);
  }

  String name;
  Agenda agendaPessoal =
      Agenda(name: 'Agenda Pessoal', description: 'Sua agenda pessoal');
  List<Agenda> agendas = [];

  @override
  String toString() {
    List<String> nomesAgendas = [];
    for (var i = 0; i < agendas.length; i++) {
      nomesAgendas.add(agendas[i].name);
    }
    return nomesAgendas.toString();
  }

  void adicionarAgenda(Agenda a) {
    agendas.add(a);
  }
}
