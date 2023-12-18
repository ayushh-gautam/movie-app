// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/utils.dart';

import 'package:movie_app/widgets/custom_text.dart';
import 'package:movie_app/screens/Home/widgets/popular_slider.dart';
import 'package:movie_app/screens/Home/widgets/search_bar.dart';
import 'package:movie_app/utils/constants.dart';

import 'widgets/genre_slider.dart';
import 'widgets/trending_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
          title: MyText(
            text: 'Hi, ayush',
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
            MyText(text: 'Trending', color: kTextSubcolor, fontSize: 25.h),
            Gap(10.h),
            TrendingSlider(),
            Gap(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(text: 'Popular', color: kTextSubcolor, fontSize: 25.h),
                MyText(text: 'See all', color: kMoreText, fontSize: 22.h),
              ],
            ),
            Gap(10.h),
            PopularSlider(),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(text: 'Upcoming', color: kTextSubcolor, fontSize: 25.h),
                MyText(text: 'See all', color: kMoreText, fontSize: 22.h),
              ],
            ),
            UpcomingSlider(),
          ],
        ).marginSymmetric(horizontal: 20),
      ),
    );
  }
}
