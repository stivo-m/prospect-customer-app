import 'package:flutter/material.dart';

class PrimaryInputField extends StatelessWidget {
  const PrimaryInputField({
    Key? key,
    this.controller,
    this.prefixIcon,
    required this.labelText,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final String labelText;
  final Widget? prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
