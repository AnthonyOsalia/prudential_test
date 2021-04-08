import 'package:prudential_test/routes/routes.dart';
import 'package:prudential_test/utils/TextStyles.dart';
import 'package:prudential_test/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prudential_test/utils/prefs.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 1), () async {
      //check if is logged in
      Get.offAllNamed(Routes.posts);
    });

    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Cc.red_prudential,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Cc.red_prudential,
                radius: 40,
                child: Image.asset(
                  "images/icon.png",
                  width: 70,
                  height: 70,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              /*Text(
                "Welcome to",
                style: Ts.robotoSmall.copyWith(
                  color: CustomColors.white,
                  fontSize: 12,
                  fontFamily: Fonts.RobotoLight,
                  fontWeight: FontWeight.w200,
                ),
              ),*/
              Text(
                "Prudential Uganda",
                style: Ts.robotoMedium.copyWith(
                  color: Cc.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Always Listening, Always Understanding",
                style: Ts.robotoSmall.copyWith(
                  color: Cc.white,
                  fontSize: 12,
                  fontFamily: Fonts.RobotoLight,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
