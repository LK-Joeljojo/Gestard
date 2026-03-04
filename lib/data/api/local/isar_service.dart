import 'package:gestard/data/model/attendance.dart';
import 'package:gestard/data/model/planning.dart';
import 'package:gestard/data/model/planning_day.dart';
import 'package:gestard/data/model/sync_action.dart';
import 'package:gestard/data/model/user.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static late final Isar isar;
  static Future<void> setup() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
       [
        AttendanceSchema,
        UserSchema,
        PlanningDaySchema,
        PlanningSchema,
        SyncActionSchema,
      ],
      directory: dir.path,
    );
  }
}
