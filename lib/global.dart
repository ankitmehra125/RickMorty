import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rick_morty/common/app_colors.dart';

/// A class to store all the global constants used in the app.
class Global {
  static const double appHzPadding = 20.0;

  /// Function for haptic feedback
  static void hapticFeedback() {
    if (GetPlatform.isIOS) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.vibrate();
    }
  }

  /// Function to check internet connection using the Connectivity package.
  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  /// Function for custom toast messages.
  static void customToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = AppColors.colorRed,
    double fontSize = 16.0,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: AppColors.colorWhite,
      fontSize: fontSize,
    );
  }
}
