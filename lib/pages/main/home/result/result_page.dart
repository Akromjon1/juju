import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/app_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../views/svg_widget.dart';
import '../../main_controller.dart';
import 'result_controller.dart';

class ResultPage extends StatelessWidget {
  static const String id = "/result_page";

  const ResultPage({Key? key}) : super(key: key);

  /// Doniyor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// AppBar
      appBar: appbar(
          title: "my_booking".tr,
          leadingFunction: null,
          actionsFunction: null,
          centerTitle: true,
          leading: false,
          actions: true),
      body: GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) => controller.isClosed == false
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: const [
                        Icon(
                          CupertinoIcons.clear_circled,
                          size: 84.0,
                          color: AppColors.redResult,
                        ),
                        SizedBox(height: 38),
                        Text(
                          "You have not booked a seat",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 220,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.15,
                          vertical: Get.height * .03),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        color: AppColors.activeColor,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.25),
                              blurRadius: 4.0,
                              offset: const Offset(0, 4)),
                        ],
                      ),
                      height: 70,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.menus
                            .map((menu) => bottomButton(menu, controller))
                            .toList(),
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: const [
                         Icon(
                          Icons.check_circle_outline,
                          size: 84.0,
                          color: AppColors.greenCheck,
                        ),
                        SizedBox(height: 38),
                        Text(
                          "Have you booked a seat \n    we will wait for you",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 220,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.15,
                          vertical: Get.height * .03),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36),
                        color: AppColors.activeColor,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xFF000000).withOpacity(0.25),
                              blurRadius: 4.0,
                              offset: const Offset(0, 4)),
                        ],
                      ),
                      height: 70,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.menus
                            .map((menu) => bottomButton(menu, controller))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget bottomButton(String name, MainController controller) {
    return MaterialButton(
      disabledColor: AppColors.borderColor,
      minWidth: 50,
      height: 50,
      padding: const EdgeInsets.all(2),
      elevation: 0,
      splashColor: AppColors.activeColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      color: controller.selectedMenu == name
          ? AppColors.mainColor
          : AppColors.activeColor,
      child: OpenSVG(
          path: name,
          width: 26,
          height: 26,
          isGradient: false,
          color: controller.selectedMenu == name
              ? AppColors.activeColor
              : AppColors.borderColor),
      onPressed: () => controller.openPage(name),
    );
  }
}
