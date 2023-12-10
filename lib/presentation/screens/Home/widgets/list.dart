import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: ((context, index) {
            return Container(
              height: 300,
              width: 300,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://i.pinimg.com/564x/16/f6/9d/16f69dcc68632f1950b5a1668bddd1d9.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ).marginAll(5);
          })),
    );
  }
}
