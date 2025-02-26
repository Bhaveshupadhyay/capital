import 'package:get/get.dart';

class ProductController extends GetxController{

  var imageIndex=0.obs;

  void changeImage(int index){
    imageIndex(index);
  }
}