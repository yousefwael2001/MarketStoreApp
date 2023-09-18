import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Api/brand_product.dart';

import '../../../Api/wishlist_product.dart';
import '../../../Widgets/fade_in_animation.dart';
import '../../../getx/address_getx_controller.dart';
import '../../../models/prands.dart';
import '../../../models/product.dart';
import '../Product/product_details.dart';

class BrandDetails extends StatefulWidget {
  const BrandDetails({super.key, required this.prands});
  final Prands prands;

  @override
  State<BrandDetails> createState() => _BrandDetailsState();
}

class _BrandDetailsState extends State<BrandDetails> {
  late List<Products> products = <Products>[];
  late Future<List<Products>> _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = ApiBrandProductController()
        .getProductByManufacturerId(widget.prands.manufacturerId!);
  }

  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Brand Details",
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
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            SizedBox(
              height: 10.h,
            ),
            CachedNetworkImage(
              imageUrl: widget.prands.image == null
                  ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                  : "http://appma.markatstore.com/image/" +
                      widget.prands.image!,
              height: 180.h,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
                height: 30,
                width: 30,
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              widget.prands.name!,
              style: GoogleFonts.tajawal(
                fontSize: 20.sp,
                // color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Products",
              style: GoogleFonts.tajawal(
                fontSize: 20.sp,
                // color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            FutureBuilder<List<Products>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: Colors.blue,
                      size: 80.0,
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  products = snapshot.data ?? [];
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => ProductDetails(
                                product: products[index],
                              ));
                        },
                        child: Container(
                          height: 152.h,
                          margin: EdgeInsets.only(bottom: 15.h),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: products[index].thumb == null
                                    ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                    : "http://appma.markatstore.com/image/" +
                                        products[index].thumb!,
                                height: 152.h,
                                width: 100.w,
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
                              SizedBox(
                                width: 12.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  SizedBox(
                                    width: 200.w,
                                    height: 40.h,
                                    child: Text(
                                      products[index].name!.toUpperCase(),
                                      style: GoogleFonts.tajawal(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200.w,
                                    height: 35.h,
                                    child: Text(
                                      products[index].description!,
                                      style: GoogleFonts.tajawal(
                                        fontSize: 12.sp,
                                        color: Color(0XFF555555),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    products[index].price!,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 15.sp,
                                      color: Color(0xffEB7171),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0XFFDD8560),
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "4.8 Ratings",
                                        style: GoogleFonts.tajawal(
                                          fontSize: 12.sp,
                                          color: Color(0XFF555555),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () async {
                                      if (_noteGetxController.wishlistProducts
                                          .where((p0) =>
                                              p0.productId ==
                                              products[index].productId)
                                          .isEmpty) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SpinKitFadingCircle(
                                              color: Colors.blue,
                                              size: 80.0,
                                            );
                                          },
                                        );
                                        final response =
                                            await ApiWishListProductController()
                                                .addProductFromWishList(
                                                    context,
                                                    "1",
                                                    products[index].productId!);
                                        Get.back();
                                        print(response);
                                      } else {
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
                                                    products[index].productId!);
                                        Get.back();
                                        print(response);
                                      }
                                    },
                                    child: Icon(
                                      _noteGetxController.wishlistProducts
                                              .where((p0) =>
                                                  p0.productId ==
                                                  products[index].productId)
                                              .isEmpty
                                          ? Icons.favorite_border
                                          : Icons.favorite,
                                      color: Color(0XFFDD8560),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: FadeInAnimation(
                      delay: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "No Products",
                            style: GoogleFonts.tajawal(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
