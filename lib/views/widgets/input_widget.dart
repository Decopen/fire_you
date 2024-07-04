import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String text;
  final bool isPasswod;
  final Icon icon;
  final String errorMessage;
  final TextEditingController controller;
  const InputWidget({
    super.key,
    required this.isPasswod,
    required this.text,
    required this.icon,
    required this.errorMessage,
    required this.controller,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (widget.controller.text.isEmpty) {
          return widget.errorMessage;
        }
        if (widget.isPasswod) {
          if (widget.controller.text.length < 6) {
            return "le mot de passe doit être supérieur a 6 caratères";
          }
        }
        return null;
      },
      obscureText: widget.isPasswod,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        filled: true,
        fillColor: Colors.black12,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Colors.red),
        ),
        hintText: widget.text,
        hintStyle: const TextStyle(
          color: Colors.black38,
        ),
      ),
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
    );
  }
}
