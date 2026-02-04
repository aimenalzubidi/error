import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

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
class LodingDialogInAuth extends StatelessWidget {
  const LodingDialogInAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          // color: MyAppColor.backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: CircularProgressIndicator(backgroundColor: Color(0xFFb3de00),color: Color(0xFFb3de00),),
        ),
      ),
    );
  }
}

showLodign() {
  Get.dialog(LodingDialogInAuth());
}
