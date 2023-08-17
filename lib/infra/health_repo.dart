import 'package:health/health.dart';

class HealthRepository {
  final health = HealthFactory();
  var now = DateTime.now();
  Future<bool> getWeekSleepData() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.SLEEP_ASLEEP,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 7)), now, [
        HealthDataType.SLEEP_ASLEEP,
      ]);
      return healthData.isNotEmpty;
    } else {
      return false;
    }
  }

  Future<bool> getSleepData() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.SLEEP_ASLEEP,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 1)), now, [
        HealthDataType.SLEEP_ASLEEP,
      ]);
      print('${healthData}');
      return healthData.isNotEmpty;
    } else {
      return false;
    }
  }

  Future<bool> getWeekActivityData() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 7)), now, [
        HealthDataType.ACTIVE_ENERGY_BURNED,
      ]);
      print('${healthData}');
      return healthData.isNotEmpty;
    } else {
      return false;
    }
  }

  Future<bool> getActivityData() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 1)), now, [
        HealthDataType.ACTIVE_ENERGY_BURNED,
      ]);
      print('${healthData}');
      return healthData.isNotEmpty;
    } else {
      return false;
    }
  }
}
