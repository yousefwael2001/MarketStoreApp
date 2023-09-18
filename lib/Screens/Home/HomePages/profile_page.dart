import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Screens/Home/Address/address.dart';

import '../../../Widgets/fade_in_animation.dart';
import '../../../getx/address_getx_controller.dart';
import '../WishList/wishlist.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0XFFAEAEAE).withOpacity(.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 77.h,
          ),
          Obx(() {
            if (_noteGetxController.isLoadingCustomer.value) {
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 80.0,
                ),
              );
            } else {
              if (_noteGetxController.customer.isEmpty) {
                return Center(
                  child: FadeInAnimation(
                    delay: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.person_2_alt,
                          color: Color.fromRGBO(80, 85, 170, 1),
                          size: 60,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "يجب تسجيل الدخول",
                          style: GoogleFonts.tajawal(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 41.r,
                            child: _noteGetxController.customer.first.code ==
                                        null ||
                                    _noteGetxController.customer.first.code ==
                                        ""
                                ? Image.asset("assets/images/Ellipse 9.png")
                                : CachedNetworkImage(
                                    imageUrl: _noteGetxController
                                                .customer.first.code ==
                                            null
                                        ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                        : "http://appma.markatstore.com/image/" +
                                            _noteGetxController
                                                .customer.first.code!,
                                    height: 100.h,
                                    width: 230.w,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                            backgroundColor: Colors.white,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 34.h,
                              width: 34.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Color(0XFFAEAFB4),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      _noteGetxController.customer.first.firstname! +
                          " " +
                          _noteGetxController.customer.first.lastname!,
                      style: GoogleFonts.tajawal(
                        fontSize: 19.sp,
                        color: Color(0xff242424),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      _noteGetxController.customer.first.email!,
                      style: GoogleFonts.tajawal(
                        fontSize: 13.sp,
                        color: Color(0xff242424),
                        // fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                  ],
                );
              }
            }
          }),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 57.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 41.h,
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 14.w,
                          ),
                          SvgPicture.asset("assets/images/Group.svg"),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            "orders",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFAEAEAE),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Color(0XFFAEAEAE),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 41.h,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => WishListProduct());
                      },
                      child: Card(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 14.w,
                            ),
                            SvgPicture.asset("assets/images/Vector.svg"),
                            SizedBox(
                              width: 18.w,
                            ),
                            Text(
                              "Wishlist",
                              style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFFAEAEAE),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.navigate_next_rounded,
                              color: Color(0XFFAEAEAE),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 41.h,
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 14.w,
                          ),
                          SvgPicture.asset("assets/images/Vector (1).svg"),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            "Notifikasi",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFAEAEAE),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Color(0XFFAEAEAE),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 41.h,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => CustomerAddress());
                      },
                      child: Card(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 14.w,
                            ),
                            SvgPicture.asset("assets/images/Vector (2).svg"),
                            SizedBox(
                              width: 18.w,
                            ),
                            Text(
                              "Addresses",
                              style: GoogleFonts.tajawal(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFFAEAEAE),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.navigate_next_rounded,
                              color: Color(0XFFAEAEAE),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 41.h,
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 14.w,
                          ),
                          SvgPicture.asset("assets/images/Vector (3).svg"),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            "language",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFAEAEAE),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Color(0XFFAEAEAE),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 41.h,
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 14.w,
                          ),
                          SvgPicture.asset("assets/images/Vector (4).svg"),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            "Tema",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFAEAEAE),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Color(0XFFAEAEAE),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  SizedBox(
                    height: 41.h,
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 14.w,
                          ),
                          Icon(
                            Icons.error_outline,
                            color: Color(0XFFAEAEAE),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            "About",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFAEAEAE),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Color(0XFFAEAEAE),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 41.h,
                    child: Card(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 14.w,
                          ),
                          Icon(
                            Icons.chat,
                            color: Color(0XFFAEAEAE),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            "Contact",
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFAEAEAE),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: Color(0XFFAEAEAE),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
