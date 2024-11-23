import 'package:bloc_pattern_demo/data/services/api_services.dart';

import '../models/user_model.dart';


class UserRepository {
  final ApiService _apiService;

  UserRepository() : _apiService = ApiService();

  // Fetch users from the API and map to a list of User objects
  Future<List<User>> fetchUsers() async {
    final data = await _apiService.getUsers();
    return data.map<User>((json) => User.fromJson(json)).toList();
  }
}
