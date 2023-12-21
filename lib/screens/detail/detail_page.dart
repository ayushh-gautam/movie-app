// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/movie_cast_controller.dart';
import 'package:movie_app/utils/constants.dart';
import 'package:movie_app/widgets/shimmer_effect.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:readmore/readmore.dart';
import '../../models/movie_model.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    Key? key,
    required this.myData,
  }) : super(key: key);
  final Result myData;

  var controller = Get.put(MovieCastController());
  @override
  Widget build(BuildContext context) {
    controller.fetchMovieCast(myData.id!);
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
                                  text: myData.title!.split(':').first,
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

                        const SizedBox(
                          height: 10,
                        ),
//casttt

                        TitleText(
                          text: 'Casts',
                          fontSize: 20,
                        ),
                        SizedBox(
                          height: 200,
                          child: GetBuilder<MovieCastController>(
                            init: MovieCastController(),
                            builder: (value) {
                              if (value.isLoaded) {
                                return ListView.builder(
                                  itemCount: value.movieCast?.cast?.length ?? 0,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final castData =
                                        value.movieCast!.cast?[index];
                                    if (castData!.profilePath != null) {
                                      var imageUrl =
                                          'https://image.tmdb.org/t/p/w500' +
                                              castData.profilePath!;
                                      return Column(
                                        children: [
                                          Container(
                                            clipBehavior: Clip.antiAlias,
                                            height: 130,
                                            width: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Image.network(
                                              imageUrl,
                                              height: 100,
                                              width: 100,
                                              scale: 1,
                                              fit: BoxFit.cover,
                                              alignment: Alignment.center,
                                            ),
                                          ).marginAll(10),
                                          TitleText(text: castData.name!)
                                              .paddingOnly(left: 10, right: 10),
                                        ],
                                      );
                                    }

                                    return Shimmerr(height: 100, width: 100);
                                  },
                                );
                              } else {
                                return Shimmerr(height: 130, width: 100);
                              }
                            },
                          ),
                        ),

                        //Trailer
                        TitleText(text: 'Trailer').marginOnly(top: 15),

                        Container(
                          height: 200,
                          width: double.infinity,
                          child: Center(
                            child: TitleText(text: 'Trailer shows here'),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(18)),
                        ).marginOnly(bottom: 20, top: 10)
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
