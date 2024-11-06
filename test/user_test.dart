import 'package:flutter_test/flutter_test.dart';
import 'package:app_agenda/user.dart';

void main() {
  group('instancing tests: ', () {
    User u = User(name: 'pessoa1');

    setUp(() {
      u = User(name: 'pessoa1');
    });

    test('user should have a personal agenda when instanced already', () {
      expect(u.agendaPessoal, isNotNull);
    });

    test('user should have his personal agenda in the list of agendas when instanced', () {
      expect(u.agendas, isNotNull);
    });
  });
}
