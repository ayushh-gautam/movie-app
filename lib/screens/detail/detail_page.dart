// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get.dart';
import 'package:movie_app/screens/detail/widget/movie_cast.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:readmore/readmore.dart';

import '../../models/movie_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          kBackgroundcolor.withOpacity(0.9),
                          Colors.transparent
                        ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                    height: 550.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${myData.posterPath!}'),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleText(
                                  text: myData.title!,
                                  fontSize: 20,
                                ),
                                TitleText(
                                  text: myData.releaseDate
                                      .toString()
                                      .split('-')
                                      .first,
                                  color: Colors.white38,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: ((context, index) => Container(
                                  width: 95,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade600,
                                      borderRadius: BorderRadius.circular(20)),
                                ).marginAll(10)),
                          ),
                        ),
                        //MOVIE DETAILS

                        ReadMoreText(
                          myData.overview!,
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          moreStyle: const TextStyle(color: kMoreText),
                          lessStyle: const TextStyle(color: kMoreText),
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 16),
                        ),

                      const  SizedBox(
                          height: 10,
                        ),

                       const  MovieCast(),
                      ],
                    ),
                  ).marginSymmetric(horizontal: 20)
                ],
              ),
            ),
            Positioned(
                left: 5,
                top: 8,
                child: IconButton(
                  color: Colors.red,
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(FontAwesomeIcons.arrowLeft),
                )),
          ],
        ),
      ),
    );
  }
}
