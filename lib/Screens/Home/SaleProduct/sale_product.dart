import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Api/wishlist_product.dart';
import '../../../Widgets/fade_in_animation.dart';
import '../../../getx/address_getx_controller.dart';
import '../../../models/product.dart';
import '../Product/product_details.dart';

class SaleProduct extends StatefulWidget {
  const SaleProduct({super.key});

  @override
  State<SaleProduct> createState() => _SaleProductState();
}

class _SaleProductState extends State<SaleProduct> {
  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());
  late TextEditingController _searchcontroller;

  List<Products> filteredProducts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredProducts = _noteGetxController.saleProducts;
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
    List<Products> tempList = [];

    if (query.isNotEmpty) {
      tempList = _noteGetxController.saleProducts.where((product) {
        return product.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      tempList = _noteGetxController.saleProducts;
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
            "Sale Product",
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
            SizedBox(
              height: 20.h,
            ),
            Obx(() {
              if (_noteGetxController.isLoadingSaleProducts.value) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: Colors.blue,
                    size: 80.0,
                  ),
                );
              } else {
                if (_noteGetxController.saleProducts.isEmpty) {
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
                            "No Products",
                            style: GoogleFonts.tajawal(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 20.h,
                      mainAxisExtent: 265.h,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => ProductDetails(
                                product: filteredProducts[index],
                              ));
                        },
                        child: SizedBox(
                          height: 260.h,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 200.h,
                                    child: CachedNetworkImage(
                                      imageUrl: filteredProducts[index].thumb ==
                                              null
                                          ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                          : "http://appma.markatstore.com/image/" +
                                              filteredProducts[index].thumb!,
                                      height: 150.h,
                                      width: 180.w,
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
                                  ),
                                  Positioned(
                                      top: 10.h,
                                      left: 10.w,
                                      child: IconButton(
                                          onPressed: () async {
                                            if (_noteGetxController
                                                .wishlistProducts
                                                .where((p0) =>
                                                    p0.productId ==
                                                    filteredProducts[index]
                                                        .productId)
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
                                                          filteredProducts[
                                                                  index]
                                                              .productId!);
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
                                                          filteredProducts[
                                                                  index]
                                                              .productId!);
                                              Get.back();
                                              print(response);
                                            }
                                          },
                                          icon: Icon(
                                            _noteGetxController.wishlistProducts
                                                    .where((p0) =>
                                                        p0.productId ==
                                                        filteredProducts[index]
                                                            .productId)
                                                    .isEmpty
                                                ? Icons.favorite_border
                                                : Icons.favorite,
                                            color: Color(0XFFDD8560),
                                          ))),
                                  Positioned(
                                    bottom: 10.h,
                                    right: 10.w,
                                    child: SvgPicture.asset(
                                        "assets/images/shopping bag.svg"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              SizedBox(
                                width: 150.w,
                                child: Text(
                                  filteredProducts[index].name!,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 12.sp,
                                    color: Color(0XFF333333),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                filteredProducts[index].price!,
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
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
