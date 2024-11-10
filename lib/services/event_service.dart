import 'dart:convert';
import 'package:http/http.dart' as http;

class EventService {

  EventService();

  final String baseUrl = 'http://192.168.0.203:3000'; // URL do seu json-server

  Future<List<dynamic>> getEvents() async {
    final response = await http.get(Uri.parse('$baseUrl/events'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<void> addEvent(Map<String, dynamic> event) async {
    final response = await http.post(
      Uri.parse('$baseUrl/events'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(event),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add event');
    }
  }

  Future<void> updateEvent(int id, Map<String, dynamic> event) async {
    final response = await http.put(
      Uri.parse('$baseUrl/events/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(event),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update event');
    }
  }

  Future<void> deleteEvent(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/events/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete event');
    }
  }

  Future<int> getEventCount() async {
    final events = await getEvents();
    return events.length;
  }
}