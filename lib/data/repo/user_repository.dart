import 'package:bookingapp/data/models/user_model.dart';

abstract class UserRepository {
  Future<int> login({required String username, required String password});
  Future<User> editUser({required int id, required String password});
}
