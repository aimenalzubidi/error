import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  File? _image;
  final ImagePicker picker = ImagePicker();

  /// فتح المعرض
  Future<void> _pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  /// فتح الكاميرا
  Future<void> _pickFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
      child: Container(
        // height: 100.h,
        // width: 100.h,
        // color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _pickFromGallery();
              },
              child: Column(
                children: [Icon(Icons.image), Text("اختر من المعرض")],
              ),
            ),
            SizedBox(width: 50),
            InkWell(
              onTap: () {
                _pickFromCamera();
              },
              child: Column(
                children: [Icon(Icons.camera_alt), Text("التقاط صورة")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
