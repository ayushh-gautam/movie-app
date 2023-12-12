import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/popular_movie_controller.dart';
import 'package:movie_app/screens/detail/detail_page.dart';
import 'package:movie_app/widgets/customText.dart';
import 'package:movie_app/widgets/title_text.dart';

class MyList extends StatelessWidget {
  MyList({super.key});

  PopularMoviesController controller = Get.put(PopularMoviesController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 358,
        child: Obx(() {
          if (controller.popularMovies.value == null) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
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
                                  BorderRadius.all(Radius.circular(25)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500${controller.popularMovieData[index].posterPath!}',
                                ),
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                                scale: 1,
                              ),
                              gradient: LinearGradient(colors: [
                                Colors.red.withOpacity(
                                  0.8,
                                ),
                                Colors.green
                              ])),
                        ).marginAll(10)),
                    Positioned(
                      left: 15,
                      right: 15,
                      bottom: 0,
                      child: Row(
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
                          SizedBox(
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
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
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
