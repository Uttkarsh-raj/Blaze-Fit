import 'package:blaze_fit/infra/health_repo.dart';

class HomeController {
  final repository = HealthRepository();
  Future<void> getData() async {
    // repository.getSleepData();
    repository.getWeekActivityData();
    // final health = HealthFactory();

    // var types = [
    //   HealthDataType.STEPS,
    //   HealthDataType.BLOOD_GLUCOSE,
    //   HealthDataType.SLEEP_ASLEEP,
    // ];

    // // requesting access to the data types before reading them
    // bool requested = await health.requestAuthorization(types);

    // var now = DateTime.now();

    // // fetch health data from the last 24 hours
    // List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
    //     now.subtract(Duration(days: 1)), now, types);

    // // request permissions to write steps and blood glucose
    // types = [
    //   HealthDataType.STEPS,
    //   HealthDataType.BLOOD_GLUCOSE,
    //   HealthDataType.SLEEP_ASLEEP,
    // ];
    // var permissions = [
    //   HealthDataAccess.READ_WRITE,
    //   HealthDataAccess.READ_WRITE,
    //   HealthDataAccess.READ_WRITE
    // ];
    // await health.requestAuthorization(types, permissions: permissions);

    // // write steps and blood glucose
    // bool success =
    //     await health.writeHealthData(10, HealthDataType.STEPS, now, now);
    // success = await health.writeHealthData(
    //     3.1, HealthDataType.BLOOD_GLUCOSE, now, now);
    // // success = await health.writeHealthData(
    // //     3.1, HealthDataType.BLOOD_GLUCOSE, now, now);
    // success = await health.writeHealthData(
    //     200, HealthDataType.SLEEP_ASLEEP, now, now);

    // // get the number of steps for today
    // var midnight = DateTime(now.year, now.month, now.day);
    // int? steps = await health.getTotalStepsInInterval(midnight, now);
    // print('.........$steps...............');
    // print('.........${HealthDataType.SLEEP_ASLEEP}...............');
  }
}
