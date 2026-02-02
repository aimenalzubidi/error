import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/enums/enum.dart';

import '../widget/button_of_ report_type.dart';
import '../widget/pick_image.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  ReportTypeEnum reportTypeEnum = ReportTypeEnum.fire;
  LocationTypeEnum locationTypeEnum = LocationTypeEnum.currentLocation;
  File? _image;
  static const LatLng sourceLocation = LatLng(37.33500926, -122.066000555);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "صفحة البلاغات",
          style: TextStyle(color: Color(0xFFb3de00)),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text("اختر نوع البلاغ", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ReportTypeEnum.values
                      .map(
                        (type) => ButtonOfReportType(
                          title: type.title,
                          imagePath: type.imagePath,
                          color: reportTypeEnum == type
                              ? Color(0xFFb3de00)
                              : const Color.fromARGB(255, 202, 206, 209),
                          onTap: () {
                            setState(() {
                              reportTypeEnum = type;
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Text(" موقع البلاغ", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Scaffold(
                              appBar: AppBar(title: Text('خريطة جوجل')),
                              body: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: sourceLocation,
                                  zoom: 10,
                                ),
                                markers: {
                                  Marker(
                                    markerId: MarkerId('sourceLocation'),
                                    position: sourceLocation,
                                  ),
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 70.h,
                        width: 220.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 202, 206, 209),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "تحديد على الخريطة",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Icon(Icons.my_location_outlined),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 70.h,
                        width: 180.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(255, 202, 206, 209),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "الموقع الحالي",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10.w),

                            Icon(Icons.location_on),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: LocationTypeEnum.values
                //       .map(
                //         (value) => ButtonLocationOfReport(
                //           title: value.title,

                //           color: locationTypeEnum == value
                //               ? Color(0xFFb3de00)
                //               : const Color.fromARGB(255, 202, 206, 209),
                //           onTap: () {
                //             setState(() {
                //               locationTypeEnum = value;
                //             });
                //           },
                //           icon: value.icon,
                //         ),
                //       )
                //       .toList(),
                // ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text("تفاصيل البلاغ", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 5),
              TextFormField(
                maxLines: 2,
                cursorColor: Color(0xFFb3de00),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),

                    borderSide: const BorderSide(
                      color: Color(0xFFb3de00),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    borderSide: const BorderSide(
                      color: Color(0xFFb3de00),
                      width: 2.5,
                    ),
                  ),
                  hintText: 'أدخل تفاصيل البلاغ',
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "اضف صورة",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 5),

              InkWell(
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => PickImage(),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 202, 206, 209),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: double.infinity,
                  height: 120,
                  alignment: Alignment.center,
                  child: _image == null
                      ? Text("اضغط هنا لاختيار صورة")
                      : Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 60.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // if (formState.currentState!.validate()) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => SizedBox()),
                    //   );
                    // }
                  },
                  child: Text(
                    "تأكيد",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
