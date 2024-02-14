import 'package:flutter/material.dart';
import 'package:hype_man/components/add_set_button.dart';
import 'package:hype_man/components/set_button.dart';

class ExercisePanel extends StatefulWidget {

  const ExercisePanel({super.key, 
    required this.setName,
    required this.repCount,
    required this.setCount,
    required this.setWeight,
  });

  final String setName;
  final int repCount;
  final int setCount;
  final int setWeight;

  @override
  State<ExercisePanel> createState() => _ExercisePanelState();
}

class _ExercisePanelState extends State<ExercisePanel> {
  bool loading = true;
  String setName = '';
  int repCount = 0, setCount = 0, setWeight = 0;
  List<Widget> setList = [];
  
  @override
  void initState() {
    super.initState();
    setName = widget.setName;
    repCount = widget.repCount;
    setCount = widget.setCount;
    setWeight = widget.setWeight;
  }

  void onPressed() {
  }

  void addSetCallback() {
    setState(() {
      setCount++;
    });
  }

  List<Widget> _createChildren() {
    List<Widget> list = List<Widget>.generate(setCount, (int index) {
      return SetButton(repCount: repCount);
    });
    list.add(AddSetButton(callback: addSetCallback));
    return list;
  }

  @override
  Widget build(BuildContext context) {    
    return Column(
      children: <Widget>[
        Text(widget.setName),
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