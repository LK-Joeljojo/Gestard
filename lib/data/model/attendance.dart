import 'package:gestard/core/enums.dart';
import 'package:gestard/domain/entity/attendance_entity.dart';
import 'package:isar/isar.dart';
part 'attendance.g.dart';

@collection
class Attendance {
  Id id = Isar.autoIncrement;
  late int userId;
  late DateTime date;
  late DateTime scheduledTime;

  DateTime? declaredArrivalTime;
  DateTime? adminValidatedTime;
  @enumerated
  AttendanceStatus status = AttendanceStatus.waitingValidation;

  int lateMinutes = 0;
  DateTime createdAt = DateTime.now();
}

AttendanceEntity toEntity(Attendance model) {
  return AttendanceEntity(
    id: model.id,
    userId: model.userId,
    date: model.date,
    scheduledTime: model.scheduledTime,
    status: model.status,
    lateMinutes: model.lateMinutes,
  );
}
