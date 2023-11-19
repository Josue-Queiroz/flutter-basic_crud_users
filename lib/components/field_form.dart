import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FirldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;
  bool? isForm = true;
  bool isEmail = false;

  FirldForm({
    super.key,
    this.isForm,
    required this.label,
    required this.isEmail,
    required this.isPassword,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextFormField(
        enabled: isForm,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
        ),
        validator: (value) {
          if (value!.length < 5) {
            return 'Min 5 characters';
          }
          if (isEmail && !value.contains('@')) {
            return 'E-email invalid!';
          }
          return null;
        },
      ),
    );
  }
}
