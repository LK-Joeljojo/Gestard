import 'package:gestard/data/api/local/isar_service.dart';
import 'package:gestard/data/model/planning.dart';

class PlannigLocalDatasource {
  final isar = IsarService.isar;

  Future<void> createPlanning(Planning planning) async {
    await isar.writeTxn(() async {
      await isar.plannings.put(planning);
    });
  }
}
