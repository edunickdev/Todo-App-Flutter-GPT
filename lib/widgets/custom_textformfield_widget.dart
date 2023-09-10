import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final int? maxLines;
  final bool? isPassword;
  // final List<Function>? onTap;
  final Function? onTap;
  

  const CustomTextFormField(
    {
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.maxLines,
    this.isPassword, this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    String validateText(String? text) {
      if (text == null || text.isEmpty) {
        return "Este campo es obligatorio";
      }
      return "";
    }

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
      onTap: (){
        onTap!();
      },
      validator: (value) {
        return validateText(value);
      },
    );
  }
}
