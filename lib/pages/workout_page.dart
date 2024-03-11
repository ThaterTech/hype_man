import 'package:flutter/material.dart';
import 'package:hype_man/components/about_dialog_button.dart';
import 'package:hype_man/components/exercise_panel.dart';
import 'package:hype_man/models/workout.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WorkoutPage extends StatefulWidget {

  const WorkoutPage({super.key, required this.id});

  final int? id;

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {

  Workout workout = buildWorkoutExample();

  void _activeCallback(int index) {
    if (workout.exercises[index].isComplete() && index != workout.exercises.length - 1) {
      index++;
    }

    setState(() {
      workout.lastExercise = index;
    });
  }

  List<Widget> _buildWorkouts(Workout workout) {
    int currentWorkout = workout.getCurrentExercise();
    List<Widget> list = [
      for (var i = 0; i < workout.exercises.length; i++)
        ExercisePanel(
          index: i,
          exercise: workout.exercises[i], 
          activePanel: i == currentWorkout, 
          activeCallback: _activeCallback)
    ];
      
    return list;
  }

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
            Text(AppLocalizations.of(context)!.workout_page__title('$id')),
            ..._buildWorkouts(workout),
            const AboutDialogButton(),
          ],
        ),
      ),
    );
  }
}