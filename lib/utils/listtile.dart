import 'package:blaze_fit/utils/glassmorphidm.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../api/assessment/assessment.dart';
import '../constants/constants.dart';

class AnalysisTile extends StatefulWidget {
  const AnalysisTile({
    super.key,
    required this.trueAt,
    required this.falseAt,
  });
  final String trueAt;
  final String falseAt;

  @override
  State<AnalysisTile> createState() => _AnalysisTileState();
}

class _AnalysisTileState extends State<AnalysisTile> {
  bool kidney = false;
  bool sleep = false;
  bool heart = false;
  String kdisorder = '';
  bool kloading = false;
  String hdisorder = '';
  bool hloading = false;
  String sdisorder = '';
  bool sloading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          sleep = !sleep;
        });
      },
      child: GlassContainer(
        colors: [
          AppColors.lime.withOpacity(0.1),
          AppColors.lime.withOpacity(0.1),
        ],
        blur: 65,
        height: (!sleep) ? size.height * 0.08 : size.height * 0.2,
        width: size.width,
        border: 0,
        borderRadius: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(
            right: 15,
            left: 15,
            top: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Analyse Sleep Risk',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  (sleep)
                      ? Column(
                          children: const [
                            Icon(
                              Icons.arrow_drop_up_outlined,
                              size: 25,
                            ),
                          ],
                        )
                      : const Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 25,
                        ),
                ],
              ),
              const SizedBox(height: 10),
              if (sleep)
                Column(
                  children: [
                    if (sdisorder == '${widget.trueAt}')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: const Text(
                              'You are all good !!',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Lottie.asset('assets/animations/fit.json',
                              height: 80, width: 80)
                        ],
                      ),
                    if (sdisorder == widget.falseAt)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: const Text(
                              'You might have a risk of sleep disorder',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Lottie.asset('assets/animations/alert.json',
                              height: 80, width: 80)
                        ],
                      ),
                    if (sdisorder != widget.trueAt &&
                        sdisorder != widget.falseAt)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnalyseSLeep extends StatefulWidget {
  const AnalyseSLeep({super.key, required this.trueAt, required this.falseAt});
  final String trueAt;
  final String falseAt;

  @override
  State<AnalyseSLeep> createState() => _AnalyseSLeepState();
}

class _AnalyseSLeepState extends State<AnalyseSLeep> {
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
      sdisorder = 'SleepApnea';
      kloading = false;
    });
    print('disorder: $sdisorder');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          sleep = !sleep;
        });
        getSleep(21, 9, 'Male', 5);
      },
      child: GlassContainer(
        colors: [
          AppColors.lime.withOpacity(0.1),
          AppColors.lime.withOpacity(0.1),
        ],
        blur: 65,
        height: (!sleep) ? size.height * 0.08 : size.height * 0.2,
        width: size.width,
        border: 0,
        borderRadius: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(
            right: 15,
            left: 15,
            top: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Analyse Sleep Risk',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  (sleep)
                      ? Column(
                          children: const [
                            Icon(
                              Icons.arrow_drop_up_outlined,
                              size: 25,
                            ),
                          ],
                        )
                      : const Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 25,
                        ),
                ],
              ),
              const SizedBox(height: 10),
              if (sleep)
                Column(
                  children: [
                    if (sdisorder == '${widget.trueAt}')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: const Text(
                              'You are all good !!',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Lottie.asset('assets/animations/fit.json',
                              height: 80, width: 80)
                        ],
                      ),
                    if (sdisorder == widget.falseAt)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: const Text(
                              'You might have a risk of sleep disorder',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Lottie.asset('assets/animations/alert.json',
                              height: 80, width: 80)
                        ],
                      ),
                    if (sdisorder != widget.trueAt &&
                        sdisorder != widget.falseAt)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnalyseKidney extends StatefulWidget {
  const AnalyseKidney({super.key, required this.trueAt, required this.falseAt});
  final String trueAt;
  final String falseAt;
  @override
  State<AnalyseKidney> createState() => _AnalyseKidneyState();
}

class _AnalyseKidneyState extends State<AnalyseKidney> {
  bool kidney = false;
  bool sleep = false;
  bool heart = false;
  String kdisorder = '';
  bool kloading = false;
  String hdisorder = '';
  bool hloading = false;
  String sdisorder = '';
  bool sloading = false;
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
    return GestureDetector(
      onTap: () {
        setState(() {
          sleep = !sleep;
        });
        getKidney(21, 'Yes', 'Male', 'Yes', 'Yes', 5);
      },
      child: GlassContainer(
        colors: [
          AppColors.lime.withOpacity(0.1),
          AppColors.lime.withOpacity(0.1),
        ],
        blur: 65,
        height: (!sleep) ? size.height * 0.08 : size.height * 0.2,
        width: size.width,
        border: 0,
        borderRadius: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(
            right: 15,
            left: 15,
            top: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Analyse Kidney Risk',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  (sleep)
                      ? Column(
                          children: const [
                            Icon(
                              Icons.arrow_drop_up_outlined,
                              size: 25,
                            ),
                          ],
                        )
                      : const Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 25,
                        ),
                ],
              ),
              const SizedBox(height: 10),
              if (sleep)
                Column(
                  children: [
                    if (kdisorder == '${widget.trueAt}')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: const Text(
                              'You are all good !!',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Lottie.asset('assets/animations/fit.json',
                              height: 80, width: 80)
                        ],
                      ),
                    if (kdisorder == widget.falseAt)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: const Text(
                              'You might have a risk of sleep disorder',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Lottie.asset('assets/animations/alert.json',
                              height: 80, width: 80)
                        ],
                      ),
                    if (kdisorder != widget.trueAt &&
                        kdisorder != widget.falseAt)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Analyseheart extends StatefulWidget {
  const Analyseheart({super.key, required this.trueAt, required this.falseAt});
  final String trueAt;
  final String falseAt;
  @override
  State<Analyseheart> createState() => _AnalyseheartState();
}

class _AnalyseheartState extends State<Analyseheart> {
  bool kidney = false;
  bool sleep = false;
  bool heart = false;
  String kdisorder = '';
  bool kloading = false;
  String hdisorder = '';
  bool hloading = false;
  String sdisorder = '';
  bool sloading = false;

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          sleep = !sleep;
        });
        getHeart(21, 'Yes', 'Male', 'Yes', 'Yes', 5);
      },
      child: GlassContainer(
        colors: [
          AppColors.lime.withOpacity(0.1),
          AppColors.lime.withOpacity(0.1),
        ],
        blur: 65,
        height: (!sleep) ? size.height * 0.08 : size.height * 0.2,
        width: size.width,
        border: 0,
        borderRadius: 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0).copyWith(
            right: 15,
            left: 15,
            top: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Analyse Heart Risk',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  (sleep)
                      ? Column(
                          children: const [
                            Icon(
                              Icons.arrow_drop_up_outlined,
                              size: 25,
                            ),
                          ],
                        )
                      : const Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 25,
                        ),
                ],
              ),
              const SizedBox(height: 10),
              if (sleep)
                Column(
                  children: [
                    if (hdisorder == 'Yes')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: const Text(
                              'You are all good !!',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Lottie.asset('assets/animations/fit.json',
                              height: 80, width: 80)
                        ],
                      ),
                    if (hdisorder == 'No')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: const Text(
                              'You might have a risk of sleep disorder',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Lottie.asset('assets/animations/alert.json',
                              height: 80, width: 80)
                        ],
                      ),
                    if (hdisorder != 'Yes' && hdisorder != 'No')
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
