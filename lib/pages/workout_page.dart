import 'package:flutter/material.dart';
import 'package:hype_man/components/about_dialog_button.dart';
import 'package:hype_man/components/exercise_panel.dart';

class WorkoutPage extends StatefulWidget {

  const WorkoutPage({super.key, required this.id});

  final int? id;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {

  @override
  Widget build(BuildContext context) {
    final int? id = widget.id;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('$id'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Workout Id: $id',
            ),
            const ExercisePanel(setName: 'Squat', repCount: 5, setCount: 5, setWeight: 305),
            const ExercisePanel(setName: 'Bench Press', repCount: 5, setCount: 4, setWeight: 225),
            const ExercisePanel(setName: 'Barbell Row', repCount: 5, setCount: 5, setWeight: 195),
            const AboutDialogButton(),
          ],
        ),
      ),
    );
  }
}