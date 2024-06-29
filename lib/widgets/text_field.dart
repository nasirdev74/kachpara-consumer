import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key, this.controller, required this.label, this.maxLines = 1, this.hint, this.keyboardType, this.textInputAction, this.focusNode, this.validator});
  final TextEditingController? controller;
  final String label;
  final int maxLines;
  final String? hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        focusNode: focusNode,
        validator: validator,
      ),
    );
  }
}
