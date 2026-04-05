import 'package:gestard/data/api/local/isar_service.dart';
import 'package:gestard/data/model/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Provider de userlocalDataSource
final userLocalDataSourceProvider = Provider<UserLocalDataSource>
((ref)=> UserLocalDataSource());


class UserLocalDataSource {

  final isar = IsarService.isar;

  Future<void> createUser(User user)async {
    await isar.writeTxn(() async{
      await isar.users.put(user);
    });
  }
}