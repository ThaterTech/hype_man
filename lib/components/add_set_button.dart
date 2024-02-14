import 'package:flutter/material.dart';

class AddSetButton extends StatefulWidget {

  AddSetButton({super.key, required this.callback});
  VoidCallback callback;

  @override
  State<AddSetButton> createState() => _AddSetButtonState();
}

class _AddSetButtonState extends State<AddSetButton> {
  @override
  Widget build(BuildContext context) {
    
    return 
      ElevatedButton(
        onPressed: () {
          widget.callback();
        },
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