import 'package:figmanoteapp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hintText,
    this.textController,
    this.validator,
    this.textInputType,
    this.obsecureText,
    this.prefixWidget,
    this.suffixIcon,
    this.decoration,
    this.maxLines,
    this.onChanged,
  });
  String? hintText;
  TextEditingController? textController = TextEditingController();
  String? Function(String?)? validator;
  TextInputType? textInputType;
  Widget? prefixWidget;
  Widget? suffixIcon;
  bool? obsecureText;
  InputDecoration? decoration;
  int? maxLines;
  void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText ?? false,
      controller: textController,
      validator: validator,
      keyboardType: textInputType,
      decoration: decoration,
      maxLines: maxLines,
      style: const TextStyle(
        color: white,
      ),
      onChanged: onChanged,
    );
  }
}
