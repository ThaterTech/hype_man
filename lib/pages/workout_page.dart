import 'package:flutter/material.dart';
import 'package:hype_man/components/about_dialog_button.dart';
import 'package:hype_man/components/exercise_panel.dart';
import 'package:hype_man/models/workout.dart';
import 'package:hype_man/models/workout_set.dart';

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
            ExercisePanel(workout: Workout(id: 1, name: 'Squat', sets: [
              WorkoutSet(id: 1, targetReps: 5, actualReps: 0, weight: 100),
              WorkoutSet(id: 2, targetReps: 5, actualReps: 0, weight: 125),
              WorkoutSet(id: 3, targetReps: 5, actualReps: 0, weight: 150),
              WorkoutSet(id: 4, targetReps: 5, actualReps: 0, weight: 175),
              WorkoutSet(id: 5, targetReps: 5, actualReps: 0, weight: 200),
            ])),
            ExercisePanel(workout: Workout(id: 1, name: 'Bench', sets: [
              WorkoutSet(id: 1, targetReps: 5, actualReps: 0, weight: 100),
              WorkoutSet(id: 2, targetReps: 5, actualReps: 0, weight: 125),
              WorkoutSet(id: 3, targetReps: 5, actualReps: 0, weight: 150),
              WorkoutSet(id: 4, targetReps: 5, actualReps: 0, weight: 175),
              WorkoutSet(id: 5, targetReps: 5, actualReps: 0, weight: 200),
            ])),
            ExercisePanel(workout: Workout(id: 1, name: 'Barbell Row', sets: [
              WorkoutSet(id: 1, targetReps: 5, actualReps: 0, weight: 100),
              WorkoutSet(id: 2, targetReps: 5, actualReps: 0, weight: 125),
              WorkoutSet(id: 3, targetReps: 5, actualReps: 0, weight: 150),
              WorkoutSet(id: 4, targetReps: 5, actualReps: 0, weight: 175),
              WorkoutSet(id: 5, targetReps: 5, actualReps: 0, weight: 200),
            ])),
            const AboutDialogButton(),
          ],
        ),
      ),
    );
  }
}