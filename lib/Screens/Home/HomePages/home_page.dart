import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Api/wishlist_product.dart';
import 'package:markat_store/Screens/Home/AllBrand/all_brand.dart';
import 'package:markat_store/Screens/Home/Product/product_details.dart';
import 'package:markat_store/Widgets/fade_in_animation.dart';
import 'package:markat_store/getx/address_getx_controller.dart';

import '../BestSeller/best_seller.dart';
import '../BrandDetails/brand_details.dart';
import '../CategoryDetails/category_details.dart';
import '../NewArrivedProduct/new_arrived.dart';
import '../SaleProduct/sale_product.dart';

final List<String> imgList = [
  'assets/images/Rectangle 189.png',
  'assets/images/Rectangle 189.png',
  'assets/images/Rectangle 189.png',
  'assets/images/Rectangle 189.png',
  'assets/images/Rectangle 189.png',
];
final List<Widget> imageSliders = imgList
    .map((item) => Padding(
          padding: EdgeInsets.only(
            left: 9.w,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    item,
                    fit: BoxFit.cover,
                    height: 167.h,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      height: 30.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Browse offer",
                            style: GoogleFonts.tajawal(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Transform.rotate(
                              angle: -3.14, child: Icon(Icons.arrow_back))
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ))
    .toList();

final List<Widget> imageSliders1 = imgList
    .map((item) => Stack(
          children: <Widget>[
            Image.asset(
              item,
              fit: BoxFit.fill,
              height: 211.h,
              width: double.infinity,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                height: 30.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Text(
                    "Order now",
                    style: GoogleFonts.tajawal(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ))
    .toList();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CarouselController _controller = CarouselController();
  int _current = 0;

  List<String> category = [
    'assets/images/body_care_icona.png',
    'assets/images/Arabic_musk_perfume.png',
    'assets/images/make_up_icon_3.png',
    'assets/images/make_up_icon_3.png',
  ];

  List<String> categoryName = [
    'BATH & BODY',
    'MAKEUP',
    'HAIR CARE',
    'HAIR CARE',
  ];

  final tabList = [
    'NEW ARRAIVED',
    'SALE',
    'Best Seller',
  ];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  List<String> tabListbody = [
    'assets/images/Rectangle 321.png',
    'assets/images/Rectangle 321.png',
    'assets/images/Rectangle 321.png',
  ];

  List<String> Perfumes = [
    'assets/images/Rectangle 321 (2).png',
    'assets/images/Rectangle 321 (3).png',
    'assets/images/Rectangle 321 (2).png',
    'assets/images/Rectangle 321 (3).png',
  ];

  List<String> MAKEUP = [
    'assets/images/Rectangle 321 (4).png',
    'assets/images/Rectangle 321 (5).png',
    'assets/images/Rectangle 321 (4).png',
    'assets/images/Rectangle 321 (5).png',
    'assets/images/Rectangle 321 (5).png',
    'assets/images/Rectangle 321 (5).png',
  ];

  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 32.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: CarouselSlider(
            carouselController: _controller,
            items: imageSliders,
            //Slider Container properties
            options: CarouselOptions(
              height: 167.h,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: .9,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 27.h,
        ),
        Container(
            height: 185.h,
            decoration: BoxDecoration(
                color: Color(0XFFEAEAEA),
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.fill,
                )),
            child: Obx(() {
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
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _noteGetxController.categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 161,
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        child: InkWell(
                          onTap: () {
                            Get.to(
                              () => CategoryDetails(
                                category: _noteGetxController.categories[index],
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 13.h,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: CachedNetworkImage(
                                  imageUrl: _noteGetxController
                                              .categories[index].image ==
                                          null
                                      ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                      : "http://appma.markatstore.com/image/" +
                                          _noteGetxController
                                              .categories[index].image!,
                                  height: 130.h,
                                  width: 110.w,
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
                              Spacer(),
                              SizedBox(
                                width: 100.w,
                                height: 30.h,
                                child: Text(
                                  _noteGetxController.categories[index].name!,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }
            })),
        SizedBox(
          height: 41.h,
        ),
        Image.asset("assets/images/3.png"),
        SizedBox(
          height: 13.h,
        ),
        TabBar(
          controller: _tabController,
          indicator: PointTabIndicator(
            position: PointTabIndicatorPosition.bottom,
            color: Color(0XFFDD8560),
            insets: EdgeInsets.only(bottom: 6),
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Color(0XFF888888),
          tabs: tabList.map((item) {
            return Tab(
              text: item,
            );
          }).toList(),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 390.h,
          child: TabBarView(
            controller: _tabController,
            children: [
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
                              'لا يوجد منتجات حديثة ',
                              style: GoogleFonts.tajawal(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.only(left: 15.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: _noteGetxController.lastProducts.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => ProductDetails(
                                  product:
                                      _noteGetxController.lastProducts[index],
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 11.w),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 311.h,
                                      child: CachedNetworkImage(
                                        imageUrl: _noteGetxController
                                                    .lastProducts[index]
                                                    .thumb ==
                                                null
                                            ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                            : "http://appma.markatstore.com/image/" +
                                                _noteGetxController
                                                    .lastProducts[index].thumb!,
                                        height: 331.h,
                                        width: 230.w,
                                        fit: BoxFit.cover,
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
                                      // child: Image.asset(tabListbody[index]),
                                    ),
                                    Positioned(
                                      top: 10.h,
                                      left: 30.w,
                                      child: IconButton(
                                        onPressed: () async {
                                          if (_noteGetxController
                                              .wishlistProducts
                                              .where((p0) =>
                                                  p0.productId ==
                                                  _noteGetxController
                                                      .lastProducts[index]
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
                                                        _noteGetxController
                                                            .lastProducts[index]
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
                                                        _noteGetxController
                                                            .lastProducts[index]
                                                            .productId!);
                                            Get.back();
                                            print(response);
                                          }
                                        },
                                        icon: Icon(
                                          _noteGetxController.wishlistProducts
                                                  .where((p0) =>
                                                      p0.productId ==
                                                      _noteGetxController
                                                          .lastProducts[index]
                                                          .productId)
                                                  .isEmpty
                                              ? Icons.favorite_border
                                              : Icons.favorite,
                                          color: Color(0XFFDD8560),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10.h,
                                      right: 30.w,
                                      child: SvgPicture.asset(
                                          "assets/images/shopping bag.svg"),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    _noteGetxController
                                        .lastProducts[index].name!,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 16.sp,
                                      color: Color(0XFF333333),
                                    ),
                                    textAlign: TextAlign.center,
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
                                    color: Color(0xffEB7171),
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
                              'لا يوجد منتجات عليها عروض ',
                              style: GoogleFonts.tajawal(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.only(left: 15.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: _noteGetxController.saleProducts.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => ProductDetails(
                                  product:
                                      _noteGetxController.saleProducts[index],
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 11.w),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 311.h,
                                      child: CachedNetworkImage(
                                        imageUrl: _noteGetxController
                                                    .saleProducts[index]
                                                    .thumb ==
                                                null
                                            ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                            : "http://appma.markatstore.com/image/" +
                                                _noteGetxController
                                                    .saleProducts[index].thumb!,
                                        height: 331.h,
                                        width: 230.w,
                                        fit: BoxFit.cover,
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
                                      // child: Image.asset(tabListbody[index]),
                                    ),
                                    Positioned(
                                        top: 10.h,
                                        left: 30.w,
                                        child: IconButton(
                                            onPressed: () async {
                                              if (_noteGetxController
                                                  .wishlistProducts
                                                  .where((p0) =>
                                                      p0.productId ==
                                                      _noteGetxController
                                                          .saleProducts[index]
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
                                                            _noteGetxController
                                                                .saleProducts[
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
                                                            _noteGetxController
                                                                .saleProducts[
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
                                                          _noteGetxController
                                                              .saleProducts[
                                                                  index]
                                                              .productId)
                                                      .isEmpty
                                                  ? Icons.favorite_border
                                                  : Icons.favorite,
                                              color: Color(0XFFDD8560),
                                            ))),
                                    Positioned(
                                      bottom: 10.h,
                                      right: 30.w,
                                      child: SvgPicture.asset(
                                          "assets/images/shopping bag.svg"),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    _noteGetxController
                                        .saleProducts[index].name!,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 16.sp,
                                      color: Color(0XFF333333),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  _noteGetxController
                                      .saleProducts[index].price!,
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
                    );
                  }
                }
              }),
              Obx(() {
                if (_noteGetxController.isLoadingBestSellerProducts.value) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: Colors.blue,
                      size: 80.0,
                    ),
                  );
                } else {
                  if (_noteGetxController.bestSellerProducts.isEmpty) {
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
                              'لا يوجد منتجات   ',
                              style: GoogleFonts.tajawal(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.only(left: 15.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: _noteGetxController.saleProducts.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => ProductDetails(
                                  product: _noteGetxController
                                      .bestSellerProducts[index],
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 11.w),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 311.h,
                                      child: CachedNetworkImage(
                                        imageUrl: _noteGetxController
                                                    .bestSellerProducts[index]
                                                    .thumb ==
                                                null
                                            ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                            : "http://appma.markatstore.com/image/" +
                                                _noteGetxController
                                                    .bestSellerProducts[index]
                                                    .thumb!,
                                        height: 331.h,
                                        width: 230.w,
                                        fit: BoxFit.cover,
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
                                      // child: Image.asset(tabListbody[index]),
                                    ),
                                    Positioned(
                                        top: 10.h,
                                        left: 30.w,
                                        child: IconButton(
                                            onPressed: () async {
                                              if (_noteGetxController
                                                  .wishlistProducts
                                                  .where((p0) =>
                                                      p0.productId ==
                                                      _noteGetxController
                                                          .bestSellerProducts[
                                                              index]
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
                                                            _noteGetxController
                                                                .bestSellerProducts[
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
                                                            _noteGetxController
                                                                .bestSellerProducts[
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
                                                          _noteGetxController
                                                              .bestSellerProducts[
                                                                  index]
                                                              .productId)
                                                      .isEmpty
                                                  ? Icons.favorite_border
                                                  : Icons.favorite,
                                              color: Color(0XFFDD8560),
                                            ))),
                                    Positioned(
                                      bottom: 10.h,
                                      right: 30.w,
                                      child: SvgPicture.asset(
                                          "assets/images/shopping bag.svg"),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    _noteGetxController
                                        .bestSellerProducts[index].name!,
                                    style: GoogleFonts.tajawal(
                                      fontSize: 16.sp,
                                      color: Color(0XFF333333),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  _noteGetxController
                                      .saleProducts[index].price!,
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
                    );
                  }
                }
              }),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        InkWell(
          onTap: () {
            if (_tabController.index == 0) {
              Get.to(() => NewArrived());
            } else if (_tabController.index == 1) {
              Get.to(() => SaleProduct());
            } else if (_tabController.index == 2) {
              Get.to(() => BestSeller());
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Explore More",
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Transform.rotate(
                angle: -3.14,
                child: Icon(Icons.arrow_back_rounded),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 91.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Perfumes".toUpperCase(),
            style: GoogleFonts.tajawal(
              fontSize: 18.sp,
              color: Color(0XFF000000),
            ),
          ),
        ),
        Image.asset("assets/images/3.png"),
        SizedBox(
          height: 22.h,
        ),
        SizedBox(
            height: 390.h,
            child: Obx(() {
              if (_noteGetxController.isLoadingperfumesProducts.value) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: Colors.blue,
                    size: 80.0,
                  ),
                );
              } else {
                if (_noteGetxController.perfumesProducts.isEmpty) {
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
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _noteGetxController.perfumesProducts.length,
                    padding: EdgeInsets.only(left: 16.w),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => ProductDetails(
                                product:
                                    _noteGetxController.perfumesProducts[index],
                              ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 11.w),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 311.h,
                                    child: CachedNetworkImage(
                                      imageUrl: _noteGetxController
                                                  .perfumesProducts[index]
                                                  .thumb ==
                                              null
                                          ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                          : "http://appma.markatstore.com/image/" +
                                              _noteGetxController
                                                  .perfumesProducts[index]
                                                  .thumb!,
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
                                  ),
                                  Positioned(
                                      top: 10.h,
                                      left: 30.w,
                                      child: IconButton(
                                          onPressed: () async {
                                            if (_noteGetxController
                                                .wishlistProducts
                                                .where((p0) =>
                                                    p0.productId ==
                                                    _noteGetxController
                                                        .perfumesProducts[index]
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
                                                          _noteGetxController
                                                              .perfumesProducts[
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
                                                          _noteGetxController
                                                              .perfumesProducts[
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
                                                        _noteGetxController
                                                            .perfumesProducts[
                                                                index]
                                                            .productId)
                                                    .isEmpty
                                                ? Icons.favorite_border
                                                : Icons.favorite,
                                            color: Color(0XFFDD8560),
                                          ))),
                                  Positioned(
                                    bottom: 10.h,
                                    right: 30.w,
                                    child: SvgPicture.asset(
                                        "assets/images/shopping bag.svg"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  _noteGetxController
                                      .perfumesProducts[index].name!,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.sp,
                                    color: Color(0XFF333333),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                _noteGetxController
                                    .perfumesProducts[index].price!,
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
            })),
        SizedBox(
          height: 30.h,
        ),
        InkWell(
          onTap: () {
            Get.to(() => CategoryDetails(
                category: _noteGetxController.categories
                    .where((p0) => p0.categoryId == "64")
                    .first));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Explore More",
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Transform.rotate(
                angle: -3.14,
                child: Icon(Icons.arrow_back_rounded),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 91.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "MAKEUP".toUpperCase(),
            style: GoogleFonts.tajawal(
              fontSize: 18.sp,
              color: Color(0XFF000000),
            ),
          ),
        ),
        Image.asset("assets/images/3.png"),
        SizedBox(
          height: 22.h,
        ),
        SizedBox(
            height: 390.h,
            child: Obx(() {
              if (_noteGetxController.isLoadingMakeUpProducts.value) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: Colors.blue,
                    size: 80.0,
                  ),
                );
              } else {
                if (_noteGetxController.makeUpProducts.isEmpty) {
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
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _noteGetxController.makeUpProducts.length,
                    padding: EdgeInsets.only(left: 16.w),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => ProductDetails(
                                product:
                                    _noteGetxController.makeUpProducts[index],
                              ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 11.w),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 311.h,
                                    child: CachedNetworkImage(
                                      imageUrl: _noteGetxController
                                                  .makeUpProducts[index]
                                                  .thumb ==
                                              null
                                          ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                          : "http://appma.markatstore.com/image/" +
                                              _noteGetxController
                                                  .makeUpProducts[index].thumb!,
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
                                  ),
                                  Positioned(
                                    top: 10.h,
                                    left: 30.w,
                                    child: IconButton(
                                        onPressed: () async {
                                          if (_noteGetxController
                                              .wishlistProducts
                                              .where((p0) =>
                                                  p0.productId ==
                                                  _noteGetxController
                                                      .makeUpProducts[index]
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
                                                        _noteGetxController
                                                            .makeUpProducts[
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
                                                        _noteGetxController
                                                            .makeUpProducts[
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
                                                      _noteGetxController
                                                          .makeUpProducts[index]
                                                          .productId)
                                                  .isEmpty
                                              ? Icons.favorite_border
                                              : Icons.favorite,
                                          color: Color(0XFFDD8560),
                                        )),
                                  ),
                                  Positioned(
                                    bottom: 10.h,
                                    right: 30.w,
                                    child: SvgPicture.asset(
                                        "assets/images/shopping bag.svg"),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              SizedBox(
                                width: 200.w,
                                child: Text(
                                  _noteGetxController
                                      .makeUpProducts[index].name!,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 16.sp,
                                    color: Color(0XFF333333),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                _noteGetxController
                                    .makeUpProducts[index].price!,
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
            })),
        SizedBox(
          height: 30.h,
        ),
        InkWell(
          onTap: () {
            Get.to(() => CategoryDetails(
                category: _noteGetxController.categories
                    .where((p0) => p0.categoryId == "61")
                    .first));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Explore More",
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Transform.rotate(
                angle: -3.14,
                child: Icon(Icons.arrow_back_rounded),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 122.h,
        ),
        Text(
          "Collections".toUpperCase(),
          style: GoogleFonts.tajawal(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 32.h,
        ),
        CarouselSlider(
          carouselController: _controller,
          items: imageSliders1,
          //Slider Container properties
          options: CarouselOptions(
            height: 211.h,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 1,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        SizedBox(
          height: 91.h,
        ),
        Image.asset("assets/images/3.png"),
        SizedBox(
          height: 39.h,
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
              return SizedBox(
                height: 121.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _noteGetxController.prands.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => BrandDetails(
                            prands: _noteGetxController.prands[index],
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
                          children: [
                            SizedBox(
                              width: 106.w,
                              height: 106.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: CachedNetworkImage(
                                  imageUrl: _noteGetxController
                                              .prands[index].image ==
                                          null
                                      ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                      : "http://appma.markatstore.com/image/" +
                                          _noteGetxController
                                              .prands[index].image!,
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
                ),
              );
            }
          }
        }),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            Get.to(() => AllBrand());
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Explore More",
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Transform.rotate(
                angle: -3.14,
                child: Icon(Icons.arrow_back_rounded),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 43.h,
        ),
        Container(
          height: 465.h,
          color: Color(0XFFF2F2F2),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Image.asset(
                "assets/images/markat-store-logo-300x115 (1) 1.png",
                width: 164.w,
                height: 63.h,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                width: 260,
                child: Text(
                  "Making a luxurious lifestyle accessible for a generous group of women is our daily drive.",
                  style: GoogleFonts.tajawal(
                    fontSize: 14.sp,
                    color: Color(0XFF555555),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Image.asset("assets/images/3.png"),
              SizedBox(
                height: 13.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 87.h,
                    width: 165.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Miroodles Sticker.png"),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "Fast shipping. Free on orders over \$25.",
                          style: GoogleFonts.tajawal(
                            fontSize: 13.sp,
                            color: Color(0XFF555555),
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 87.h,
                    width: 165.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Miroodles Sticker (1).png"),
                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                          width: 120.w,
                          child: Text(
                            "Sustainable process from start to finish.",
                            style: GoogleFonts.tajawal(
                              fontSize: 13.sp,
                              color: Color(0XFF555555),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 87.h,
                    width: 165.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Miroodles Sticker (3).png"),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "Unique designs \nand high-quality materials.",
                          style: GoogleFonts.tajawal(
                            fontSize: 13.sp,
                            color: Color(0XFF555555),
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 87.h,
                    width: 165.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Miroodles Sticker (2).png"),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          "Fast shipping. \nFree on orders over \$25.",
                          style: GoogleFonts.tajawal(
                            fontSize: 13.sp,
                            color: Color(0XFF555555),
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 33.h,
              ),
              Image.asset("assets/images/–.png")
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          "all products".toUpperCase(),
          style: GoogleFonts.tajawal(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        Image.asset("assets/images/3.png"),
        SizedBox(
          height: 26.h,
        ),
        Obx(() {
          if (_noteGetxController.isLoadingProducts.value) {
            return Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
                size: 80.0,
              ),
            );
          } else {
            if (_noteGetxController.products.isEmpty) {
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
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 20.h,
                  mainAxisExtent: 265.h,
                ),
                itemCount: _noteGetxController.products.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(() => ProductDetails(
                            product: _noteGetxController.products[index],
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
                                  imageUrl: _noteGetxController
                                              .products[index].thumb ==
                                          null
                                      ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                      : "http://appma.markatstore.com/image/" +
                                          _noteGetxController
                                              .products[index].thumb!,
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
                                        if (_noteGetxController.wishlistProducts
                                            .where((p0) =>
                                                p0.productId ==
                                                _noteGetxController
                                                    .products[index].productId)
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
                                                      _noteGetxController
                                                          .products[index]
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
                                                      _noteGetxController
                                                          .products[index]
                                                          .productId!);
                                          Get.back();
                                          print(response);
                                        }
                                      },
                                      icon: Icon(
                                        _noteGetxController.wishlistProducts
                                                .where((p0) =>
                                                    p0.productId ==
                                                    _noteGetxController
                                                        .products[index]
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
                              _noteGetxController.products[index].name!,
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
                            _noteGetxController.products[index].price!,
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
        SizedBox(
          height: 153.h,
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
    );
  }
}
