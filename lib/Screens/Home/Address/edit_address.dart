import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Screens/Home/Address/address.dart';
import 'package:markat_store/models/country.dart';
import 'package:markat_store/models/customer_address.dart';
import 'package:markat_store/models/zones.dart';
import 'package:markat_store/utils/helpers.dart';

import '../../../Api/add_address.dart';
import '../../../getx/address_getx_controller.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key, required this.customerAddress});
  final CustomerAddresses customerAddress;

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  CategoriesGetxController _noteGetxController =
      Get.put(CategoriesGetxController());
  Country? dropdownvalue;
  Zones? dropdownvalue1;

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController company;
  late TextEditingController address1;
  late TextEditingController address2;
  late TextEditingController city;
  late TextEditingController postCode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstName = TextEditingController();
    lastName = TextEditingController();
    company = TextEditingController();
    address1 = TextEditingController();
    address2 = TextEditingController();
    city = TextEditingController();
    postCode = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstName.dispose();
    lastName.dispose();
    company.dispose();
    address1.dispose();
    address2.dispose();
    city.dispose();
    postCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "address".toUpperCase(),
          style: GoogleFonts.tajawal(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0XFFE7EAEF),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 16.w),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Edit shipping address".toUpperCase(),
                style: GoogleFonts.tajawal(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 3,
                ),
              ),
            ),
          ),
          Image.asset("assets/images/3.png"),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: firstName
                      ..text = widget.customerAddress.firstname == null
                          ? ""
                          : widget.customerAddress.firstname!,
                    decoration: InputDecoration(
                      hintText: "First name",
                      hintStyle: GoogleFonts.tajawal(
                        fontSize: 15.sp,
                        color: Color(0Xff979797),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: TextField(
                    controller: lastName
                      ..text = widget.customerAddress.lastname == null
                          ? ""
                          : widget.customerAddress.lastname!,
                    decoration: InputDecoration(
                      hintText: "Last name",
                      hintStyle: GoogleFonts.tajawal(
                        fontSize: 15.sp,
                        color: Color(0Xff979797),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              controller: company
                ..text = widget.customerAddress.company == null
                    ? ""
                    : widget.customerAddress.company!,
              decoration: InputDecoration(
                hintText: "Company",
                hintStyle: GoogleFonts.tajawal(
                  fontSize: 15.sp,
                  color: Color(0Xff979797),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              controller: address1
                ..text = widget.customerAddress.address1 == null
                    ? ""
                    : widget.customerAddress.address1!,
              decoration: InputDecoration(
                hintText: "Address 1",
                hintStyle: GoogleFonts.tajawal(
                  fontSize: 15.sp,
                  color: Color(0Xff979797),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              controller: address2
                ..text = widget.customerAddress.address2 == null
                    ? ""
                    : widget.customerAddress.address2!,
              decoration: InputDecoration(
                hintText: "Address 2",
                hintStyle: GoogleFonts.tajawal(
                  fontSize: 15.sp,
                  color: Color(0Xff979797),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              controller: city
                ..text = widget.customerAddress.city == null
                    ? ""
                    : widget.customerAddress.city!,
              decoration: InputDecoration(
                hintText: "City",
                hintStyle: GoogleFonts.tajawal(
                  fontSize: 15.sp,
                  color: Color(0Xff979797),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextField(
              controller: postCode
                ..text = widget.customerAddress.postcode == null
                    ? ""
                    : widget.customerAddress.postcode!,
              decoration: InputDecoration(
                hintText: "Post Code",
                hintStyle: GoogleFonts.tajawal(
                  fontSize: 15.sp,
                  color: Color(0Xff979797),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(() {
            if (_noteGetxController.isLoadingCountry.value) {
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 80.0,
                ),
              );
            } else {
              if (_noteGetxController.country.isEmpty) {
                return SizedBox();
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: DropdownButton<Country>(
                    isExpanded: true,
                    value: dropdownvalue ??
                        _noteGetxController.country
                            .first, // Provide a default value if dropdownValue is null
                    hint: Text("Select Country"),
                    items: _noteGetxController.country.map((country) {
                      return DropdownMenuItem<Country>(
                        child: Text(country.name!), // Label of the item
                        value: country, // Value of the item
                      );
                    }).toList(),
                    onChanged: (value) {
                      // Update the selected value
                      setState(() {
                        dropdownvalue = value!;
                      });
                    },
                  ),
                );
              }
            }
          }),
          SizedBox(
            height: 20.h,
          ),
          Obx(() {
            if (_noteGetxController.isLoadingZones.value) {
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 80.0,
                ),
              );
            } else {
              if (_noteGetxController.zones.isEmpty) {
                return SizedBox();
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: DropdownButton<Zones>(
                    isExpanded: true,
                    value: dropdownvalue1 ??
                        _noteGetxController.zones
                            .first, // Provide a default value if dropdownValue is null
                    hint: Text("Select Region / State"),
                    items: _noteGetxController.zones.map((zone) {
                      return DropdownMenuItem<Zones>(
                        child: Text(zone.name!), // Label of the item
                        value: zone, // Value of the item
                      );
                    }).toList(),
                    onChanged: (value) {
                      // Update the selected value
                      setState(() {
                        dropdownvalue1 = value!;
                      });
                    },
                  ),
                );
              }
            }
          }),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ElevatedButton(
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
                final response = await AddAddressController().editaddress(
                    firstname: firstName.text,
                    lastname: lastName.text,
                    company: company.text,
                    address_1: address1.text,
                    address_2: address2.text,
                    city: city.text,
                    postcode: postCode.text,
                    country_id: dropdownvalue == null
                        ? widget.customerAddress.countryId!
                        : dropdownvalue!.countryId!,
                    zone_id: dropdownvalue1 == null
                        ? widget.customerAddress.zoneId!
                        : dropdownvalue1!.zoneId!,
                    customer_id: "1",
                    address_id: widget.customerAddress.addressId!,
                    context: context);
                if (response) {
                  Helpers.showSnackBar(
                      context: context,
                      message: "Address Updated Successfully");
                } else {
                  Helpers.showSnackBar(
                      context: context,
                      message: "Address Updated Failed",
                      error: true);
                }
                Get.back();
              },
              child: Text(
                "Add now".toUpperCase(),
                style: GoogleFonts.tajawal(fontSize: 16.sp),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
