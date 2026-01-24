import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';


class ListTileContact extends StatelessWidget {
  const ListTileContact({super.key, this.deleteOnPressed, required this.contactNumber,});

  final  String contactNumber;
  final void Function()? deleteOnPressed;

  @override
  Widget build(BuildContext context) {
     return SizedBox(
      height: 70.h,
       child: ListTile(
        
        
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: const BorderSide(color: Color(0xFFb3de00), width: .7),
        ),
        leading: Icon(
          RemixIcons.phone_fill,
          color: const Color(0xFFb3de00),
          size: 25.r,
        ),
        title: Text(contactNumber,style:Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17.sp),),
        trailing: buildDeleteContactButton(),
       ),
     );
   
  }
  Widget buildDeleteContactButton() {
    return IconButton(
      onPressed: deleteOnPressed,
      icon:  Icon(Icons.delete,size: 30.r,),
      style: IconButton.styleFrom(
        backgroundColor: const Color(0xFFb3de00),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20.r),
        ),
      ),
    );
  }
}
















  /*Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.all(15.r),
              height: 55.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Color(0xFFb3de00), width: .7),
              ),
              child: Text(
                contactNumber,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black54,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ), //Color(0xFFb3de00),
              ),
            ),
          ),

          Expanded(
            child: SizedBox(
              height: 55.h,
              width: 30.w,
              child: IconButton(
                onPressed: deleteOnPressed,
                icon: const Icon(Icons.delete),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFb3de00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(15.r),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );*/