import 'package:gestard/core/enums.dart';

class SyncActionEntity {
  final int id;
  final bool synced;
  final String payloadJson;
  final SyncActionType type;
  final DateTime createdAt;

  SyncActionEntity({
    required this.id,
    required this.synced,
    required this.payloadJson,
    required this.type,
    required this.createdAt,
  });
}
