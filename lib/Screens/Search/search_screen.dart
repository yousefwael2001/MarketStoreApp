import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> category = [
    'New',
    'Old',
  ];
  String selectedValue = "New";

  List<String> MAKEUP = [
    'assets/images/Rectangle 321 (4).png',
    'assets/images/Rectangle 321 (5).png',
    'assets/images/Rectangle 321 (4).png',
    'assets/images/Rectangle 321 (5).png',
    'assets/images/Rectangle 321 (5).png',
    'assets/images/Rectangle 321 (5).png',
    'assets/images/Rectangle 321 (5).png',
    'assets/images/Rectangle 321 (5).png',
    'assets/images/Rectangle 321 (5).png',
    'assets/images/Rectangle 321 (5).png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Image.asset(
            "assets/images/logo23.png",
            width: 100.w,
          ),
          centerTitle: true,
          backgroundColor: Color(0XFFE7EAEF),
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 19.h,
            ),
            SizedBox(
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.cancel),
                        SizedBox(
                          width: 9.w,
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                    label: Text(
                      "Dress",
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    "8 result of dress".toUpperCase(),
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFC4C4C4).withOpacity(.3),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: DropdownButton<String>(
                      value: selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Color(0XFF555555),
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                      underline: Container(),
                      items: category
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFC4C4C4).withOpacity(.3),
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/Listview.svg"),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFC4C4C4).withOpacity(.3),
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/Filter.svg"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 260.h,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 16 / 23),
                itemCount: MAKEUP.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 260.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 200.h,
                              child: Image.asset(MAKEUP[index]),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Icon(
                                Icons.favorite_border,
                                color: Color(0XFFDD8560),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            "Harris Tweed Three button Jacket",
                            style: GoogleFonts.tajawal(
                              fontSize: 12.sp,
                              color: Color(0XFF333333),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "\$120",
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            color: Color(0XFFDD8560),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 51.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 32.h,
                  width: 32.w,
                  color: Color(0XFF333333),
                  child: Center(
                    child: Text(
                      "1",
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 32.h,
                  width: 32.w,
                  color: Color(0XFF888888).withOpacity(.3),
                  child: Center(
                    child: Text(
                      "2",
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 32.h,
                  width: 32.w,
                  color: Color(0XFF888888).withOpacity(.3),
                  child: Center(
                    child: Text(
                      "3",
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 32.h,
                  width: 32.w,
                  color: Color(0XFF888888).withOpacity(.3),
                  child: Center(
                    child: Text(
                      "4",
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Container(
                  height: 32.h,
                  width: 32.w,
                  color: Color(0XFF888888).withOpacity(.3),
                  child: Center(
                    child: Text(
                      "5",
                      style: GoogleFonts.tajawal(
                        fontSize: 16.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Icon(
                  Icons.navigate_next_outlined,
                  color: Color(0XFF14142B),
                  size: 30,
                )
              ],
            ),
            SizedBox(
              height: 257.h,
            ),
            Image.asset("assets/images/3.png"),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "About",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Contact",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Blog",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 23.h,
            ),
            Container(
              height: 45.h,
              color: Color(0XFFC4C4C4),
              child: Center(
                child: Text(
                  "Copyright© OpenUI All Rights Reserved.",
                  style: GoogleFonts.tajawal(
                    fontSize: 12.sp,
                    color: Color(0XFF555555),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
