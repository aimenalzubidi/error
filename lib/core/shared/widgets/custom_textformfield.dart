import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    this.prefix,
    this.sufix,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.fillColor = Colors.white,
    this.inputFormatters,
    required this.labelText,
    this.width = 300,
    this.height = 80,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.labelAlignment = Alignment.centerLeft,
    this.readOnly = false,
    this.errortext, // <- external error text (from Firebase)
  });

  final String labelText;
  final Widget? prefix;
  final Widget? sufix;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLength;
  final double width;
  final double height;
  final Color fillColor;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final Alignment labelAlignment;
  final dynamic inputFormatters;
  final bool readOnly;
  final String? errortext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLength: maxLength,
        textDirection: textDirection,
        textAlign: textAlign,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        obscureText: obscureText,
        style: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(color: Colors.black, fontSize: 17.sp),
        cursorColor: const Color(0xFFb3de00),
        decoration: InputDecoration(
          label: Text(
            labelText,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(color: Colors.black45),
          ),
          prefixIcon: prefix,
          suffixIcon: sufix,
          filled: true,
          fillColor: fillColor,
          errorText: errortext, // <-- THIS LINE IS KEY
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFFb3de00)),
            borderRadius: BorderRadius.circular(20.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFFb3de00)),
            borderRadius: BorderRadius.circular(20.r),
          ),
          helperText: '  ',
        ),
        buildCounter:
            (
              context, {
              required currentLength,
              required isFocused,
              required maxLength,
            }) {
              return null;
            },
      ),
    );
  }
}
