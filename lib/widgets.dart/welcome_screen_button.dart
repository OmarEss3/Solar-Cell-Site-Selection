import 'package:flutter/material.dart';

class WelcomeScreenButton extends StatelessWidget {
  const WelcomeScreenButton({
    super.key,
    required this.hint,
    required this.onPressed,
  });
  final void Function()? onPressed;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(
          Colors.yellow[300],
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 50), 
        ),
      ),
      child: Text(
        hint,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
