import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Api/makeup_product.dart';
import 'package:markat_store/Api/wishlist_product.dart';
import 'package:markat_store/Screens/Home/Product/product_details.dart';
import 'package:markat_store/models/Category.dart';
import 'package:markat_store/models/Sub_Category.dart';
import 'package:markat_store/models/product.dart';

import '../../../Widgets/fade_in_animation.dart';
import '../../../getx/address_getx_controller.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.category});
  final Category category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> category = [
    'Bath & Body',
    'Bath & Body 1',
    'Bath & Body 2',
  ];

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
  late List<Products> products = <Products>[];
  late Future<List<Products>> _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = MakeUpProductController()
        .getProductByCategoryid(widget.category.categoryId!);
    print(widget.category.categoryId);
  }

  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());

  @override
  Widget build(BuildContext context) {
    SubCategory selectedValue = widget.category.children!.isNotEmpty
        ? widget.category.children!.first
        : SubCategory();

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // backgroundColor: Colors.white,
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Category Details",
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
            SizedBox(
              height: 19.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    widget.category.name!.toUpperCase(),
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Visibility(
                    visible: widget.category.children!.isNotEmpty,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0XFFC4C4C4).withOpacity(.3),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: DropdownButton<SubCategory>(
                        value: selectedValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        style: GoogleFonts.tajawal(
                          fontSize: 14.sp,
                          color: Color(0XFF555555),
                        ),
                        borderRadius: BorderRadius.circular(15.r),
                        underline: Container(),
                        items: widget.category.children!
                            .map<DropdownMenuItem<SubCategory>>(
                                (SubCategory value) {
                          return DropdownMenuItem<SubCategory>(
                            value: value,
                            child: Text(value.name!),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isGridView = !isGridView;
                      });
                    },
                    child: Container(
                      height: 36.h,
                      width: 36.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0XFFC4C4C4).withOpacity(.3),
                      ),
                      child: Center(
                        child: isGridView
                            ? SvgPicture.asset("assets/images/Listview.svg")
                            : SvgPicture.asset("assets/images/grid view.svg"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFC4C4C4).withOpacity(.3),
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/Filter.svg"),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: widget.category.children!.isNotEmpty,
              child: SizedBox(
                height: 52.h,
                child: Padding(
                  padding: EdgeInsets.only(top: 12.h, left: 16.w),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.category.children!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 52.h,
                        width: 132.w,
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(
                            color: Color(0XFFDEDEDE),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.category.children![index].name!,
                              style: GoogleFonts.tajawal(
                                fontSize: 15.sp,
                                color: Color(0XFF333333),
                              ),
                            ),
                            Icon(
                              Icons.close,
                              size: 20,
                              color: Color(0xff555555),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
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
                  return isGridView
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // crossAxisSpacing: 30.w,
                              // mainAxisSpacing: 24.h,
                              mainAxisExtent: 265.h,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => ProductDetails(
                                        product: products[index],
                                      ));
                                },
                                child: SizedBox(
                                  height: 260.h,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 200.h,
                                            child: CachedNetworkImage(
                                              imageUrl: products[index].thumb ==
                                                      null
                                                  ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                                  : "http://appma.markatstore.com/image/" +
                                                      products[index].thumb!,
                                              height: 150.h,
                                              width: double.infinity,
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              progressIndicatorBuilder:
                                                  (context, url,
                                                          downloadProgress) =>
                                                      SizedBox(
                                                height: 30,
                                                width: 30,
                                                child:
                                                    CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                            //  Image.network(products[index].thumb!),
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
                                                            products[index]
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
                                                                  products[
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
                                                                  products[
                                                                          index]
                                                                      .productId!);
                                                      Get.back();
                                                      print(response);
                                                    }
                                                  },
                                                  icon: Icon(
                                                    _noteGetxController
                                                            .wishlistProducts
                                                            .where((p0) =>
                                                                p0.productId ==
                                                                products[index]
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
                                          products[index].name!,
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
                                        products[index].price!,
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
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: ListView.builder(
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
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 7.h,
                                          ),
                                          SizedBox(
                                            width: 200.w,
                                            height: 40.h,
                                            child: Text(
                                              products[index]
                                                  .name!
                                                  .toUpperCase(),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
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
                                              if (_noteGetxController
                                                  .wishlistProducts
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
                                                            products[index]
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
                                                            products[index]
                                                                .productId!);
                                                Get.back();
                                                print(response);
                                              }
                                            },
                                            child: Icon(
                                              _noteGetxController
                                                      .wishlistProducts
                                                      .where((p0) =>
                                                          p0.productId ==
                                                          products[index]
                                                              .productId)
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
                          ),
                        );
                } else {
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
                            'لا يوجد منتجات',
                            style: GoogleFonts.tajawal(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(
              height: 100.h,
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
