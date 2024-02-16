import 'package:hype_man/models/exercise.dart';
import 'package:hype_man/models/exercise_set.dart';

class Workout {
  int id;
  List<Exercise> exercises;
  int? lastExercise;
  
  int getCurrentExercise() {
    int currentExercise = 0;

    if (lastExercise != null) {
      if (!exercises[lastExercise!].isComplete()) {
        return lastExercise!;
      }
    }

    for (var i = 0; i < exercises.length; i++) {
      if (!exercises[i].isComplete()) {
        currentExercise = i;
      }
    }

    return currentExercise;
  }

  Workout({required this.id, required this.exercises, this.lastExercise});
}

Workout buildWorkoutExample() {
  return Workout(id: 1, exercises: <Exercise>[
    Exercise(id: 0, name: 'Squat', sets: [
      ExerciseSet(id: 0, targetReps: 5, weight: 100),
      ExerciseSet(id: 1, targetReps: 5, weight: 125),
      ExerciseSet(id: 2, targetReps: 5, weight: 150),
      ExerciseSet(id: 3, targetReps: 5, weight: 175),
      ExerciseSet(id: 4, targetReps: 5, weight: 200),
    ]),
    Exercise(id: 1, name: 'Bench', sets: [
      ExerciseSet(id: 0, targetReps: 5, weight: 100),
      ExerciseSet(id: 1, targetReps: 5, weight: 125),
      ExerciseSet(id: 2, targetReps: 5, weight: 150),
      ExerciseSet(id: 3, targetReps: 5, weight: 175),
      ExerciseSet(id: 4, targetReps: 5, weight: 200),
    ]),
    Exercise(id: 2, name: 'Barbell Row', sets: [
      ExerciseSet(id: 0, targetReps: 5, weight: 100),
      ExerciseSet(id: 1, targetReps: 5, weight: 125),
      ExerciseSet(id: 2, targetReps: 5, weight: 150),
      ExerciseSet(id: 3, targetReps: 5, weight: 175),
      ExerciseSet(id: 4, targetReps: 5, weight: 200),
    ]),
  ]);
}