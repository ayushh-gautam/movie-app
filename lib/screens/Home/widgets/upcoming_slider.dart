import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/upcoming_movie_controller.dart';
import 'package:movie_app/screens/detail/detail_page.dart';
import 'package:movie_app/widgets/shimmer_effect.dart';
import 'package:movie_app/widgets/title_text.dart';

// ignore: must_be_immutable
class UpcomingSlider extends StatelessWidget {
  UpcomingSlider({super.key});

  UpcomingMoviesController controller = Get.put(UpcomingMoviesController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: Obx(() {
          if (controller.upcomingMovies.value == null) {
            return Shimmerr(height: 180, width: 280);
          } else {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.upcomingMovies.value!.results!.length,
                itemBuilder: ((context, index) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(DetailPage(
                              myData: controller.upcomingMovieData[index]));
                        },
                        child: Container(
                          height: 180,
                          width: 280,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${controller.upcomingMovieData[index].backdropPath}'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(16),
                             ),
                        ).marginOnly(right: 15, top: 10),
                      ),
                      Positioned(
                          bottom: 20,
                          left: 8,
                          child: Row(
                            children: [
                              TitleText(
                                  text: controller
                                      .upcomingMovieData[index].title
                                      .toString()
                                      .split(':')
                                      .first)
                            ],
                          ))
                    ],
                  );
                }));
          }
        }));
  }
}
