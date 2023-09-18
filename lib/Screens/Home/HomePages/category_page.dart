import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Screens/Home/CategoryDetails/category_details.dart';
import 'package:markat_store/Screens/Home/Product/product_details.dart';
import 'package:markat_store/Widgets/fade_in_animation.dart';

import '../../../getx/address_getx_controller.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> category = [
    'Bath & Body',
    'Bath & Body 1',
    'Bath & Body 2',
  ];
  String selectedValue = "Bath & Body";

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

  bool isGridView = false;
  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Obx(
          () {
            if (_noteGetxController.isLoadingCategory.value) {
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 80.0,
                ),
              );
            } else {
              if (_noteGetxController.categories.isEmpty) {
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
                          'لا يوجد فئات',
                          style: GoogleFonts.tajawal(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return GridView.builder(
                  padding: EdgeInsets.only(top: 15.h),
                  itemCount: _noteGetxController.categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1,
                    mainAxisExtent: 220.h,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => CategoryDetails(
                            category: _noteGetxController.categories[index],
                          ),
                        );
                      },
                      child: Container(
                        height: 180.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: _noteGetxController
                                          .categories[index].image ==
                                      null
                                  ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                  : "http://appma.markatstore.com/image/" +
                                      _noteGetxController
                                          .categories[index].image!,
                              height: 180.h,
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
                                  (context, url, downloadProgress) => SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Align(
                              child: Text(
                                _noteGetxController.categories[index].name!,
                                style: GoogleFonts.tajawal(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // child: Container(
                      //   margin: EdgeInsets.symmetric(
                      //       horizontal: 16.w, vertical: 5.h),
                      //   width: double.infinity,
                      //   height: 150.h,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       image: NetworkImage(
                      //           "http://appma.markatstore.com/image/" +
                      //               _noteGetxController
                      //                   .categories[index].image!),
                      //       fit: BoxFit.fill,
                      //     ),
                      //     borderRadius: BorderRadius.circular(10.r),
                      //   ),
                      //   child: Center(
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           _noteGetxController.categories[index].name!,
                      //           style: GoogleFonts.tajawal(
                      //             fontSize: 18.sp,
                      //             fontWeight: FontWeight.bold,
                      //             // color: Colors.white,
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           width: 10.w,
                      //         ),
                      //         // Text(
                      //         //   _noteGetxController.products
                      //         //           .where((p0) =>
                      //         //               p0.model!.toUpperCase() ==
                      //         //               _noteGetxController
                      //         //                   .categories[index].name)
                      //         //           .length
                      //         //           .toString() +
                      //         //       "عنصر",
                      //         //   style: GoogleFonts.tajawal(
                      //         //     fontSize: 18.sp,
                      //         //     fontWeight: FontWeight.bold,
                      //         //     // color: Colors.white,
                      //         //   ),
                      //         // ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    );
                  },
                );
              }
            }
          },
        ),
      ),
    );
  }
}
