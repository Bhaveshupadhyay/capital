import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reviews extends StatelessWidget {
  final double rating;
  final int reviews;
  const Reviews({super.key, required this.rating, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingBarIndicator(
          rating: rating,
          direction: Axis.horizontal,
          itemCount: 5,
          itemSize: 18.sp,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
        ),
        Text('$reviews reviews',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colors.blue,
              fontSize: 13.sp
          ),
        ),
      ],
    );
  }
}
