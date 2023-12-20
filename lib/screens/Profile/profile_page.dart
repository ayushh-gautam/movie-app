// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  String myImage;
  ProfilePage({
    Key? key,
    required this.myImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.green,
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(myImage)),
              borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }
}
