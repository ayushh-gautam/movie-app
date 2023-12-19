// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/popular_movie_controller.dart';
import 'package:movie_app/screens/detail/detail_page.dart';
import 'package:movie_app/widgets/shimmer_effect.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:shimmer/shimmer.dart';

class PopularSlider extends StatelessWidget {
  PopularSlider({super.key});

  PopularMoviesController controller = Get.put(PopularMoviesController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 358,
        child: Obx(() {
          if (controller.popularMovies.value == null) {
            return Shimmerr(
              height: 290,
              width: 175,
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.popularMovies.value!.results!.length,
              itemBuilder: ((context, index) {
                return Stack(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.to(
                            DetailPage(
                                myData: controller.popularMovieData[index]),
                          );
                        },
                        child: Container(
                          width: 175,
                          height: 290,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${controller.popularMovieData[index].posterPath!}',
                              ),
                              fit: BoxFit.fill,
                              alignment: Alignment.center,
                              scale: 1,
                            ),
                          ),
                        ).marginOnly(top: 10, right: 15)),
                    Positioned(
                      left: 8,
                      right: 15,
                      bottom: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                  text: controller
                                      .popularMovieData[index].title!
                                      .split(':')
                                      .first),
                              TitleText(
                                  color: Colors.white54,
                                  text: controller
                                      .popularMovieData[index].releaseDate
                                      .toString()
                                      .split('-')
                                      .first)
                            ],
                          )),
                          const SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              TitleText(
                                      text: controller
                                          .popularMovieData[index].voteAverage
                                          .toString()
                                          .split('.')
                                          .first)
                                  .marginOnly(right: 5),
                              const Icon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.yellow,
                                size: 18,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }),
            );
          }
        }));
  }
}
