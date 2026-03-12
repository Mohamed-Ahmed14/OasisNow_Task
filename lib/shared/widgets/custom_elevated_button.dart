import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final bool withBorder;
  final void Function()? onPressed;
  final Widget? child;
  const CustomElevatedButton({
    this.withBorder = false,
    this.backgroundColor,
    this.onPressed,
    this.child,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: Colors.transparent,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8,vertical: 16),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: withBorder ?BorderSide(
                color: Colors.white.withValues(alpha: 0.6),
                width: 1.5,
              ):BorderSide.none
          ),
        ),
        onPressed:onPressed,
        child: child);
  }
}
