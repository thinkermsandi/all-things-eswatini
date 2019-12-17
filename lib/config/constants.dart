import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  //routes
  static const String route_home = "/";
  static const String route_weather = "/weather";
  static const String route_news = "/news";
  static const String route_tv = "/tv";
  static const String route_apps = "/apps";
  static const String route_jobs = "/jobs";

  //strings
  static const String app_name = "All Things Eswatini";
  static const MaterialColor app_color = Colors.grey;

  //fonts
  static const String quickFont = "Quicksand";
  static const String ralewayFont = "Raleway";
  static const String quickBoldFont = "Quicksand_Bold.otf";
  static const String quickNormalFont = "Quicksand_Book.otf";
  static const String quickLightFont = "Quicksand_Light.otf";

  //images
  static const String imageDir = "assets/images";
  static const String pkImage = "$imageDir/pk.jpg";
  static const String profileImage = "$imageDir/profile.jpg";
  static const String blankImage = "$imageDir/blank.jpg";
  static const String dashboardImage = "$imageDir/dashboard.jpg";
  static const String loginImage = "$imageDir/login.jpg";
  static const String paymentImage = "$imageDir/payment.jpg";
  static const String settingsImage = "$imageDir/setting.jpeg";
  static const String shoppingImage = "$imageDir/shopping.jpeg";
  static const String timelineImage = "$imageDir/timeline.jpeg";
  static const String verifyImage = "$imageDir/verification.jpg";

  static const String weatherIconsDir = "assets/icons/weather";
  static const String iconCloud = "$weatherIconsDir/icon_cloud.png";
  static const String iconThunder = "$weatherIconsDir/icon_thunder.png";
  static const String iconCloudLittleRain = "$weatherIconsDir/icon_cloud_little_rain.png";
  static const String iconRain = "$weatherIconsDir/icon_rain.png";
  static const String iconSnow = "$weatherIconsDir/icon_snow.png";
  static const String iconDust = "$weatherIconsDir/icon_dust.png";
  static const String iconSun = "$weatherIconsDir/icon_sun.png";
  static const String iconCloudSun = "$weatherIconsDir/icon_cloud_sun.png";
  static const String iconWind = "$weatherIconsDir/icon_wind.png";
  static const String iconThermometer = "$weatherIconsDir/icon_thermometer.png";
  static const String iconBarometer = "$weatherIconsDir/icon_barometer.png";
  static const String iconLogo = "$weatherIconsDir/icon_logo.png";

  //gneric
  static const String error = "Error";
  static const String success = "Success";
  static const String ok = "OK";
  static const String something_went_wrong = "Something went wrong";

  static const timeBasedGreetings = [
    [0, 4, "Good night"],
    [5, 11, "Good morning"],
    [12, 13, "Good day"],
    [13, 17, "Good afternoon"],
    [18, 24, "Good night"]
  ];

}