class PlanningDayEntity {
  final int id;

  final DateTime startTime;
  final DateTime endTime;
  final DateTime date;
  final bool isWorkingDay;

  PlanningDayEntity({
    required this.id,
    required this.isWorkingDay,
    required this.startTime,
    required this.endTime,
    required this.date,
  });
}
