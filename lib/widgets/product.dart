import 'package:capital_hub/widgets/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:capital_hub/modal/item.dart';

import '../core/theme/app_color.dart';

class Product extends StatelessWidget {
  final Item item;
  const Product({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top: 5.h,bottom: 5.h, left: 10.w,right: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
              color: AppColor.borderColor.withValues(alpha: 0.3)
          ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withValues(alpha: 0.1),
            offset: Offset(0, 4),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: Text('\$${item.productPrice}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.black,
                    fontSize: 20.sp
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                item.productImage[0],
                height: 150.h,
                width: 100.w,
              ),
              Text(item.productTitle,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.blue,
                  fontSize: 18.sp,
                ),
                maxLines: 1,
              ),
              ...List<Widget>.generate(item.productFeatures.length>3? 3 : item.productFeatures.length, (index)=>
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 5.w,
                    children: [
                      Icon(Icons.circle,size: 5.sp,),
                      Flexible(
                        child: Text(item.productFeatures[index],
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.black,
                              fontSize: 15.sp
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),),
              SizedBox(height: 5.h,),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextButton.icon(
                      onPressed: (){

                      },
                      label: Text('Save for later',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.grey.shade400,
                            fontSize: 12.sp
                        ),
                      ),
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      ),
                      icon: Icon(
                        Icons.favorite_border,
                        size: 25.sp,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  Reviews(rating: item.rating, reviews: item.reviews)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
