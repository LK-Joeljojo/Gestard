import 'package:gestard/core/enums.dart';
import 'package:gestard/domain/entity/sync_action_entity.dart';
import 'package:isar/isar.dart';
part 'sync_action.g.dart';

@collection
class SyncAction {
  Id id = Isar.autoIncrement;
  @enumerated
  late SyncActionType type;
  late String payloadJson;

  late final DateTime createdAt;
  late final bool synced;
}

SyncActionEntity toEntity(SyncAction model) {
  return SyncActionEntity(
    id: model.id,
    synced: model.synced,
    payloadJson: model.payloadJson,
    type: model.type,
    createdAt: model.createdAt,
  );
}
