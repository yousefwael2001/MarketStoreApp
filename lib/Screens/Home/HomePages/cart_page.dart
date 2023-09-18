import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Screens/Home/CheckOut/checkout_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.h, left: 16.w),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Cart".toUpperCase(),
              style: GoogleFonts.tajawal(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
              ),
            ),
          ),
        ),
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
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            children: [
              Text(
                "Sub Total".toUpperCase(),
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  color: Color(0XFF333333),
                ),
              ),
              Spacer(),
              Text(
                "24 kwd".toUpperCase(),
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  color: Color(0xffEB7171),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w, top: 16.h),
          child: Text(
            "*shipping charges, taxes and discount codes    are calculated at the time of accounting. ",
            style: GoogleFonts.tajawal(
              fontSize: 14.sp,
              color: Color(0XFF888888),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => CheckOut());
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
                  "Buy Now".toUpperCase(),
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
    );
  }
}
