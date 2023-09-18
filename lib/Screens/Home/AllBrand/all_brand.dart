import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Screens/Home/BrandDetails/brand_details.dart';

import '../../../Widgets/fade_in_animation.dart';
import '../../../getx/address_getx_controller.dart';
import '../../../models/prands.dart';

class AllBrand extends StatefulWidget {
  const AllBrand({super.key});

  @override
  State<AllBrand> createState() => _AllBrandState();
}

class _AllBrandState extends State<AllBrand> {
  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());

  late TextEditingController _searchcontroller;

  List<Prands> filteredProducts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredProducts = _noteGetxController.prands;
    _searchcontroller = TextEditingController();
    _searchcontroller.addListener(filterProducts);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchcontroller.dispose();
    super.dispose();
  }

  void filterProducts() {
    String query = _searchcontroller.text;
    List<Prands> tempList = [];

    if (query.isNotEmpty) {
      tempList = _noteGetxController.prands.where((prand) {
        return prand.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      tempList = _noteGetxController.prands;
    }

    setState(() {
      filteredProducts = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "All Brands",
          style: GoogleFonts.tajawal(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
            child: TextField(
              cursorHeight: 25,
              cursorColor: Colors.black,
              controller: _searchcontroller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                hintText: 'Search from her',
              ),
            ),
          ),
          Obx(() {
            if (_noteGetxController.isLoadingPrands.value) {
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 80.0,
                ),
              );
            } else {
              if (_noteGetxController.prands.isEmpty) {
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
                          'لا يوجد برند',
                          style: GoogleFonts.tajawal(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return GridView.builder(
                  padding: EdgeInsets.only(right: 16.w, left: 25.w),
                  shrinkWrap: true,
                  itemCount: filteredProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10.h),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => BrandDetails(
                            prands: filteredProducts[index],
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.all(5),
                        height: 121.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 106.w,
                              height: 106.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: CachedNetworkImage(
                                  imageUrl: filteredProducts[index].image ==
                                          null
                                      ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                      : "http://appma.markatstore.com/image/" +
                                          filteredProducts[index].image!,
                                  width: 106.w,
                                  height: 106.h,
                                  fit: BoxFit.cover,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
          }),
        ],
      ),
    ));
  }
}
