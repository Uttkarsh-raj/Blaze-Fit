import 'package:blaze_fit/api/auth/firebase_auth.dart';
import 'package:blaze_fit/constants/constants.dart';
import 'package:blaze_fit/screens/AuthPage/main_auth.dart';
import 'package:blaze_fit/screens/FormPage/form_page.dart';
import 'package:blaze_fit/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  getPermissions() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();
  }

  @override
  void initState() {
    getPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset(
              'assets/images/sign_up2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.65),
                  const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.1),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.06,
            child: Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Center(
                child: Container(
                  width: size.width * 0.93,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        // 'Unleash Your Potential with Blaze Fit: Where AI Meets Your Fitness Journey!',
                        'Blaze Fit: Unleash Your Potential with Fitness AI!',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'With this app you will improve and track your health and lifestyle',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          showCustomAlertDialog(context);
                          UserCredential userCredential =
                              await AuthServices().signInWithGoogle();
                          User user = userCredential.user!;
                          print(user);
                          if (userCredential.additionalUserInfo!.isNewUser) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const FormPage(),
                              ),
                            );
                          }
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MainAuthPage(),
                            ),
                          );
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
                            children: [
                              Image.asset(
                                'assets/icons/google.png',
                                scale: 14,
                              ),
                              const SizedBox(width: 10),
                              const Center(
                                child: Text(
                                  ' Let\'s Get Started',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.darkGreen,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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
          )
        ],
      ),
    );
  }
}
