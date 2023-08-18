import 'package:blaze_fit/api/assessment/assessment.dart';
import 'package:blaze_fit/utils/listtile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/constants.dart';
import '../../utils/glassmorphidm.dart';

class AssessPage extends StatefulWidget {
  const AssessPage({super.key});

  @override
  State<AssessPage> createState() => _AssessPageState();
}

class _AssessPageState extends State<AssessPage> {
  bool kidney = false;
  bool sleep = false;
  bool heart = false;
  String kdisorder = '';
  bool kloading = false;
  String hdisorder = '';
  bool hloading = false;
  String sdisorder = '';
  bool sloading = false;

  void getSleep(int age, int sleepQuality, String gender, int duration) async {
    setState(() {
      kloading = true;
    });
    String response = await Assessmenthandler.getResponse(
        age, sleepQuality, gender, duration);

    setState(() {
      sdisorder = response;
      kloading = false;
    });
    print('disorder: $sdisorder');
  }

  void getHeart(
    int age,
    String smoke,
    String gender,
    String alcohol,
    String diabetic,
    int sleepTime,
  ) async {
    setState(() {
      hloading = true;
    });
    String response = await Assessmenthandler.getHeartResponse(
      age,
      smoke,
      gender,
      alcohol,
      diabetic,
      sleepTime,
    );

    setState(() {
      hdisorder = response;
      hloading = false;
    });
    print('disorder: $hdisorder');
  }

  void getKidney(
    int age,
    String smoke,
    String gender,
    String alcohol,
    String diabetic,
    int sleepTime,
  ) async {
    setState(() {
      hloading = true;
    });
    String response = await Assessmenthandler.getKidneyResponse(
      age,
      smoke,
      gender,
      alcohol,
      diabetic,
      sleepTime,
    );

    setState(() {
      kdisorder = response;
      sloading = false;
    });
    print('disorder: $kdisorder');
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
              child: Padding(
                padding: const EdgeInsets.all(8.0)
                    .copyWith(top: 15, right: 10, left: 10),
                child: Column(
                  children: const [
                    Text(
                      'Assess Me',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 15),
                    AnalyseSLeep(trueAt: 'None', falseAt: 'SleepApnea'),
                    SizedBox(height: 15),
                    AnalyseKidney(trueAt: 'Yes', falseAt: 'No'),
                    SizedBox(height: 15),
                    Analyseheart(trueAt: 'Yes', falseAt: 'No'),
                    SizedBox(height: 15),
                    Text(
                      '*The data is completely dependent on pretrained models. Please consult a doctor as per your requierments.*',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
