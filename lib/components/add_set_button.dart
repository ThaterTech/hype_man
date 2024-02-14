import 'package:flutter/material.dart';

class AddSetButton extends StatelessWidget {

  const AddSetButton({super.key, required this.callback});
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    
    return Column(children: [
      ElevatedButton(
        onPressed: () {
          callback();
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
      ),
      const Text('blank', 
        style: TextStyle(color: Colors.white),)
      ],);
  }
}