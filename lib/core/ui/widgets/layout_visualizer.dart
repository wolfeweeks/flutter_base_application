import 'package:flutter/material.dart';

class LayoutVisualizer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;

  const LayoutVisualizer({
    required this.child,
    this.backgroundColor = Colors.transparent,
    this.borderColor = Colors.red,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          width: 2,
          color: borderColor,
        ),
      ),
      child: child,
    );
  }
}
