import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Screens/Home/CheckOut/add_address.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({super.key});

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "CHECKOUT",
          style: GoogleFonts.tajawal(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0XFFE7EAEF),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 16.w),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Checkout".toUpperCase(),
                style: GoogleFonts.tajawal(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
          Image.asset("assets/images/3.png"),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              "Shipping adress".toUpperCase(),
              style: GoogleFonts.tajawal(
                fontSize: 14.sp,
                color: Color(0xff888888),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Iris Watson",
                      style: GoogleFonts.tajawal(
                        fontSize: 18.sp,
                        color: Color(0xff1A1A1A),
                      ),
                    ),
                    Text(
                      "606-3727 Ullamcorper. Street",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Color(0xff555555),
                      ),
                    ),
                    Text(
                      "Roseville NH 11523",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Color(0xff555555),
                      ),
                    ),
                    Text(
                      "(786) 713-8616",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Color(0xff555555),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.navigate_next_rounded)
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          InkWell(
            onTap: () {
              Get.to(() => AddAddress());
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Color(0xffF9F9F9),
              ),
              child: Row(
                children: [
                  Text(
                    "Add shipping adress",
                    style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      color: Color(0xff555555),
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.add),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "Shipping Method",
              style: GoogleFonts.tajawal(
                fontSize: 14.sp,
                color: Color(0xff888888),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Color(0xffF9F9F9),
            ),
            child: Row(
              children: [
                Text(
                  "Pickup at store",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    color: Color(0xff555555),
                  ),
                ),
                Spacer(),
                Text(
                  "Free",
                  style: GoogleFonts.tajawal(
                    fontSize: 14.sp,
                    color: Color(0xff555555),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Transform.rotate(
                  angle: -1.57,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "Payment method",
              style: GoogleFonts.tajawal(
                fontSize: 14.sp,
                color: Color(0xff888888),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Color(0xffF9F9F9),
            ),
            child: Row(
              children: [
                Text(
                  "select payment method",
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    color: Color(0xff555555),
                  ),
                ),
                Spacer(),
                Transform.rotate(
                  angle: -1.57,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              children: [
                Text(
                  "Total".toUpperCase(),
                  style: GoogleFonts.tajawal(
                    fontSize: 14.sp,
                    color: Color(0XFF333333),
                  ),
                ),
                Spacer(),
                Text(
                  "\$240".toUpperCase(),
                  style: GoogleFonts.tajawal(
                    fontSize: 16.sp,
                    color: Color(0XFFDD8560),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    "assets/images/shopping bag.svg",
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    "Place order".toUpperCase(),
                    style: GoogleFonts.tajawal(fontSize: 16.sp),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
