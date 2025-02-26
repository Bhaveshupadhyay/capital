import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColor.blueColor));
  }
}
