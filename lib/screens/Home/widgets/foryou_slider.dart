import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

class ForyouSlider extends StatelessWidget {
  const ForyouSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, child) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                'https://i.pinimg.com/564x/6a/b7/e8/6ab7e888b30585fa79e8ff9976e3ea39.jpg',
                height: 400.h,
                fit: BoxFit.contain,
              ),
            ).marginAll(10);
          }),
    );
  }
}
