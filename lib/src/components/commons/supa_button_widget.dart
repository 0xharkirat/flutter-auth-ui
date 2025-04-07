import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SupaElevatedButtonWidget extends StatelessWidget {
  const SupaElevatedButtonWidget(
      {super.key, this.child, this.onPressed, this.shadcnStyle = false});
  final Widget? child;
  final VoidCallback? onPressed;
  final bool? shadcnStyle;

  @override
  Widget build(BuildContext context) {
    return shadcnStyle == true
        ? ShadButton(
            onPressed: onPressed,
            child: child,
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: child,
          );
  }
}

class SupaTextButtonWidget extends StatelessWidget {
  const SupaTextButtonWidget(
      {super.key, this.onPressed, this.child, this.shadcnStyle = false});
  final VoidCallback? onPressed;
  final Widget? child;
  final bool? shadcnStyle;

  @override
  Widget build(BuildContext context) {
    return shadcnStyle == true
        ? ShadButton.link(onPressed: onPressed, child: child)
        : TextButton(
            onPressed: onPressed,
            child: child ?? const Text(''),
          );
  }
}
