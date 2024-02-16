class ExerciseSet {
  int id;
  int targetReps;
  int? actualReps;
  int weight;

  ExerciseSet({required this.id, required this.targetReps, this.actualReps, required this.weight});
}