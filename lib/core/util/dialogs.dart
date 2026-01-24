import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
    required this.title,
    this.titlePadding,
    this.backgroundColor,
    this.contentPadding,
    this.content,
    this.actions,
  });

  final String title;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final Widget? content;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: contentPadding,
      titlePadding: titlePadding,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.right,
      ),

      content: content,

      actions: actions,
    );
  }
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
