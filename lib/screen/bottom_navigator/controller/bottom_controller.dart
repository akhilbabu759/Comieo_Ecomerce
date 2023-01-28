import 'package:get/get.dart';

class BottomController extends GetxController{

  
  RxInt selectedIndex=0.obs;
  @override
  void onInit() {
    selectedIndex=0.obs;
    super.onInit();
  }
  void indexChange(int value){
    selectedIndex=value.obs;
    update();
  }
}