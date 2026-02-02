import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:remixicon/remixicon.dart';

class DangerZones extends StatefulWidget {
  const DangerZones({super.key});

  @override
  State<DangerZones> createState() => _DangerZonesState();
}

class _DangerZonesState extends State<DangerZones> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController? _mapController;
  final List<Circle> _googleMapDangerZones = [];
  final List _dangerZones = [
    {
      "zone name ": "لعوص",
      "latitude": 15.920834,
      "longtude": 48.639695,
      "radius": 300.5,
    },
    {
      "zone name ": "باعلال ",
      "latitude": 15.926733,
      "longtude": 48.629203,
      "radius": 300.5,
    },
    {
      "zone name ": "شرق شبام",
      "latitude": 15.927373,
      "longtude": 48.622728,
      "radius": 300.5,
    },
    {
      "zone name ": "سيئون",
      "latitude": 15.962963,
      "longtude": 48.787154,
      "radius": 300.5,
    },
    {
      "zone name ": "الغرفة",
      "latitude": 15.939905,
      "longtude": 48.710500,
      "radius": 300.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 85.h,
        iconTheme: IconThemeData(color: const Color(0xFFb3de00)),
        title: Text(
          "المناطق الخطرة",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: const Color(0xFFb3de00), width: 1.w),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _buildFloatingActionButton(),
      key: scaffoldKey,
      body: buildMap(),
    );
  }

  void _addDangerZonesToGoogleMap() {
    for (int i = 0; i < _dangerZones.length; i++) {
      _googleMapDangerZones.add(
        Circle(
          circleId: CircleId(_dangerZones[i]["zone name "]),
          center: LatLng(
            _dangerZones[i]["latitude"],
            _dangerZones[i]["longtude"],
          ),
          radius: _dangerZones[i]["radius"],
          fillColor: Colors.red.withOpacity(0.3),
          strokeColor: Colors.red,
          strokeWidth: 2,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _addDangerZonesToGoogleMap();
  }

  void _showDangerZones(GlobalKey<ScaffoldState> key) {
    {
      key.currentState!.showBottomSheet(
        sheetAnimationStyle: AnimationStyle(
          curve: Curves.ease,
          duration: Duration(milliseconds: 700),
          reverseCurve: Curves.ease,
          reverseDuration: Duration(milliseconds: 700),
        ),
        backgroundColor: Colors.white70,
        (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10.w, 40.h, 10.w, 10.h),
            height: 500.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: const Color(0xFFb3de00),
                indent: 10,
                endIndent: 10,
                thickness: 1.h,
              ),
              itemCount: _googleMapDangerZones.length,
              itemBuilder: (context, index) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    splashColor: const Color(0x44b3de00),
                    selectedColor: const Color(0x55b3de00),
                    tileColor: Colors.white60,
                    leading: Icon(
                      RemixIcons.map_2_fill,
                      color: const Color(0xFFb3de00),
                    ),
                    title: Text(
                      _dangerZones[index]["zone name "],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      "خط الطول ${_dangerZones[index]["longtude"]}  -  دائرة العرض ${_dangerZones[index]["latitude"]} ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {},
                      child: Text(
                        "تفاصيل المنطقة",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      _mapController!.animateCamera(
                        duration: Duration(milliseconds: 700),
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: _googleMapDangerZones[index].center,
                            zoom: 16,
                          ),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
  }

  Widget _buildFloatingActionButton() {
    return SizedBox(
      height: 70.h,
      width: 250.w,
      child: ElevatedButton.icon(
        label: Text(
          "المناطق الخطرة",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.white),
        ),
        onPressed: () => _showDangerZones(scaffoldKey),
        icon: Icon(RemixIcons.map_pin_2_fill, color: Colors.white),
      ),
    );
  }

  Widget buildMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(15.920834, 48.639695),
        zoom: 14,
      ),
      circles: _googleMapDangerZones.toSet(),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _mapController = controller;
      },
    );
  }
}
