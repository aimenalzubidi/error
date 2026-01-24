import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:remixicon/remixicon.dart';
import '../ai_chat/pages/ai_chat.dart';
import '../danger_zones/pages/danger_zones.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PersistentTabView(
        onTabChanged: (index) {},
        screenTransitionAnimation: ScreenTransitionAnimation(
          duration: Duration(milliseconds: 800),
        ),
        tabs: [
          PersistentTabConfig(
            screen: const Placeholder(),
            item: ItemConfig(
              inactiveIcon: Padding(
                padding:  EdgeInsets.all(8.h),
                child: Icon(
                  RemixIcons.home_2_fill,
                  color: Colors.black26,
                  size: 30.r,
                ),
              ),
              activeForegroundColor: const Color.fromARGB(255, 144, 180, 0),
              activeColorSecondary: const Color(0xFFb3de00),
              icon: Padding(
                padding:  EdgeInsets.all(8.h),
                child: Icon(
                  RemixIcons.home_2_fill,
                  color: const Color(0xFFb3de00),
                  size: 30.r,
                ),
              ),
              title: "الصفحة الرئيسة",
              textStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w900),
            ),
          ),
         
          PersistentTabConfig(
            screen: Chat(),
            item: ItemConfig(
              inactiveIcon: Padding(
                padding:  EdgeInsets.all(8.h),
                child: Icon(
                  RemixIcons.chat_1_fill,
                  color: Colors.black26,
                  size: 30.r,
                ),
              ),
              activeForegroundColor: const Color.fromARGB(255, 150, 187, 0),
              activeColorSecondary: const Color(0xFFb3de00),
              icon: Padding(
                padding:  EdgeInsets.all(8.h),
                child: Icon(
                  RemixIcons.chat_1_fill,
                  color: const Color(0xFFb3de00),
                  size: 30.r,
                ),
              ),
              title: "AI",
              textStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w900),
            ),
          ),
           PersistentTabConfig(
            screen:DangerZones(),
            item: ItemConfig(
              inactiveIcon: Padding(
               padding:  EdgeInsets.all(8.h),
                child: Icon(
                  
                  RemixIcons.map_pin_2_fill,
                  color: Colors.black26,
                  size: 30.r,
                ),
              ),
              activeForegroundColor: const Color.fromARGB(255, 150, 187, 0),
              activeColorSecondary: const Color(0xFFb3de00),
              icon: Padding(
                padding:  EdgeInsets.all(8.h),
                child: Icon(
                  RemixIcons.map_pin_2_fill,
                  color: const Color(0xFFb3de00),
                  size: 30.r,
                ),
              ),
              title: "المناطق الخطرة",
              textStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w900),
            ),
          ),
          PersistentTabConfig(
            screen: const Placeholder(),
            item: ItemConfig(
              inactiveIcon: Padding(
                padding:  EdgeInsets.all(8.h),
                child: Icon(
                  RemixIcons.megaphone_fill,
                  color: Colors.black26,
                  size: 30.r,
                ),
              ),
              activeForegroundColor: const Color.fromARGB(255, 150, 187, 0),
              activeColorSecondary: const Color(0xFFb3de00),
      
              icon: Padding(
      
                padding:  EdgeInsets.all(8.h),
                child: Icon(
                  RemixIcons.megaphone_fill,
                  color: const Color(0xFFb3de00),
                  size: 30.r,
                ),
              ),
              title: "إبلاغ",
              textStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w900),
            ),
          ),
          PersistentTabConfig(
            screen: const Placeholder(),
            item: ItemConfig(
              
              inactiveIcon: Padding(
                padding:  EdgeInsets.all(8.h),
                child: Icon(
                  RemixIcons.notification_3_fill,
                  color: Colors.black26,
                  size: 30.r,
                ),
              ),
              activeForegroundColor: const Color.fromARGB(255, 150, 187, 0),
              activeColorSecondary: const Color(0xFFb3de00),
              inactiveBackgroundColor: Colors.black,
              inactiveForegroundColor: Colors.black38,
      
              icon: Padding(
                padding:  EdgeInsets.all(8.h),
                child: Icon(
                  RemixIcons.notification_3_fill,
                  color: const Color(0xFFb3de00),
                  size: 30.r,
                ),
              ),
              title: "الإشعارات",
              textStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w900),
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style12BottomNavBar(
          navBarConfig: navBarConfig,
          itemAnimationProperties: ItemAnimation(
            duration: Duration(milliseconds: 700),
            curve: Curves.ease,
          ),
          navBarDecoration: NavBarDecoration(
            padding: EdgeInsets.fromLTRB(10.w, 7.h, 10.w, 7.h),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              topLeft: Radius.circular(20.r),
            ),
         
         border: BoxBorder.all(color:  const Color(0xFFb3de00),width: 0.7.w)
           
          ),
        ),
      ),
    );
  }
}

