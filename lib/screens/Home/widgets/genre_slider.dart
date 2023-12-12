import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/upcoming_movie_controller.dart';

class GenreSlider extends StatelessWidget {
  GenreSlider({super.key});

  UpcomingMoviesController controller = Get.put(UpcomingMoviesController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Obx(() {
          if (controller.upcomingMovies.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.upcomingMovies.value!.results!.length,
                itemBuilder: ((context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: 170,
                        width: 280,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${controller.upcomingMovieData[index].backdropPath}'),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(colors: [
                              Colors.red.withOpacity(0.5),
                              Colors.green,
                            ])),
                      ).marginOnly(right: 15, top: 10)
                    ],
                  );
                }));
          }
        }));
  }
}
