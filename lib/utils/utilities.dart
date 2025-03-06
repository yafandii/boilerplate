import 'package:boilerplate/utils/flavor.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  static Future<FlavorConfig> flavorConfig() async {
    try {
      PackageInfo info = await PackageInfo.fromPlatform();
      final packageName = info.packageName;
      if (packageName.endsWith('dev')) {
        return FlavorConfig.dev();
      } else {
        return FlavorConfig.prod();
      }
    } catch (error) {
      logDebug('AppHelper # flavorConfig error $error');
    }
    return FlavorConfig.prod();
  }

  static bool get isInDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  static void logDebug(String? message) {
    if (isInDebugMode) {
      debugPrint(message, wrapWidth: 1024);
    }
  }
}
