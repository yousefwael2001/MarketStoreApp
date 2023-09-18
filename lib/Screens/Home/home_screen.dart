import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Screens/Home/HomePages/cart_page.dart';
import 'package:markat_store/Screens/Home/HomePages/home_page.dart';
import 'package:markat_store/Screens/Home/HomePages/profile_page.dart';
import 'package:markat_store/Screens/Search/search_screen.dart';

import 'HomePages/category_page.dart';
import 'HomePages/fav_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int current_index = 0;
  final List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    ProfilePage(),
    FavPage(),
    CartPage()
  ];

  void OnTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo23.png",
          width: 100.w,
        ),
        centerTitle: true,
        backgroundColor: Color(0XFFE7EAEF),
        elevation: 0,
        actions: [
          InkWell(
            onTap: () => Get.to(() => SearchScreen()),
            child: SvgPicture.asset("assets/images/Search.svg"),
          ),
          SizedBox(
            width: 16.w,
          ),
          InkWell(
            onTap: () {
              setState(() {
                current_index = 4;
              });
            },
            child: SvgPicture.asset("assets/images/shopping bag.svg"),
          ),
          SizedBox(
            width: 24.w,
          ),
        ],
        leading: InkWell(
          onTap: () {
            setState(() {
              _scaffoldKey.currentState!.openDrawer();
            });
          },
          child: SvgPicture.asset(
            "assets/images/Menu.svg",
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r),
              bottomRight: Radius.circular(10.r),
            ),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                    icon: Icon(Icons.close),
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/logo23.png",
                    width: 162.w,
                  ),
                  Spacer(),
                ],
              ),
              Divider(
                indent: 60,
                thickness: 1,
                endIndent: 40,
              ),
              SizedBox(
                height: 20.h,
              ),
              ExpansionTile(
                title: Text(
                  "Skincare",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    color: Color(0XFF333333),
                  ),
                ),
                clipBehavior: Clip.none,
                childrenPadding: EdgeInsets.only(left: 20.w),
                children: [
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 1",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 2",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 3",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 4",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 5",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 6",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 7",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 8",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 9",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "Bath & Body",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    color: Color(0XFF333333),
                  ),
                ),
                clipBehavior: Clip.none,
                childrenPadding: EdgeInsets.only(left: 20.w),
                children: [
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 1",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 2",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 3",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 4",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 5",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 6",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 7",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 8",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 9",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "Makeup",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    color: Color(0XFF333333),
                  ),
                ),
                clipBehavior: Clip.none,
                childrenPadding: EdgeInsets.only(left: 20.w),
                children: [
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 1",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 2",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 3",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 4",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 5",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 6",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 7",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 8",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 9",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "Hair Care",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    color: Color(0XFF333333),
                  ),
                ),
                clipBehavior: Clip.none,
                childrenPadding: EdgeInsets.only(left: 20.w),
                children: [
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 1",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 2",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 3",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 4",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 5",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 6",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 7",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 8",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 9",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "Fragrances",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    color: Color(0XFF333333),
                  ),
                ),
                clipBehavior: Clip.none,
                childrenPadding: EdgeInsets.only(left: 20.w),
                children: [
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 1",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 2",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 3",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 4",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 5",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 6",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 7",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 8",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 9",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "other",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    color: Color(0XFF333333),
                  ),
                ),
                clipBehavior: Clip.none,
                childrenPadding: EdgeInsets.only(left: 20.w),
                children: [
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 1",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 2",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 3",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 4",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 5",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 6",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 7",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 8",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ListTile(
                      title: Text(
                        "Bath & Body 9",
                        style: GoogleFonts.tajawal(
                          fontSize: 16.sp,
                          color: Color(0XFF333333),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
              SizedBox(
                height: 140.h,
              ),
              Image.asset("assets/images/3.png")
            ],
          ),
        ),
      ),
      body: pages[current_index],
      bottomNavigationBar: Container(
        height: 60.h,
        width: 375.w,
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(0),
        child: ClipRRect(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 2.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                      color:
                          current_index == 0 ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.r),
                        topRight: Radius.circular(2.r),
                      ),
                    ),
                  ),
                  Container(
                    height: 2.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                      color:
                          current_index == 1 ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.r),
                        topRight: Radius.circular(2.r),
                      ),
                    ),
                  ),
                  Container(
                    height: 2.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                      color:
                          current_index == 2 ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.r),
                        topRight: Radius.circular(2.r),
                      ),
                    ),
                  ),
                  Container(
                    height: 2.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                      color:
                          current_index == 3 ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.r),
                        topRight: Radius.circular(2.r),
                      ),
                    ),
                  ),
                  Container(
                    height: 2.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                      color:
                          current_index == 4 ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2.r),
                        topRight: Radius.circular(2.r),
                      ),
                    ),
                  ),
                ],
              ),
              BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Color(0XFFFFFFFF),
                  iconSize: 28.0.r,
                  selectedIconTheme: IconThemeData(size: 24.0.r),
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey,
                  selectedFontSize: 10.sp,
                  unselectedFontSize: 10.sp,
                  currentIndex: current_index,
                  onTap: OnTapped,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/icons8-home.svg",
                        color: current_index == 0 ? Colors.blue : Colors.grey,
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/apps_3917618.svg",
                        color: current_index == 1 ? Colors.blue : Colors.grey,
                      ),
                      label: "Categories",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/circle-user_9821720.svg",
                        color: current_index == 2 ? Colors.blue : Colors.grey,
                      ),
                      label: "Profile",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/heart_3916585.svg",
                        color: current_index == 3 ? Colors.blue : Colors.grey,
                      ),
                      label: "Favourite",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        "assets/images/shopping-cart_3916598.svg",
                        color: current_index == 4 ? Colors.blue : Colors.grey,
                      ),
                      label: "Cart",
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
