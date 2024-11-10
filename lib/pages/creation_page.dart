import 'package:flutter/material.dart';
import 'package:app_agenda/services/task_service.dart';
import 'package:app_agenda/services/event_service.dart';
import 'package:app_agenda/models/task.dart';
import 'package:app_agenda/models/event.dart';

class CreationPage extends StatefulWidget {
  const CreationPage({super.key});

  @override
  _CreationPageState createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isTask = true;

  final TaskService _taskService = TaskService();
  final EventService _eventService = EventService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar evento/tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<bool>(
                value: _isTask,
                items: const [
                  DropdownMenuItem(value: true, child: Text('Tarefa')),
                  DropdownMenuItem(value: false, child: Text('Evento')),
                ],
                onChanged: (value) {
                  setState(() {
                    _isTask = value!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Tipo'),
              ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createItem,
                child: const Text('Criar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createItem() async {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      final description = _descriptionController.text;
      final date = DateTime.now();

      if (_isTask) {
        final taskCount = await _taskService.getTaskCount();
        final task = Task(id: taskCount + 1, title: title, description: description, date: date);
        await _taskService.addTask(task.toJson());
      } else {
        final eventCount = await _eventService.getEventCount();
        final event = Event(id: eventCount + 1, name: title, description: description, date: date);
        await _eventService.addEvent(event.toJson());
      }

      Navigator.pop(context);
    }
  }
}