import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/popular_movie_controller.dart';

class MyGrid extends StatelessWidget {
  PopularMoviesController controller = Get.put(PopularMoviesController());

  MyGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: controller.popularMovieData.length,
          itemBuilder: (_, index) {
            return Container(
              height: 300,
              width: 50,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500' +
                      controller.popularMovieData[index].posterPath!,
                  fit: BoxFit.cover,
                ),
              ),
            ).marginAll(5);
          }),
    );
  }
}
