import 'package:hype_man/models/exercise_set.dart';

class Exercise {
  int id;
  String name;
  List<ExerciseSet> sets;

  bool isComplete() {
    for (var i = 0; i < sets.length; i++) {
      if (sets[i].actualReps == null) {
        return false;
      }
    }
    return true;
  }

  int getNextSet() {
    for (var i = 0; i < sets.length; i++) {
      if (sets[i].actualReps == null){
        return i;
      }
    }
    return 0;
  }

  Exercise({required this.id, required this.name, required this.sets});
}