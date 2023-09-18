import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/fade_in_animation.dart';
import '../../../getx/address_getx_controller.dart';
import '../../../models/product.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final Products product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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

  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());
  Products products = Products();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      products = widget.product;
    });
    super.initState();
  }

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Product Details",
            style: GoogleFonts.tajawal(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
        body: ListView(
          controller: _scrollController,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CachedNetworkImage(
                imageUrl: products.thumb == null
                    ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                    : "http://appma.markatstore.com/image/" + products.thumb!,
                height: 460.h,
                width: 343.w,
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 36.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                products.name!.toUpperCase(),
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                products.description!,
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  color: Color(0XFF555555),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                products.price!,
                style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  color: Color(0XFFDD8560),
                ),
              ),
            ),
            SizedBox(
              height: 19.h,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.w),
            //   child: Row(
            //     children: [
            //       Text(
            //         "Color",
            //         style: GoogleFonts.tajawal(
            //           fontSize: 12.sp,
            //           color: Color(0XFF555555),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 6.w,
            //       ),
            //       Container(
            //         height: 23.h,
            //         width: 23.w,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           border: Border.all(
            //             color: Color(0xff888888),
            //           ),
            //           shape: BoxShape.circle,
            //         ),
            //         padding: EdgeInsets.all(2),
            //         child: CircleAvatar(
            //           radius: 8.r,
            //           backgroundColor: Colors.black,
            //         ),
            //       ),
            //       SizedBox(
            //         width: 6.w,
            //       ),
            //       Container(
            //         height: 23.h,
            //         width: 23.w,
            //         padding: EdgeInsets.all(2),
            //         child: CircleAvatar(
            //           radius: 8.r,
            //           backgroundColor: Color(0xffDD8560),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 6.w,
            //       ),
            //       Container(
            //         height: 23.h,
            //         width: 23.w,
            //         padding: EdgeInsets.all(2),
            //         child: CircleAvatar(
            //           radius: 8.r,
            //           backgroundColor: Color(0xffE1E0DB),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 36.w,
            //       ),
            //       Text(
            //         "Size",
            //         style: GoogleFonts.tajawal(
            //           fontSize: 12.sp,
            //           color: Color(0XFF555555),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 6.w,
            //       ),
            //       Container(
            //         height: 30.h,
            //         width: 24.w,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: Color(0XFF333333),
            //           border: Border.all(
            //             color: Color(0XFFDEDEDE),
            //           ),
            //         ),
            //         child: Center(
            //           child: Text(
            //             "S",
            //             style: GoogleFonts.tajawal(
            //               fontSize: 10.sp,
            //               color: Colors.white,
            //             ),
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 6.w,
            //       ),
            //       Container(
            //         height: 24.h,
            //         width: 24.w,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           border: Border.all(
            //             color: Color(0XFFDEDEDE),
            //           ),
            //         ),
            //         child: Center(
            //           child: Text(
            //             "M",
            //             style: GoogleFonts.tajawal(
            //               fontSize: 10.sp,
            //               color: Color(0XFF555555),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 6.w,
            //       ),
            //       Container(
            //         height: 24.h,
            //         width: 24.w,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           border: Border.all(
            //             color: Color(0XFFDEDEDE),
            //           ),
            //         ),
            //         child: Center(
            //           child: Text(
            //             "L",
            //             style: GoogleFonts.tajawal(
            //               fontSize: 10.sp,
            //               color: Color(0XFF555555),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 25.h,
            // ),
            SizedBox(
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.5.h),
                      child: Icon(Icons.add),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        "Add to basket".toUpperCase(),
                        style: GoogleFonts.tajawal(fontSize: 16.sp),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(bottom: 2.5.h),
                      child: Icon(Icons.favorite_border),
                    ),
                    SizedBox(
                      width: 34.w,
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 56.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "MATERIALS",
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "We work with monitoring programmes to ensure compliance with safety, health and quality standards for our products. ",
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  color: Color(0xff555555),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "CARE",
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "To keep your jackets and coats clean, you only need to freshen them up and go over them with a cloth or a clothes brush. If you need to dry clean a garment, look for a dry cleaner that uses technologies that are respectful of the environment.",
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  color: Color(0xff555555),
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: 25.h,
                child: ListTile(
                  leading: SvgPicture.asset("assets/images/Do Not Bleach.svg"),
                  title: Text(
                    "Do not use bleach",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: Color(0xff555555),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  horizontalTitleGap: 0,
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: 25.h,
                child: ListTile(
                  leading:
                      SvgPicture.asset("assets/images/Do Not Tumble Dry.svg"),
                  title: Text(
                    "Do not tumble dry",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: Color(0xff555555),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  horizontalTitleGap: 0,
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: 25.h,
                child: ListTile(
                  leading: SvgPicture.asset("assets/images/Do Not Wash.svg"),
                  title: Text(
                    "Dry clean with tetrachloroethylene",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: Color(0xff555555),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  horizontalTitleGap: 0,
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: 25.h,
                child: ListTile(
                  leading: SvgPicture.asset("assets/images/Vector 21.svg"),
                  title: Text(
                    "Iron at a maximum of 110ºC/230ºF",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      color: Color(0xff555555),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  horizontalTitleGap: 0,
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "CARE",
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ExpansionTile(
              title: Text(
                "Skincare",
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  color: Color(0XFF333333),
                ),
              ),
              leading: SvgPicture.asset("assets/images/Shipping.svg"),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 52.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Estimated to be delivered on ",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 52.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "09/11/2021 - 12/11/2021.",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              indent: 16.w,
              endIndent: 16.w,
            ),
            ExpansionTile(
              title: Text(
                "COD Policy",
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  color: Color(0XFF333333),
                ),
              ),
              leading: SvgPicture.asset("assets/images/Tag.svg"),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 52.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Estimated to be delivered on ",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 52.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "09/11/2021 - 12/11/2021.",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              indent: 16.w,
              endIndent: 16.w,
            ),
            ExpansionTile(
              title: Text(
                "Return Policy",
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  color: Color(0XFF333333),
                ),
              ),
              leading: SvgPicture.asset("assets/images/Refresh.svg"),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 52.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Estimated to be delivered on ",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 52.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "09/11/2021 - 12/11/2021.",
                      style: GoogleFonts.tajawal(
                        fontSize: 14.sp,
                        color: Color(0XFF555555),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 69.h,
            ),
            Center(
              child: Text(
                "You may also like".toUpperCase(),
                style: GoogleFonts.tajawal(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 3,
                ),
              ),
            ),
            Image.asset("assets/images/3.png"),
            Obx(() {
              if (_noteGetxController.isLoadingLastProducts.value) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: Colors.blue,
                    size: 80.0,
                  ),
                );
              } else {
                if (_noteGetxController.lastProducts.isEmpty) {
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
                            'لا يوجد منتجات',
                            style: GoogleFonts.tajawal(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 280.h,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 16 / 23),
                      itemCount: _noteGetxController.lastProducts.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              products =
                                  _noteGetxController.lastProducts[index];
                            });
                            _scrollController.animateTo(
                              0.0, // Scroll to the top (position 0)
                              duration: Duration(
                                  milliseconds: 500), // Animation duration
                              curve: Curves.easeInOut, // Animation curve
                            );
                          },
                          child: SizedBox(
                            height: 260.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: _noteGetxController
                                                  .lastProducts[index].thumb ==
                                              null
                                          ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                          : "http://appma.markatstore.com/image/" +
                                              _noteGetxController
                                                  .lastProducts[index].thumb!,
                                      height: 200.h,
                                      width: 200.w,
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
                                    _noteGetxController
                                        .lastProducts[index].name!,
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
                                  _noteGetxController
                                      .lastProducts[index].price!,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.sp,
                                    color: Color(0XFFDD8560),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            }),

            SizedBox(
              height: 153.h,
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
