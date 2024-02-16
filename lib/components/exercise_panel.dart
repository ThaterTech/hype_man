import 'package:flutter/material.dart';
import 'package:hype_man/components/add_set_button.dart';
import 'package:hype_man/components/set_button.dart';
import 'package:hype_man/models/exercise.dart';
import 'package:hype_man/models/exercise_set.dart';

class ExercisePanel extends StatefulWidget {

  const ExercisePanel({super.key, 
    required this.index,
    required this.exercise,
    required this.activePanel,
    required this.activeCallback,
  });

  final int index;
  final Exercise exercise;
  final bool activePanel;
  final void Function(int) activeCallback;

  @override
  State<ExercisePanel> createState() => _ExercisePanelState();
}

class _ExercisePanelState extends State<ExercisePanel> {
  int currentSetIndex = 0;
  late Exercise exercise;
  bool activePanel = false;
  List<Widget> setList = [];
  late Function(int) activeCallback;
  
  @override
  void initState() {
    super.initState();
    exercise = widget.exercise;
    activeCallback = widget.activeCallback;
  }
  
  void onPressed() {

  }

  // Clones the last set, and add to the end
  void _addSetCallback() {
    ExerciseSet lastSet = exercise.sets.last;
    ExerciseSet newSet = ExerciseSet(
      id: lastSet.id + 1,
      targetReps: lastSet.targetReps,
      weight: lastSet.weight
    );

    setState(() {
      exercise.sets.add(newSet);
    });
  }

  List<Widget> _createHeader() {
    ExerciseSet currentSet = exercise.sets.elementAt(currentSetIndex);
    String nextSetSummary = '${currentSet.targetReps}x${currentSet.weight}';

    return <Widget>[
      Text(exercise.name),
      Text(nextSetSummary),
    ];
  }

  void _activeSetCallback() {
    widget.activeCallback(widget.index);
  }

  void _deleteSetCallback(int? id) {
    if (id == null) {
      return;
    }
    setState(() {
      exercise.sets.removeWhere((element) => element.id == id);
    });
  }

  List<Widget> _createChildren() {
    List<Widget> list = <Widget>[
      for(var i = 0; i < widget.exercise.sets.length; i++)
        SetButton(set: widget.exercise.sets[i], 
          active: widget.activePanel && widget.exercise.getNextSet() == i,
          actionSetCallback: _activeSetCallback,
          deleteSetCallback: _deleteSetCallback,
        )
    ];

    list.add(AddSetButton(callback: _addSetCallback));
    return list;
  }

  @override
  Widget build(BuildContext context) {    
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
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