import 'package:blaze_fit/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/glassmorphidm.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                height: size.height,
                width: size.width,
                child: AppColors.background),
            GlassContainer(
              colors: [
                Color.fromARGB(255, 231, 231, 231).withOpacity(0.02),
                Color(0xFFFFFFFF).withOpacity(0.02),
              ],
              blur: 65,
              height: size.height,
              width: size.width,
              border: 0,
              borderRadius: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0)
                      .copyWith(top: 10, right: 15, left: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
