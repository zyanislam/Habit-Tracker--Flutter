// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:habit_tracker/components/toggle_switch.dart';
import 'package:habit_tracker/database/habit_database.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // read the exisiting habits in the database
    Provider.of<HabitDatabase>(context, listen: false).readHabits();

    super.initState();
  }

  final TextEditingController textController = TextEditingController();

  void createHabib() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: InputDecoration(hintText: "Create a new habit!"),
        ),
        actions: [
          // save button
          MaterialButton(
            onPressed: () {
              String newHabit = textController.text;

              context.read<HabitDatabase>().addHabit(newHabit);
              Navigator.pop(context);
              textController.clear();
            },
            child: Text("Save"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              textController.clear();
            },
            child: Text("Cancel"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HabitTracker"),
        centerTitle: true,
        actions: const <Widget>[
          Toggle(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createHabib,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: _buildHabitList,
    );
  }

  Widget _buildHabitList() {
    // Habit DB
    final habitDatabase = context.watch<HabitDatabase>();

    // current habits in the list
    List<Habit> currentHabits = habitDatabase.currentHabits;

    // return list of habits
    return ListView.builder(
      itemCount: currentHabits.length(),
      itemBuilder: (context, index) {
        // get each individual habit
        final habit = currentHabits[index];
        // check if the habit is completed today
        bool isCompletedToday = isHabitCompletedToday();
        // return habit UI
      },
    );
  }
}
