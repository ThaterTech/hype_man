import 'package:flutter/material.dart';
import 'package:hype_man/models/exercise_set.dart';

class SetButton extends StatefulWidget {

  const SetButton({super.key, 
    required this.set, 
    required this.active, 
    required this.actionSetCallback, 
    required this.deleteSetCallback});

  final ExerciseSet set;
  final bool active;
  final VoidCallback actionSetCallback;
  final void Function(int?) deleteSetCallback;

  @override
  State<SetButton> createState() => _SetButtonState();
}

class _SetButtonState extends State<SetButton> {
    ExerciseSet? set;
    bool active = false;
    bool started = false;

    @override
    void initState() {
      super.initState();
      set = widget.set;
      started = widget.set.actualReps != null;
    }

    void handleUpdate(int i) {
      setState(() {
        widget.set.actualReps = i;
        started = true;
      });
      widget.actionSetCallback();
      Navigator.pop(context);
    }

    void handleDelete() {
      widget.deleteSetCallback(set?.id);
      Navigator.pop(context);
    }

    List<Widget> buildButtonsForEditModal() {
      List<Widget> list = <Widget>[
        for(var i = 0; i <= widget.set.targetReps; i++)
          ElevatedButton(
            child: Text('$i'),
            onPressed: () => handleUpdate(i)
          )
      ];
      return list;
    }

    void onLongPress() {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: SingleChildScrollView(child:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ...buildButtonsForEditModal(),
                    ElevatedButton(
                      child: const Text('Delete Set'),
                      onPressed: () => handleDelete()
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      );
    }

    void onPressed() {
      widget.actionSetCallback();

      if (widget.set.actualReps == null || widget.set.actualReps == 0) {
        setState(() {
          widget.set.actualReps = widget.set.targetReps;
          started = true;
        });
        return;
      }
      setState(() {
        widget.set.actualReps = widget.set.actualReps! - 1;
        started = true;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
          backgroundColor: MaterialStateProperty.all(
            widget.active ? Colors.red :
            started ? Colors.white10 : 
            Colors.white),
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) return Colors.redAccent;
            return null;
          }),
        ),
        child: Text('${widget.set.actualReps ?? widget.set.targetReps}'),
      ),
      Text(
        '${widget.set.weight}',
        style: const TextStyle(
          color: Colors.grey
        ),)
      ]);
  }
}