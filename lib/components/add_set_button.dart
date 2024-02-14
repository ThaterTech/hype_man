import 'package:flutter/material.dart';

class AddSetButton extends StatefulWidget {

  const AddSetButton({super.key});

  @override
  State<AddSetButton> createState() => _AddSetButtonState();
}

class _AddSetButtonState extends State<AddSetButton> {
    void onPressed() {
      // TODO
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
        child: const Text('+'),
      );
  }
}