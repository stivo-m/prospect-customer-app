import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.buttonText,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;
  final Color? backgroundColor;
  final Widget buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                backgroundColor ?? Colors.purpleAccent,
                Colors.deepOrangeAccent,
              ],
            ),
          ),
          child: Center(child: buttonText),
        ),
      ),
    );
  }
}
