import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  const CustomTextFormField({
    this.validator,
    this.controller,
    this.focusNode,
    this.suffixIcon,
    this.hintText,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: Colors.white,
      focusNode: focusNode,
      style: TextStyle(color: Colors.white),
      onTapOutside: (event) {
        if(focusNode != null){
          focusNode!.unfocus();
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFF242424),
        contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 8,vertical: 8),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
          fontSize: 10,
          height: 1,
          letterSpacing: 0.1,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
            color: Colors.white.withValues(alpha: 0.18),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
            color: Colors.white.withValues(alpha: 0.18),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(
            color: Colors.white.withValues(alpha: 0.18),
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
