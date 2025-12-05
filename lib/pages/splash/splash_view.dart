import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty/common/app_fonts.dart';
import 'package:rick_morty/common/font_sizes.dart';
import 'package:rick_morty/common/common_ui.dart';
import 'package:rick_morty/lang/strings.dart';
import 'package:rick_morty/pages/splash/splash_controller.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

/// A view to display splash screen content.
class SplashView extends StatelessWidget{
  SplashView({super.key});

  final SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WidgetAnimator(
          incomingEffect: WidgetTransitionEffects.incomingScaleUp(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
          ),
          child: Text(Strings.textAppName.tr,style: CommonUi.customTextStyle(
              fontSize: AppFontSizes.font26,
              fontFamily: AppFonts.fontBold
          )),
        ),
      ),
    );
  }
}

