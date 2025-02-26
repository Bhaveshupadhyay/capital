import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/theme/app_color.dart';


class CustomTextField extends StatelessWidget {

  final String hintText;
  final Icon? icon;
  final TextEditingController textEditingController;
  final VoidCallback? onIconTap;
  final VoidCallback? onTap;
  final Function(String)? onTextChanged;
  final TextInputType keyboardType;
  final Color? borderColor;

  const CustomTextField({super.key, required this.hintText, this.icon,
    required this.textEditingController, this.onIconTap, required this.keyboardType, this.borderColor, this.onTap, this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
              color: borderColor?? AppColor.borderColor.withValues(alpha: 0.5)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              onTap: onTap,
              controller: textEditingController,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 15.sp,
                    color: Colors.black54
                ),
              ),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 15.sp,
                color: AppColor.blackColor,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "$hintText is missing!";
                }
                return null;
              },
              onChanged: onTextChanged,
            ),
          ),

          if(icon!=null)
            InkWell(
              onTap: onIconTap,
              child: icon,
            ),
          SizedBox(width: 10.w,),
        ],
      ),
    );
  }
}
