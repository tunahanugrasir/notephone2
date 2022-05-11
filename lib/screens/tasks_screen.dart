import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/add_task_screen.dart';
import 'package:flutter_todo_app/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: (() {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddTaskScreen())));
        }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                    child: Icon(Icons.list_outlined,
                        size: 30, color: Colors.lightBlueAccent),
                    backgroundColor: Colors.white,
                    radius: 30),
                SizedBox(height: 10),
                Text("To-Do",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
                Text('12 Tasks',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
