import 'package:flutter/material.dart';
import 'package:hype_man/components/add_set_button.dart';
import 'package:hype_man/components/set_button.dart';
import 'package:hype_man/models/workout.dart';
import 'package:hype_man/models/workout_set.dart';

class ExercisePanel extends StatefulWidget {

  const ExercisePanel({super.key, 
    required this.workout
  });

  final Workout workout;

  @override
  State<ExercisePanel> createState() => _ExercisePanelState();
}

class _ExercisePanelState extends State<ExercisePanel> {
  String setName = '';
  int currentSetIndex = 0;
  List<WorkoutSet> sets = [];
  List<Widget> setList = [];
  
  @override
  void initState() {
    super.initState();
    setName = widget.workout.name;
    sets = widget.workout.sets;
  }

  void onPressed() {
  }

  // Clones the last set, and add to the end
  void addSetCallback() {
    WorkoutSet lastSet = sets.last;
    WorkoutSet newSet = WorkoutSet(
      id: lastSet.id + 1,
      targetReps: lastSet.targetReps,
      actualReps: 0,
      weight: lastSet.weight
    );

    setState(() {
      sets.add(newSet);
    });
  }

  List<Widget> _createHeader() {
    WorkoutSet currentSet = sets.elementAt(currentSetIndex);
    String nextSetSummary = '${currentSet.targetReps}x${currentSet.weight}';

    return <Widget>[
      Text(setName),
      Text(nextSetSummary),
    ];
  }

  List<Widget> _createChildren() {
    List<Widget> list = <Widget>[
      for(var set in sets ) 
        SetButton(set: set, enabled: true)
    ];

    list.add(AddSetButton(callback: addSetCallback));
    return list;
  }

  @override
  Widget build(BuildContext context) {    
    return Column(
      children: <Widget>[
        SizedBox(
          height:50,
          child: Padding(
            padding: const EdgeInsets.all(10), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _createHeader(),
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _createChildren(),
          ),
        ),
      ]
    );
  }
}