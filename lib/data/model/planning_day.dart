import 'package:gestard/domain/entity/planning_day_entity.dart';
import 'package:isar/isar.dart';

part 'planning_day.g.dart';

@collection
class PlanningDay {
  Id id = Isar.autoIncrement;

  late DateTime date;
  late DateTime startTime;
  late DateTime endTime;

  bool isWorkingDay = true;
}

PlanningDayEntity toEntity(PlanningDay model) {
  return PlanningDayEntity(
    id: model.id,
    isWorkingDay: model.isWorkingDay,
    startTime: model.startTime,
    endTime: model.endTime,
    date: model.date,
  );
}
