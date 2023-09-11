import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.buttonName, @required this.onPressed});
  final String buttonName;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding:
                const EdgeInsets.symmetric(horizontal: 60.0, vertical: 12.0),
            backgroundColor: Colors.black),
        child: Text(
          buttonName,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
