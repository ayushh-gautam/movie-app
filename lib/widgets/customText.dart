// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  String text;

  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  MyText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.archivo(
          color: color ?? Colors.white,
          fontSize: fontSize ?? 18.sp,
          fontWeight: fontWeight),
    );
  }
}
