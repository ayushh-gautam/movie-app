import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:movie_app/controller/popular_movie_controller.dart';
import 'package:movie_app/controller/trending_movie_controller.dart';
import 'package:movie_app/presentation/widgets/customText.dart';

class ForyouSlider extends StatelessWidget {
  final TrendingMovieController controller = Get.put(TrendingMovieController());
  ForyouSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500.h,
        child: Obx(() {
          if (controller.trendingMovies.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: controller.trendingMovies.value!.results!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 320,
                    height: 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${controller.trendingMoviedata[index].posterPath!}',
                            height: 390.h,
                            width: 320.w,
                            fit: BoxFit.fill,
                          ),
                        ).marginAll(10),
                        MyText(
                          text: controller.trendingMoviedata[index].title!,
                          fontSize: 18,
                        ).marginOnly(left: 14)
                      ],
                    ),
                  );
                });
          }
        }));
  }
}
