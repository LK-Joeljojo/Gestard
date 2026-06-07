import 'package:gestard/data/api/local/isar_service.dart';
import 'package:gestard/data/model/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

// Provider de userlocalDataSource
final userLocalDataSourceProvider = Provider<UserLocalDataSource>
((ref)=> UserLocalDataSource());


class UserLocalDataSource {

  final isar = IsarService.isar;
// create user
  Future<void> createUser(User user)async {
    await isar.writeTxn(() async{
      await isar.users.put(user);
      
    });
  }
// get all user
  Future<List<User>> getAllUser() async{
    return await isar.users.where().findAll();
  }
  // //get user by email 
  // Future<User?> getUserByEmail(String email) async {
  //   return await isar.users.filter().emailEqualTo(email).findFirst();
  // }
  // // get user by id
  // Future<User?> getUserById(int id) async {
  //   return await isar.users.get(id);
  // }
  // delete user
  Future<void> deleteUser(int id) async {
    await isar.writeTxn(() async {
      await isar.users.delete(id);
    });
  }
}