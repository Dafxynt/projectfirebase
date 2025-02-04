import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1),
        ),
        prefixIcon: Icon(prefixIcon, size: 20),
        fillColor: Color.fromARGB(255, 229, 208, 172),
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        isDense: true,
      ),
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: TextStyle(fontSize: 14),
    );
  }
}
