import 'package:hype_man/models/workout_set.dart';

class Workout {
  int id;
  String name;
  List<WorkoutSet> sets;

  Workout({required this.id, required this.name, required this.sets});
}