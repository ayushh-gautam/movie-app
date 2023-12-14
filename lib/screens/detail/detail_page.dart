// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/widgets/customText.dart';
import 'package:movie_app/widgets/title_text.dart';

import '../../models/movie_model.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    Key? key,
    required this.myData,
  }) : super(key: key);
  final Result myData;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundcolor,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    kBackgroundcolor.withOpacity(0.8),
                    Colors.transparent
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                  height: 550.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500${myData.posterPath!}'),
                          fit: BoxFit.fill)),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [TitleText(text: myData.title!)],
                          )
                        ],
                      )
                    ],
                  ),
                ).marginSymmetric(horizontal: 20)
              ],
            ),
            MyText(
              text: myData.overview!,
              fontSize: 19,
              color: Colors.white,
            ).marginAll(14),
          ],
        ),
      ),
    );
  }
}
