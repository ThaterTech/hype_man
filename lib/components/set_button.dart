import 'package:flutter/material.dart';
import 'package:hype_man/models/workout_set.dart';

class SetButton extends StatefulWidget {

  const SetButton({super.key, required this.set, required this.enabled});

  final WorkoutSet set;
  final bool enabled;

  @override
  State<SetButton> createState() => _SetButtonState();
}

class _SetButtonState extends State<SetButton> {
    WorkoutSet? set;
    bool enabled = false;

    @override
    void initState() {
      super.initState();
      set = widget.set;
      enabled = widget.enabled;
    }

    void onPressed() {
      if (set?.actualReps == 0) {
        setState(() {
          set?.actualReps = set?.targetReps ?? 0;
        });
      } else {
        setState(() {
          set?.actualReps--;
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: !enabled ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          backgroundColor: MaterialStateProperty.all(
            enabled ? Colors.white : Colors.white10),
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (!enabled) return null;
            if (states.contains(MaterialState.pressed)) return Colors.redAccent;
            return null;
          }),
        ),
        child: Text('${set?.actualReps}'),
      ),
      Text(
        '${set?.weight}',
        style: const TextStyle(
          color: Colors.grey
        ),)
      ]);
  }
}