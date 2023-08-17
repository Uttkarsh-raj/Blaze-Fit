import 'package:blaze_fit/constants/constants.dart';
import 'package:blaze_fit/screens/HomeScreen/home_controller.dart';
import 'package:blaze_fit/utils/glassmorphidm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:lottie/lottie.dart';

import '../../infra/health_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();
  User? user = FirebaseAuth.instance.currentUser;
  final repository = HealthRepository();
  List<HealthDataPoint> steps = [];
  List<HealthDataPoint> heartBeat = [];
  String heartRate = '';
  int sleep = 0;
  int stepCount = 0;
  String caloriesBurned = '';

  getSteps() async {
    steps = await repository.getStepData();
    setState(() {
      stepCount = int.parse((steps[0].value).toString().split('.')[0]);
    });
    print(stepCount);
  }

  getHeartRate() async {
    heartBeat = await repository.getHeartRateData();
    setState(() {
      heartRate = heartBeat[0].value.toString();
    });
    print(heartRate);
  }

  getAll() async {
    heartBeat = await repository.getAll();
    setState(() {
      stepCount = int.parse((heartBeat[2].value).toString().split('.')[0]);
      heartRate = heartBeat[1].value.toString();
      caloriesBurned = heartBeat[3].value.toString().split('.')[0];
      sleep = int.parse(heartBeat[0].value.toString().split('.')[0]);
    });
    print(heartRate);
    print(stepCount);
    print(caloriesBurned);
    print(sleep);
  }

  @override
  void initState() {
    // controller.getData();//TODO: Call the required functions in the init state
    getAll();
    // getHeartRate();
    super.initState();
  }

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
                  child: (user != null)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hello, ${user?.displayName}! 👋',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage('${user?.photoURL}'),
                                  radius: size.width * 0.06,
                                )
                              ],
                            ),
                            const SizedBox(height: 2),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'This is your progress.',
                                // textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GlassContainer(
                                  height: size.height * 0.26,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sleep :',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        // const SizedBox(height: 5),
                                        Center(
                                          child: Lottie.asset(
                                            'assets/animations/sleep.json',
                                            height: size.height * 0.14,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${sleep / 60}',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Text(
                                              ' hrs',
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
                                  height: size.height * 0.26,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Heart Rate :',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Center(
                                          child: Lottie.asset(
                                            'assets/animations/heart_beat.json',
                                            height: size.height * 0.16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              heartRate,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const Text(
                                              ' bpm',
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
                            const SizedBox(height: 20),
                            GlassContainer(
                              height: size.height * 0.26,
                              width: size.width * 0.9,
                              borderRadius: 20,
                              border: 0,
                              blur: 20,
                              colors: [
                                Color.fromARGB(255, 231, 231, 231)
                                    .withOpacity(0.08),
                                Color(0xFFFFFFFF).withOpacity(0.08),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GlassContainer(
                                  height: size.height * 0.26,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Step Count :',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        // const SizedBox(height: 5),
                                        Center(
                                          child: Lottie.asset(
                                            'assets/animations/steps.json',
                                            height: size.height * 0.14,
                                          ),
                                        ),
                                        Text(
                                          '${stepCount / 0.5}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Text(
                                          ' steps',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GlassContainer(
                                  height: size.height * 0.26,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Step Count :',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        // const SizedBox(height: 5),
                                        Center(
                                          child: Lottie.asset(
                                            'assets/animations/fire.json',
                                            height: size.height * 0.14,
                                          ),
                                        ),
                                        Text(
                                          caloriesBurned,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Text(
                                          ' Kcal',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
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
