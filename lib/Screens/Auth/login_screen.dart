import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markat_store/Api/login.dart';
import 'package:markat_store/Screens/Auth/register_screen.dart';
import 'package:markat_store/Screens/Home/home_screen.dart';
import 'package:markat_store/utils/helpers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(
              height: 155.h,
            ),
            Image.asset(
              "assets/images/logo23.png",
              width: 100.w,
              height: 100.h,
            ),
            // Text(
            //   "Welcome\nback",
            //   style: GoogleFonts.tajawal(
            //     fontSize: 48.sp,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(
              height: 120.h,
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
                hintText: "Enter email address",
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
                suffixIcon: Icon(Icons.lock_outline),
              ),
            ),
            SizedBox(
              height: 25.h,
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
                final response = await LoginController()
                    .loginCustomer(email: email.text, password: password.text);
                if (response) {
                  Get.off(HomeScreen());
                  Helpers.showSnackBar(
                      context: context, message: "Login Successfully");
                } else {
                  Get.back();
                  Helpers.showSnackBar(
                      context: context, message: "Login Faild");
                }
              },
              child: Text(
                "Login",
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
                Get.to(() => RegisterScreen());
              },
              child: Text(
                "New here? Sign up ",
                style: GoogleFonts.tajawal(
                  fontSize: 16.sp,
                  color: Color(0xffEB7171),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
