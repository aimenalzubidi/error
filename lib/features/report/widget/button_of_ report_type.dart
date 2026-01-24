import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonOfReportType extends StatelessWidget {
  const ButtonOfReportType({
    super.key,
    required this.title,
    required this.imagePath,
    required this.color,
    required this.onTap,
  });
  final String title;
  final String imagePath;
  final Color color;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 80.h,
            width: 120.w,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(title, style: TextStyle(fontSize: 18)),
                ),
                SvgPicture.asset(imagePath, width: 40.w, height: 40.h),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
