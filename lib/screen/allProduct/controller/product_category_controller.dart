import 'package:ecomerce/screen/home/model/product_model.dart';
import 'package:get/get.dart';

class ProductCategoryController extends GetxController {
  @override
  void onInit() {
    isLoding=true;
    super.onInit();
  }
  late List<ProductModel> productlist;
  bool isLoding=true;
  
  

  void findCategoryId(String categoryId, List<ProductModel> list) {
    productlist =list.where((element) => element.category.contains(categoryId)).toList();
    update();
    isLoding=false;
    update();
  }
}
