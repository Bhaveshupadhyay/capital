import 'package:capital_hub/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../modal/item.dart';
import '../widgets/reviews.dart';

class ProductDetails extends StatelessWidget {
  final Item item;
  const ProductDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final ProductController productController= Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.productTitle,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 30.sp,
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Text(_formatDate(item.date),style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14.sp
                    ),
                    ),
                  ],
                ),
              ),
              Obx(()=>
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Image.network(_getImage(productController.imageIndex.value),height: MediaQuery.sizeOf(context).height * .3,)
                      ),
                      SizedBox(height: 30.h,),
                      SizedBox(
                        height: 0.1.sh,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: EdgeInsets.only(left: index==0? 20.w:0,right: 20.w),
                                child: InkWell(
                                  onTap: (){
                                    productController.changeImage(index);
                                  },
                                  child: Container(
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.r),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: index == productController.imageIndex.value? Colors.blue :
                                            Theme.of(context).brightness==Brightness.light ? Colors.black26 : Colors.white24,
                                            width: index == productController.imageIndex.value? 4 : 1
                                        ),
                                        image: DecorationImage(
                                          image: Image.network(_getImage(index)).image,
                                        )
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: 4
                        ),
                      ),
                    ],
                  ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                          text: 'Price  ',
                          style: Theme.of(context).textTheme.bodySmall!.
                          copyWith(fontSize: 16.sp),
                          children: [
                            TextSpan(
                                text: '\$10',
                                style: Theme.of(context).textTheme.titleSmall!.
                                copyWith(fontSize: 30.sp)
                            )
                          ],
                        )
                    ),
                    SizedBox(height: 10.h,),
                    Reviews(rating: item.rating, reviews: item.reviews),
                    SizedBox(height: 10.h,),
                    Text(item.productDescription,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 18.sp),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  String _formatDate(String date){
    DateTime dateTime = DateTime.parse(date);
    // Create a DateFormat instance with the desired format
    return DateFormat("MMM dd, yyyy").format(dateTime);
  }

  String _getImage(int index){
    return item.productImage[index];
  }

}
