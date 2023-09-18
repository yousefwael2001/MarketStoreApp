import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/fade_in_animation.dart';
import '../getx/address_getx_controller.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
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
                      'لا يوجد موظفين',
                      style: GoogleFonts.tajawal(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _noteGetxController.categories.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 65,
                                          width: 71,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl: _noteGetxController
                                                          .categories[index]
                                                          .image ==
                                                      null
                                                  ? "https://fileinfo.com/img/ss/xl/jpg_44.png"
                                                  : "http://appma.markatstore.com/image/" +
                                                      _noteGetxController
                                                          .categories[index]
                                                          .image!,
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
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              ' الإسم: ' +
                                                  _noteGetxController
                                                      .categories[index].name!,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "الوظيفة: " +
                                                  _noteGetxController
                                                      .categories[index]
                                                      .description!,
                                              style: GoogleFonts.tajawal(
                                                fontSize: 14.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: Color.fromRGBO(80, 85, 170, 1),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          _noteGetxController
                                              .categories[index].name!,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300,
                                            color: Color(0Xff4A4A4A),
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: Colors.black,
                                            decorationThickness: 5.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.phone_android_outlined,
                                          color: Color.fromRGBO(80, 85, 170, 1),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          _noteGetxController
                                              .categories[index].description!,
                                          style: GoogleFonts.tajawal(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.to(() => EmployeeDetails(
                                  //       user_id: _noteGetxController
                                  //           .users[index].id
                                  //           .toString(),
                                  //     ));
                                },
                                child: Container(
                                  height: 60,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0XFFA084DC),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "عرض",
                                        style: GoogleFonts.tajawal(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        }
      }),
    );
  }
}
