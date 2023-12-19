import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/trending_movie_controller.dart';
import 'package:movie_app/screens/detail/detail_page.dart';
import 'package:movie_app/widgets/shimmer_effect.dart';
import 'package:movie_app/widgets/title_text.dart';

class TrendingSlider extends StatelessWidget {
  final TrendingMovieController controller = Get.put(TrendingMovieController());
  TrendingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500.h,
        child: Obx(() {
          if (controller.trendingMovies.value == null) {
            return Shimmerr(height: 400, width: 310);
          } else {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.trendingMovies.value!.results!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetailPage(
                          myData: controller.trendingMoviedata[index]));
                    },
                    child: SizedBox(
                      width: 310,
                      height: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${controller.trendingMoviedata[index].posterPath!}',
                              height: 390.h,
                              width: 310.w,
                              fit: BoxFit.fill,
                            ),
                          ).marginAll(10),
                          TitleText(
                            text: controller.trendingMoviedata[index].title!
                                .split(':')
                                .first,
                            fontSize: 18,
                          ).marginOnly(left: 14)
                        ],
                      ),
                    ),
                  );
                });
          }
        }));
  }
}
