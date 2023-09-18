import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Api/wishlist_product.dart';
import '../../../Widgets/fade_in_animation.dart';
import '../../../getx/address_getx_controller.dart';
import '../Product/product_details.dart';

class WishListProduct extends StatefulWidget {
  const WishListProduct({super.key});

  @override
  State<WishListProduct> createState() => _WishListProductState();
}

class _WishListProductState extends State<WishListProduct> {
  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "WishList Products",
          style: GoogleFonts.tajawal(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Obx(() {
        if (_noteGetxController.isLoadingWishList.value) {
          return Center(
            child: SpinKitFadingCircle(
              color: Colors.blue,
              size: 80.0,
            ),
          );
        } else {
          if (_noteGetxController.wishlistProducts.isEmpty) {
            return Center(
              child: FadeInAnimation(
                delay: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.dangerous_outlined,
                      color: Color.fromRGBO(80, 85, 170, 1),
                      size: 60,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'لا يوجد عناصر بالمفضلة',
                      style: GoogleFonts.tajawal(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 16.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.w,
                  mainAxisSpacing: 24.h,
                  mainAxisExtent: 265.h,
                ),
                itemCount: _noteGetxController.wishlistProducts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => ProductDetails(
                            product: _noteGetxController.products
                                .where((p0) =>
                                    p0.productId ==
                                    _noteGetxController
                                        .wishlistProducts[index].productId)
                                .first,
                          ));
                    },
                    child: SizedBox(
                      height: 260.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: _noteGetxController.products
                                            .where((p0) =>
                                                p0.productId ==
                                                _noteGetxController
                                                    .wishlistProducts[index]
                                                    .productId)
                                            .first
                                            .price ==
                                        null
                                    ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                    : "http://appma.markatstore.com/image/" +
                                        _noteGetxController.products
                                            .where((p0) =>
                                                p0.productId ==
                                                _noteGetxController
                                                    .wishlistProducts[index]
                                                    .productId)
                                            .first
                                            .thumb!,
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
                                top: 10,
                                left: 10,
                                child: Icon(
                                  Icons.favorite,
                                  color: Color(0XFFDD8560),
                                  size: 28,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: IconButton(
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SpinKitFadingCircle(
                                          color: Colors.blue,
                                          size: 80.0,
                                        );
                                      },
                                    );
                                    bool response =
                                        await ApiWishListProductController()
                                            .deletetProductFromWishList(
                                                context,
                                                "1",
                                                _noteGetxController
                                                    .wishlistProducts[index]
                                                    .productId!);
                                    Get.back();
                                    print(response);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 28,
                                  ),
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
                              _noteGetxController.products
                                  .where((p0) =>
                                      p0.productId ==
                                      _noteGetxController
                                          .wishlistProducts[index].productId)
                                  .first
                                  .name!,
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
                            _noteGetxController.products
                                .where((p0) =>
                                    p0.productId ==
                                    _noteGetxController
                                        .wishlistProducts[index].productId)
                                .first
                                .price!,
                            style: GoogleFonts.tajawal(
                              fontSize: 16.sp,
                              color: Color(0xffEB7171),
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
    ));
  }
}
