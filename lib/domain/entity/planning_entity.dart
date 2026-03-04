import 'package:gestard/core/enums.dart';

import 'planning_day_entity.dart';

class PlanningEntity {
  final int id;

  final int userId;
  final DateTime weekStart;

  final PlanningStatus status;

  final List<PlanningDayEntity> days;

  PlanningEntity({
    required this.id,
    required this.userId,
    required this.weekStart,
    required this.status,
    required this.days,
  });
}
