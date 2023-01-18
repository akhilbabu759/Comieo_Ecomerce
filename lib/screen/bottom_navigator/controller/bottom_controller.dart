import 'package:get/get.dart';

class BottomController extends GetxController{
  int selectedIndex=0;
  void indexChange(int value){
    selectedIndex=value;
    update();
  }
}