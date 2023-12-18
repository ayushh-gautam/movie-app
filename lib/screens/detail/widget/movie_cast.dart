import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/widgets/custom_text.dart';

class MovieCast extends StatelessWidget {
  const MovieCast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(text: 'Cast').marginOnly(bottom: 10),
        SizedBox(
          height: 120,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) => Container(

                    decoration: BoxDecoration(
                      
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(14)),
                    height: 90,
                    width: 100,
                  ).marginSymmetric(horizontal: 10, vertical: 5))),
        )
      ],
    );
  }
}
