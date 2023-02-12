import 'package:ecomerce/screen/account/account_main/controller/account_controller.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/cart/service/cart_service.dart';
import 'package:ecomerce/screen/order_summery/model/order_model.dart';
import 'package:ecomerce/screen/order_summery/service/order_service.dart';
import 'package:get/get.dart';

class OrderCOntroller extends GetxController{
  OrderService service = OrderService();
  final addresscontrol = Get.put(AcountController());
      final cartcontrol = Get.put(CartController());


  void oderPlace()async{
    List<Product> products=cartcontrol.cartList!.products.map((e) => Product(id: e.id)).toList(); 
  //  final model= OrdersModel(addressId:addresscontrol.addressList[0].id ,products:products,paymentType: );

    // await service.placeOrder(model).then((value) {
    //   if(value !=null){

    //   }
    // });
    
  }
}