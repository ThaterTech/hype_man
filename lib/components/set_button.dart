import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SetButton extends StatefulWidget {

  const SetButton({super.key, required this.repCount});

  final int repCount;

  @override
  State<SetButton> createState() => _SetButtonState(repCount);
}

class _SetButtonState extends State<SetButton> {

    int initalRepCount = 0;
    int repCount = 0;
    
    _SetButtonState(int repCount) {
      initalRepCount = repCount;
      repCount = repCount;
    }

    void onPressed() {

      if (repCount == 0) {
        setState(() {
          repCount = initalRepCount;
        });
      } else {
        setState(() {
          repCount--;
        });
        debugPrint('onPressed clicked: $repCount, $initalRepCount');    
      }
    }

  @override
  Widget build(BuildContext context) {
    
    return 
      ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) return Colors.redAccent;
            return null;
          }),
        ),
        child: Text('$repCount'),
      );
  }
}