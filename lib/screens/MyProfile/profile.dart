import 'package:blaze_fit/api/auth/firebase_auth.dart';
import 'package:blaze_fit/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/glassmorphidm.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: size.height,
                width: size.width,
                child: AppColors.background),
            GlassContainer(
              colors: AppColors.gradientBack,
              blur: 65,
              height: size.height,
              width: size.width,
              border: 0,
              borderRadius: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0)
                      .copyWith(top: 10, right: 15, left: 15),
                  child: Center(
                    child: Column(
                      children: [
                        GlassContainer(
                          colors: AppColors.gradient,
                          blur: 65,
                          height: size.height * 0.37,
                          width: size.width * 0.87,
                          border: 1,
                          borderRadius: 25,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0)
                                .copyWith(left: 15, right: 15),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage('${user?.photoURL}'),
                                  radius: size.width * 0.15,
                                ),
                                const SizedBox(height: 25),
                                Row(
                                  children: [
                                    Text(
                                      'Name :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '${user?.displayName}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      'Email :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '${user?.email}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      'Gender :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Male',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      'Age :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '22',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GlassContainer(
                              height: size.height * 0.16,
                              width: size.width * 0.43,
                              borderRadius: 20,
                              border: 0,
                              blur: 20,
                              colors: [
                                Color.fromARGB(255, 231, 231, 231)
                                    .withOpacity(0.08),
                                Color(0xFFFFFFFF).withOpacity(0.08),
                              ],
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Height :',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: const [
                                        Text(
                                          '170',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          ' cm',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GlassContainer(
                              height: size.height * 0.16,
                              width: size.width * 0.43,
                              borderRadius: 20,
                              border: 0,
                              blur: 20,
                              colors: [
                                Color.fromARGB(255, 231, 231, 231)
                                    .withOpacity(0.08),
                                Color(0xFFFFFFFF).withOpacity(0.08),
                              ],
                              child: Padding(
                                padding: const EdgeInsets.all(12.0)
                                    .copyWith(bottom: 11, top: 11),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Weight :',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: const [
                                        Text(
                                          '68',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          ' Kgs',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.16),
                        GestureDetector(
                          onTap: () {
                            AuthServices().logOut();
                          },
                          child: Container(
                            width: size.width * 0.8,
                            height: size.height * 0.072,
                            decoration: BoxDecoration(
                              color: AppColors.lime,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Center(
                                  child: Text(
                                    ' Log Out ',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: AppColors.darkGreen,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.logout,
                                  color: AppColors.darkGreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
