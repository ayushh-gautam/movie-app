// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class Shimmerr extends StatelessWidget {
  double? height;
  double? width;
  Shimmerr({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Center(
              child: Shimmer.fromColors(
                period: const Duration(seconds: 2),
                baseColor: Colors.grey.withOpacity(0.2),
                highlightColor: Colors.black.withOpacity(0.1),
                child: Container(
                  height: height ?? 400,
                  width: width ?? 310,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(16)),
                ).marginAll(10),
              ),
            );
          })),
    );
  }
}
