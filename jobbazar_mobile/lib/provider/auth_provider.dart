import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/services/user_service.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false; // Track authentication state
  final UserService _userService = UserService();

  bool get isAuthenticated => _isAuthenticated;

  // Simulate login
  Future<void> login(String username, String password) async {
    // Simulate API call to authenticate the user
    try {
      // Use the instance to call getUserByUsername
      final user = await _userService.getUserByUsername(username: username);

      // Add password verification (if needed)
      if (user.password == password) { // Assuming your User model has a password field
        _isAuthenticated = true;
      } else {
        throw Exception("Invalid credentials");
      }
    } catch (e) {
      throw Exception("Error during login: $e");
    } finally {
      notifyListeners();
    }
  }

  // Logout the user
  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
