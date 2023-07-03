import 'package:flutter/material.dart';


class Task {
  String title;
  String description;
  String days;

  Task(
      {required String this.title,
        required String this.description,
        required String this.days});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tasks = [];

  void AddTask(task) {
    setState(() {
      tasks.add(task);
    });
  }

  void DeleteTask(task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void showTaskDetails(Task task) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        String title = task.title;
        String description = task.description;
        String days = task.days;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                title: Text(
                  "Title:   $title",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Description:   $description",
                      style: TextStyle(color: Colors.blue),
                    ),
                    Text(
                      "Days Remaining:   $days",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    DeleteTask(task);
                    Navigator.pop(context);
                  },
                  child: Text("Delete"),
                )),
          ],
        );
      },
    );
  }

  void showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';
        String description = '';
        String days = '';

        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  description = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Days Required'),
                onChanged: (value) {
                  days = value;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                AddTask(Task(
                  title: title,
                  description: description,
                  days: days,
                ));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Management App"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  onTap: () {
                    showTaskDetails(task);
                  },
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
