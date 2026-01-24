import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ReportTypeEnum {
  flood(imagePath: 'assets/images/svg/download (2).svg', title: 'السيل',key:'flood' ),
  rescue(imagePath: 'assets/images/svg/download.svg', title: 'الإنقاذ',key:'rescue'),
  fire(imagePath: 'assets/images/svg/download (1).svg', title: 'حريق',key:'fire');

  final String imagePath;
  final String title;
  final String key;

  const ReportTypeEnum({required this.imagePath, required this.title, required this.key});
}
enum LocationTypeEnum {
  locationFromMap(icon:Icon(Icons.location_on) , title: 'موقع من الخريطة'),
  currentLocation(icon:Icon(Icons.my_location_outlined) , title: 'الموقع الحالي ');
  

  final Icon icon;
  final String title;

  const LocationTypeEnum({required this.icon, required this.title});
}
