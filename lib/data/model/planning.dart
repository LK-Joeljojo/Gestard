import 'package:gestard/core/enums.dart';
import 'package:gestard/data/model/planning_day.dart';
import 'package:gestard/domain/entity/planning_day_entity.dart';
import 'package:gestard/domain/entity/planning_entity.dart';
import 'package:isar/isar.dart';
part 'planning.g.dart';

@collection
class Planning {
  Id id = Isar.autoIncrement;

  late int userId;
  late DateTime weekStart;

  @enumerated
  PlanningStatus status = PlanningStatus.draft;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  final days = IsarLinks<PlanningDay>();
}

Future<PlanningEntity> toEntity(Planning model) async {
  await model.days.load();
  return PlanningEntity(
    id: model.id,
    userId: model.userId,
    weekStart: model.weekStart,
    status: model.status,
    days: model.days.map((e) {
      return PlanningDayEntity(
        id: e.id,
        isWorkingDay: e.isWorkingDay,
        startTime: e.startTime,
        endTime: e.endTime,
        date: e.date,
      );
    }).toList(),
  );
}
