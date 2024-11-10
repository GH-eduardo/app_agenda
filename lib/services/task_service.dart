import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_agenda/models/task.dart';

class TaskService {
  TaskService();

  final String baseUrl = 'https://localhost:3000/tasks'; // URL do seu json-server

  Future<List<Task>> getTasks() async {
    final response = await http.get(Uri.parse(baseUrl));
    print(response);
    print(response.body);
    print(response.statusCode);

    try {
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load tasks');
      }
    } catch (e) {
      throw Exception('Erro ao buscar tarefas: $e');
    }
  }

  Future<void> addTask(Map<String, dynamic> task) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tasks'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add task');
    }
  }

  Future<void> updateTask(int id, Map<String, dynamic> task) async {
    final response = await http.put(
      Uri.parse('$baseUrl/tasks/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update task');
    }
  }

  Future<void> deleteTask(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/tasks/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete task');
    }
  }

  Future<int> getTaskCount() async {
    final tasks = await getTasks();
    return tasks.length;
  }
}
