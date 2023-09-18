import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Api/customer_address.dart';
import 'package:markat_store/Screens/Home/Address/edit_address.dart';
import 'package:markat_store/Screens/Home/CheckOut/add_address.dart';

import '../../../Widgets/fade_in_animation.dart';
import '../../../models/customer_address.dart';

class CustomerAddress extends StatefulWidget {
  const CustomerAddress({Key? key}) : super(key: key);

  @override
  State<CustomerAddress> createState() => _CustomerAddressState();
}

class _CustomerAddressState extends State<CustomerAddress> {
  List<CustomerAddresses> customerAddress = <CustomerAddresses>[];
  late Future<List<CustomerAddresses>> _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = CustomerAddressController().getCustomerAddress();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Address",
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => AddAddress());
              },
              child: Text("Add Address"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(105, 114, 120, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                maximumSize: Size(140.w, 50.h),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            FutureBuilder<List<CustomerAddresses>>(
              future: CustomerAddressController().getCustomerAddress(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: Colors.blue,
                      size: 80.0,
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  customerAddress = snapshot.data ?? [];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: customerAddress.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => EditAddress(
                                customerAddress: customerAddress[index]));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            height: 190.h,
                            margin: EdgeInsets.only(bottom: 15.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10.r,
                                )
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Name: ",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 18.sp,
                                        color: Color(0XFF333333),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        customerAddress[index].firstname! +
                                            " " +
                                            customerAddress[index].lastname!,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 16.sp,
                                          color: Color(0XFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Company: ",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 18.sp,
                                        color: Color(0XFF333333),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        customerAddress[index].company!,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 16.sp,
                                          color: Color(0XFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Address 1: ",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 18.sp,
                                        color: Color(0XFF333333),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        customerAddress[index].address1!,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 16.sp,
                                          color: Color(0XFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Address 2: ",
                                      style: GoogleFonts.tajawal(
                                        fontSize: 18.sp,
                                        color: Color(0XFF333333),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        customerAddress[index].address2!,
                                        style: GoogleFonts.tajawal(
                                          fontSize: 16.sp,
                                          color: Color(0XFF333333),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  customerAddress[index].city! +
                                      "," +
                                      customerAddress[index].postcode!,
                                  style: GoogleFonts.tajawal(
                                    fontSize: 18.sp,
                                    color: Color(0XFF333333),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.to(() => EditAddress(
                                            customerAddress:
                                                customerAddress[index]));
                                      },
                                      child: Text("edit"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(105, 114, 120, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    ElevatedButton(
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
                                        final response =
                                            await CustomerAddressController()
                                                .deleteCustomerAddress(
                                                    customer_id: "1",
                                                    address_id:
                                                        customerAddress[index]
                                                            .addressId!);
                                        Get.back();
                                        if (response) {
                                          setState(() {
                                            customerAddress.removeAt(index);
                                          });
                                        }
                                      },
                                      child: Text("delete"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(255, 51, 51, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                        ),
                                      ),
                                    )
                                  ],
                                )
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
                            "No Address",
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
            // Expanded(
            //   child: Obx(() {
            //     if (_noteGetxController.isLoadingCustomerAddress.value) {
            //       return Center(
            //         child: SpinKitFadingCircle(
            //           color: Colors.blue,
            //           size: 80.0,
            //         ),
            //       );
            //     } else {
            //       if (_noteGetxController.customerAddress.isEmpty) {
            //         return Center(
            //           child: FadeInAnimation(
            //             delay: 200,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Icon(
            //                   Icons.dangerous_outlined,
            //                   color: Color.fromRGBO(80, 85, 170, 1),
            //                   size: 60,
            //                 ),
            //                 SizedBox(
            //                   height: 15,
            //                 ),
            //                 Text(
            //                   "No Address",
            //                   style: GoogleFonts.tajawal(
            //                       fontSize: 18, fontWeight: FontWeight.bold),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       } else {
            //         return ListView.builder(
            //           itemCount: _noteGetxController.customerAddress.length,
            //           itemBuilder: (context, index) {
            //             return InkWell(
            //               onTap: () {},
            //               child: Container(
            //                 padding: EdgeInsets.symmetric(
            //                     horizontal: 16.w, vertical: 10.h),
            //                 height: 190.h,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(8.r),
            //                   color: Colors.white,
            //                   boxShadow: [
            //                     BoxShadow(
            //                       color: Colors.grey,
            //                       blurRadius: 10.r,
            //                     )
            //                   ],
            //                 ),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Row(
            //                       children: [
            //                         Text(
            //                           "Name: ",
            //                           style: GoogleFonts.tajawal(
            //                             fontSize: 18.sp,
            //                             color: Color(0XFF333333),
            //                             fontWeight: FontWeight.w500,
            //                           ),
            //                         ),
            //                         SizedBox(
            //                           child: Text(
            //                             _noteGetxController
            //                                     .customerAddress[index]
            //                                     .firstname! +
            //                                 " " +
            //                                 _noteGetxController
            //                                     .customerAddress[index]
            //                                     .lastname!,
            //                             style: GoogleFonts.tajawal(
            //                               fontSize: 16.sp,
            //                               color: Color(0XFF333333),
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     Row(
            //                       children: [
            //                         Text(
            //                           "Company: ",
            //                           style: GoogleFonts.tajawal(
            //                             fontSize: 18.sp,
            //                             color: Color(0XFF333333),
            //                             fontWeight: FontWeight.w500,
            //                           ),
            //                         ),
            //                         SizedBox(
            //                           child: Text(
            //                             _noteGetxController
            //                                 .customerAddress[index].company!,
            //                             style: GoogleFonts.tajawal(
            //                               fontSize: 16.sp,
            //                               color: Color(0XFF333333),
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     Row(
            //                       children: [
            //                         Text(
            //                           "Address 1: ",
            //                           style: GoogleFonts.tajawal(
            //                             fontSize: 18.sp,
            //                             color: Color(0XFF333333),
            //                             fontWeight: FontWeight.w500,
            //                           ),
            //                         ),
            //                         SizedBox(
            //                           child: Text(
            //                             _noteGetxController
            //                                 .customerAddress[index].address1!,
            //                             style: GoogleFonts.tajawal(
            //                               fontSize: 16.sp,
            //                               color: Color(0XFF333333),
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     Row(
            //                       children: [
            //                         Text(
            //                           "Address 2: ",
            //                           style: GoogleFonts.tajawal(
            //                             fontSize: 18.sp,
            //                             color: Color(0XFF333333),
            //                             fontWeight: FontWeight.w500,
            //                           ),
            //                         ),
            //                         SizedBox(
            //                           child: Text(
            //                             _noteGetxController
            //                                 .customerAddress[index].address2!,
            //                             style: GoogleFonts.tajawal(
            //                               fontSize: 16.sp,
            //                               color: Color(0XFF333333),
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     Text(
            //                       _noteGetxController
            //                               .customerAddress[index].city! +
            //                           "," +
            //                           _noteGetxController
            //                               .customerAddress[index].postcode!,
            //                       style: GoogleFonts.tajawal(
            //                         fontSize: 18.sp,
            //                         color: Color(0XFF333333),
            //                         fontWeight: FontWeight.w500,
            //                       ),
            //                     ),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: [
            //                         ElevatedButton(
            //                           onPressed: () {},
            //                           child: Text("edit"),
            //                           style: ElevatedButton.styleFrom(
            //                             backgroundColor:
            //                                 Color.fromRGBO(105, 114, 120, 1),
            //                             shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(4.r),
            //                             ),
            //                           ),
            //                         ),
            //                         SizedBox(
            //                           width: 10.w,
            //                         ),
            //                         ElevatedButton(
            //                           onPressed: () async {
            //                             showDialog(
            //                               context: context,
            //                               builder: (context) {
            //                                 return SpinKitFadingCircle(
            //                                   color: Colors.blue,
            //                                   size: 80.0,
            //                                 );
            //                               },
            //                             );
            //                             final response =
            //                                 await CustomerAddressController()
            //                                     .deleteCustomerAddress(
            //                                         customer_id: "1",
            //                                         address_id:
            //                                             _noteGetxController
            //                                                 .customerAddress[
            //                                                     index]
            //                                                 .addressId!);
            //                             Get.back();
            //                             print(response);
            //                           },
            //                           child: Text("delete"),
            //                           style: ElevatedButton.styleFrom(
            //                             backgroundColor:
            //                                 Color.fromRGBO(255, 51, 51, 1),
            //                             shape: RoundedRectangleBorder(
            //                               borderRadius:
            //                                   BorderRadius.circular(4.r),
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             );
            //           },
            //         );
            //       }
            //     }
            //   }),
            // ),
          ],
        ),
      ),
    ));
  }
}
