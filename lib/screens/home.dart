import 'package:capital_hub/controllers/home_controller.dart';
import 'package:capital_hub/screens/product_details.dart';
import 'package:capital_hub/widgets/custom_text_field.dart';
import 'package:capital_hub/widgets/loader.dart';
import 'package:capital_hub/widgets/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            spacing: 20.h,
            children: [
              SizedBox(height: 10.h,),
              CustomTextField(
                hintText: 'Search',
                textEditingController: homeController.searchController,
                keyboardType: TextInputType.text,
                icon: Icon(Icons.search,size: 25.sp,),
                onTextChanged: (s){
                  homeController.filterProducts(s);
                },
              ),
              Obx((){
                return homeController.isLoading.value && homeController.products.isEmpty?
                Expanded(child: Loader()):
                Expanded(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: ((constraints.maxWidth/2)-10.w)/310.h,
                              crossAxisSpacing: 10.w,
                              mainAxisSpacing: 15.h
                          ),
                          itemCount: homeController.products.length,
                          itemBuilder: (context,index){
                            return InkWell(
                                onTap: ()=>
                                    Get.to(ProductDetails(item: homeController.products[index])),
                                child: Product(item: homeController.products[index],)
                            );
                          }
                      );
                    },
                  ),
                );
              }
              )
            ],
          ),
        ),
      ),
    );
  }
}
