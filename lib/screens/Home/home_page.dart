// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/utils.dart';

import 'package:movie_app/CommonWidgets/customText.dart';
import 'package:movie_app/screens/Home/widgets/searchBar.dart';
import 'package:movie_app/utils/constants.dart';

import 'widgets/foryou_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: MyText(
            text: 'Hi, melaine',
            fontSize: 35.h,
            fontWeight: FontWeight.w600,
          ).marginOnly(left: 5.h),
          actions: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                'https://i.pinimg.com/736x/42/c9/3b/42c93be5f2456c26e95e4e1375980132.jpg',
                height: 45.h,
              ),
            ).marginOnly(right: 20.h),
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            MySearchBar(),
            Gap(15.h),
            MyText(text: 'For you', color: kTextSubcolor, fontSize: 25.h),
            Gap(10.h),
            ForyouSlider(),
            Gap(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(text: 'Popular', color: kTextSubcolor, fontSize: 22.h),
                MyText(text: 'See all', color: kMoreText, fontSize: 22.h),
              ],
            ),
            Gap(10.h),
            Container(
              height: 400,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                      height: 300,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://i.pinimg.com/564x/16/f6/9d/16f69dcc68632f1950b5a1668bddd1d9.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).marginAll(5);
                  }),
            ),
            Gap(20),
            Container(
              width: 180,
              height: 150,
              color: Colors.green,
              child: Center(
                child: MyText(text: 'HAHAHAH'),
              ),
            ),
          ],
        ).marginSymmetric(horizontal: 20),
      ),
    );
  }
}
