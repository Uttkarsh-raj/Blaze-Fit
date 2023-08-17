import 'package:health/health.dart';

class HealthRepository {
  final health = HealthFactory();
  var now = DateTime.now();

  Future<List<HealthDataPoint>> getAll() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.HEART_RATE,
      HealthDataType.DISTANCE_DELTA,
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 1)), now, [
        HealthDataType.SLEEP_ASLEEP,
        HealthDataType.HEART_RATE,
        HealthDataType.DISTANCE_DELTA,
        HealthDataType.ACTIVE_ENERGY_BURNED,
      ]);
      print(".................$healthData...............");
      return healthData;
    } else {
      return [];
    }
  }

  Future<List<HealthDataPoint>> getWeekSleepData() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.SLEEP_ASLEEP,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 7)), now, [
        HealthDataType.SLEEP_ASLEEP,
      ]);
      return healthData;
    } else {
      return [];
    }
  }

  Future<List<HealthDataPoint>> getSleepData() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.SLEEP_ASLEEP,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 1)), now, [
        HealthDataType.SLEEP_ASLEEP,
      ]);
      print('${healthData}');
      return healthData;
    } else {
      return [];
    }
  }

  Future<List<HealthDataPoint>> getWeekActivityData() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 7)), now, [
        HealthDataType.ACTIVE_ENERGY_BURNED,
      ]);
      print('${healthData}');
      return healthData;
    } else {
      return [];
    }
  }

  Future<List<HealthDataPoint>> getActivityData() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 1)), now, [
        HealthDataType.ACTIVE_ENERGY_BURNED,
      ]);
      print('${healthData}');
      return healthData;
    } else {
      return [];
    }
  }

  Future<List<HealthDataPoint>> getStepData() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.DISTANCE_DELTA,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 1)), now, [
        HealthDataType.DISTANCE_DELTA,
      ]);
      print('............${healthData}...............');
      return healthData;
    } else {
      return [];
    }
  }

  Future<List<HealthDataPoint>> getHeartRateData() async {
    bool requested = await health.requestAuthorization([
      HealthDataType.HEART_RATE,
    ]);
    if (requested) {
      List<HealthDataPoint> healthData = await health
          .getHealthDataFromTypes(now.subtract(const Duration(days: 7)), now, [
        HealthDataType.HEART_RATE,
      ]);
      print('............${healthData}...............');
      return healthData;
    } else {
      return [];
    }
  }
}
