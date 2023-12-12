// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/widgets/customText.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 500,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500' + myData.posterPath!,
                        colorBlendMode: BlendMode.softLight,
                        color: kBackgroundcolor,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 500,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.red,
                            size: 30,
                          )),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            text: myData.title!,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.yellow,
                          ),
                        ],
                      ).marginOnly(right: 15, left: 10),
                    ),
                  ],
                )),
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
