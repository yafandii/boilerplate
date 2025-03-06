import 'package:boilerplate/core/constant/app_string.dart';
import 'package:boilerplate/ui/module/home.dart/home_screen.dart';
import 'package:boilerplate/utils/flavor.dart';
import 'package:boilerplate/utils/utilities.dart';
import 'package:flutter/material.dart';

Future<FlavorConfig> _setupFlavor() async {
  final flavor = await AppUtils.flavorConfig();
  AppUtils.logDebug('Main # $flavor');
  AppString.baseUrl = flavor.baseUrl;

  //tambahkan api lain jika ada
  return flavor;
}

void main() {
  runApp(const HomeScreen());
}
