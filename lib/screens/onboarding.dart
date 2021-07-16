import 'package:flutter/material.dart';
import 'package:flutter_application_1/constans.dart';
import 'package:flutter_application_1/screens/Login/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/circle_progress_bar.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:nice_intro/intro_screen.dart';
import 'package:nice_intro/intro_screens.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screens = IntroScreens(
      onDone: () {
        Get.to(LoginScreen1());
      },

      onSkip: () {
        Get.to(LoginScreen1());
      },
      footerBgColor: Colors.orange,
      activeDotColor: Colors.white,
      footerRadius: 50,
      textColor: Colors.black,

//      indicatorType: IndicatorType.CIRCLE,
      slides: [
        IntroScreen(
          title: 'Fast',
          imageAsset: 'assest/images/new1.png',
          description: 'Quickly find all your product',
          headerBgColor: Colors.white,
        ),
        IntroScreen(
          title: 'Easily',
          headerBgColor: Colors.white,
          imageAsset: 'assest/images/new2.png',
          description: "We've put your most important, actionable emails here",
        ),
        IntroScreen(
          title: 'Security',
          headerBgColor: Colors.white,
          imageAsset: 'assest/images/log2.png',
          description: "Keep talking with your mates",
        ),
      ],
    );

    return Scaffold(
      body: screens,
    );
  }
}
