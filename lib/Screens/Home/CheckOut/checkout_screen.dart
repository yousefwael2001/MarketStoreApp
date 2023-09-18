import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Screens/Home/CheckOut/select_address.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
            height: 10.h,
          ),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 134.h,
                margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/Rectangle 344.jpg",
                      fit: BoxFit.cover,
                      height: 134.h,
                      width: 100.w,
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lamerei".toUpperCase(),
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF000000),
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Recycle Boucle Knit Cardigan Pink",
                          style: GoogleFonts.tajawal(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF555555),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 24.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0XFFC4C4C4),
                                ),
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 16,
                                color: Color(0XFF555555),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "1",
                              style: GoogleFonts.tajawal(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              height: 24.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0XFFC4C4C4),
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 16,
                                color: Color(0XFF555555),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "12 kwd",
                          style: GoogleFonts.tajawal(
                            fontSize: 16.sp,
                            color: Color(0XFFDD8560),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          SizedBox(
            height: 50.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ListTile(
                leading: SvgPicture.asset("assets/images/Voucher.svg"),
                title: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Text(
                    "Add promo code",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                horizontalTitleGap: 0,
                titleAlignment: ListTileTitleAlignment.center,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          SizedBox(
            height: 50.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ListTile(
                leading:
                    SvgPicture.asset("assets/images/Door to Door Delivery.svg"),
                title: Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Text(
                    "Delivery",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                titleAlignment: ListTileTitleAlignment.center,
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                trailing: Text(
                  "Free",
                  style: GoogleFonts.tajawal(
                    fontSize: 14.sp,
                    color: Color(0xff555555),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              children: [
                Text(
                  "Est. Total".toUpperCase(),
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
              onPressed: () {
                Get.to(() => SelectAddress());
              },
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
                    "CHECKOUT".toUpperCase(),
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
