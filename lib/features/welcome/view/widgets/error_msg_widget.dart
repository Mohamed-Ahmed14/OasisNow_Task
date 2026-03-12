import 'package:flutter/material.dart';
import '../../../../shared/widgets/custom_text.dart';

class ErrorMsgWidget extends StatelessWidget {
  final String? text;
  const ErrorMsgWidget({
    this.text,
    super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(text: text ?? '',
      fontWeight: FontWeight.w700,
      fontSize: 9,
      height: 1,
      letterSpacing: -0.27,
      color: Color(0xFFA91C1C),);
  }
}
