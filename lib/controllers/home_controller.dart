import 'package:capital_hub/api/api.dart';
import 'package:capital_hub/modal/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final TextEditingController searchController = TextEditingController();
  List<Item> _products=[];
  RxList<Item> products=<Item>[].obs;
  var isLoading=false.obs;

  @override
  void onInit() {
    _loadProducts();
    super.onInit();
  }

  Future<void> _loadProducts()async {
    isLoading(true);
    try{
      _products= await Api().getItems();
      products(_products);
      isLoading(false);
    }
    catch(e){
      isLoading(false);
    }

  }

  void filterProducts(String s){
    if(s.isNotEmpty){
      products(_products.where((item)=>
          item.productTitle.toLowerCase().contains(s.toLowerCase())
      ).toList());
      print(products.length);
    }
    else{
      products(_products);
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}