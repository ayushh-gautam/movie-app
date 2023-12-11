import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/popular_movie_controller.dart';
import 'package:movie_app/screens/detail/detail_page.dart';
import 'package:movie_app/widgets/customText.dart';

class MyList extends StatelessWidget {
  MyList({super.key});

  PopularMoviesController controller = Get.put(PopularMoviesController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.popularMovieData.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                DetailPage(myData: controller.popularMovieData[index]),
              );
            },
            child: Container(
                // height: 260,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500' +
                            controller.popularMovieData[index].posterPath!,
                        fit: BoxFit.contain,
                        height: 300,
                      ),
                    ),
                    MyText(
                      text: controller.popularMovieData[index].originalTitle
                              ?.split(':')
                              .first ??
                          '',
                      fontSize: 17.h,
                    )..marginOnly(top: 6, left: 9, right: 8),
                    Row(
                      children: [
                        MyText(
                                fontSize: 16.h,
                                text: controller
                                    .popularMovieData[index].releaseDate!
                                    .toString()
                                    .split('-')
                                    .first)
                            .marginOnly(left: 2),
                        Spacer(),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        MyText(
                            text: controller.popularMovieData[index].voteAverage
                                .toString()
                                .split('.')
                                .first),
                      ],
                    ).marginOnly(right: 12),
                  ],
                )).marginAll(10),
          );
        }),
      ),
    );
  }
}
