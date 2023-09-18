import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Api/register.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController email;
  late TextEditingController telephone;
  late TextEditingController company;
  late TextEditingController address_1;
  late TextEditingController address_2;
  late TextEditingController city;
  late TextEditingController postcode;
  late TextEditingController country_id;
  late TextEditingController zone_id;
  late TextEditingController password;
  late TextEditingController confirm;
  late TextEditingController newsletter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstname = TextEditingController();
    lastname = TextEditingController();
    email = TextEditingController();
    telephone = TextEditingController();
    company = TextEditingController();
    address_1 = TextEditingController();
    address_2 = TextEditingController();
    city = TextEditingController();
    postcode = TextEditingController();
    country_id = TextEditingController();
    zone_id = TextEditingController();
    password = TextEditingController();
    confirm = TextEditingController();
    newsletter = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    telephone.dispose();
    company.dispose();
    address_1.dispose();
    address_2.dispose();
    city.dispose();
    postcode.dispose();
    country_id.dispose();
    zone_id.dispose();
    password.dispose();
    confirm.dispose();
    newsletter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          SizedBox(
            height: 16.h,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
              onPressed: () => Get.back(),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Sign up",
            style: GoogleFonts.tajawal(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Use spectre to create wireframes extremely \nfast and ship fast 🚀",
            style: GoogleFonts.tajawal(
              fontSize: 16.sp,
              color: Color(0xff6F7985),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          TextField(
            controller: firstname,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFFECEEF1),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter First Name",
              hintStyle: GoogleFonts.tajawal(
                fontSize: 16.sp,
                color: Color(0XFF7A7C8B),
              ),
              suffixIcon: SvgPicture.asset(
                "assets/images/Profile.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          TextField(
            controller: lastname,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFFECEEF1),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter Last Name",
              hintStyle: GoogleFonts.tajawal(
                fontSize: 16.sp,
                color: Color(0XFF7A7C8B),
              ),
              suffixIcon: SvgPicture.asset(
                "assets/images/Profile.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFFECEEF1),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter Email Address",
              hintStyle: GoogleFonts.tajawal(
                fontSize: 16.sp,
                color: Color(0XFF7A7C8B),
              ),
              suffixIcon: SvgPicture.asset(
                "assets/images/Message.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFFECEEF1),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter Password",
              hintStyle: GoogleFonts.tajawal(
                fontSize: 16.sp,
                color: Color(0XFF7A7C8B),
              ),
              suffixIcon: SvgPicture.asset(
                "assets/images/Password.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          TextField(
            controller: confirm,
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFFECEEF1),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter Confirm Password",
              hintStyle: GoogleFonts.tajawal(
                fontSize: 16.sp,
                color: Color(0XFF7A7C8B),
              ),
              suffixIcon: SvgPicture.asset(
                "assets/images/Password.svg",
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          ElevatedButton(
            onPressed: () {
              register();
              // Get.to(() => HomeScreen());
            },
            child: Text(
              "Confirm",
              style: GoogleFonts.tajawal(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.withOpacity(.9),
              minimumSize: Size(double.infinity, 56.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextButton(
            onPressed: () {
              Get.off(LoginScreen());
            },
            child: Text(
              "Already registered? Log in",
              style: GoogleFonts.tajawal(
                fontSize: 16.sp,
                color: Color(0xffEB7171),
              ),
            ),
          )
        ],
      ),
    ));
  }

  Future<void> register() async {
    await RegisterController().registerCustomer(
        firstName: firstname.text,
        lastName: lastname.text,
        email: email.text,
        telephone: telephone.text,
        company: "",
        address_1: "",
        address_2: "",
        city: "",
        postcode: "",
        country_id: "",
        zone_id: "",
        password: password.text,
        confirm: confirm.text,
        newsletter: "");
  }
}
