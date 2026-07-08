enum DayPeriod { night, dawn, morning, noon, afternoon, sunset, evening }

class TimeHelper {
  static DayPeriod getPeriodByUserTime() {
    final hour = DateTime.now().hour;
    final minute = DateTime.now().minute;
    final double timeAsDouble = hour + (minute / 60.0);

    if (timeAsDouble >= 0.0 && timeAsDouble < 4.5) {
      return DayPeriod.night;
    } else if (timeAsDouble >= 4.5 && timeAsDouble < 6.5) {
      return DayPeriod.dawn;
    } else if (timeAsDouble >= 6.5 && timeAsDouble < 12.0) {
      return DayPeriod.morning;
    } else if (timeAsDouble >= 12.0 && timeAsDouble < 15.0) {
      return DayPeriod.noon;
    } else if (timeAsDouble >= 15.0 && timeAsDouble < 18.0) {
      return DayPeriod.afternoon;
    } else if (timeAsDouble >= 18.0 && timeAsDouble < 19.5) {
      return DayPeriod.sunset;
    } else {
      return DayPeriod.evening;
    }
  }
}
