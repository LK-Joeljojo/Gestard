import 'package:gestard/core/enums.dart';

class AttendanceEntity {
  final int id;
  final int userId;
  final DateTime date;
  final DateTime scheduledTime;
  final DateTime? declaredArrivalTime;
  final DateTime? adminValidatedTime;
  final AttendanceStatus status;
  final int lateMinutes;

  AttendanceEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.scheduledTime,
    this.declaredArrivalTime,
    this.adminValidatedTime,
    required this.status,
    required this.lateMinutes,
  });
}
