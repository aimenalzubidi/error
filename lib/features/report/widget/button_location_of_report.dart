import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonLocationOfReport extends StatelessWidget {
  const ButtonLocationOfReport({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });
  final String title;
  final Icon icon;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 80.h,
            width: 200.w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(title, style: TextStyle(fontSize: 16)),
                ),
                icon,
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
