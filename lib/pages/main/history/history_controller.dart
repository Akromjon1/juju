import 'dart:async';

import 'package:get/get.dart';

import '../../../services/constants/app_assets.dart';

class HistoryController extends SuperController implements GetxController {
  String data = "date";
  RxBool isNull1 = true.obs;
  RxBool isLottie = false.obs;
  Timer? _timer;
  yourIsNull1(){
    isNull1(isNull1.value = false);
  }
  yourIsLottie(){
    isLottie(isLottie.value = true);
    _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if(timer.tick>1){
        timer.cancel();
      }
     Get.back();
    });
  }
  yourIsLottieFalse(){
    isLottie(isLottie.value = false);
    _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      if(timer.tick>1){
        timer.cancel();
      }
     Get.back();
    });
  }
  final List<String> menus = [AppAssets.homeIC, AppAssets.historyIC, AppAssets.personIC];

  String limitedText(String text) {
    return text.length > 27 ? "${text.substring(0, 27)}..." : text;
  }

  int currentPage = 0;

  String selectedMenu = '';

  @override
  void onInit() {
    selectedMenu = menus.first;

    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
    _timer!.cancel();

  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    _timer!.cancel();
  }
}