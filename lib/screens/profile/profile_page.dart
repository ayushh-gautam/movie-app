// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  String? myImage;

  ProfilePage({
    Key? key,
    required this.myImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(myImage!)),
                    borderRadius: BorderRadius.circular(300),
                    color: Colors.green),
              ),
            )
          ],
        ),
      ),
    );
  }
}
