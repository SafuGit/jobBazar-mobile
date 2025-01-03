import 'package:flutter/material.dart';
import 'package:jobbazar_mobile/provider/models/user.dart';
import 'package:jobbazar_mobile/provider/services/user_service.dart';
import 'package:jobbazar_mobile/routes.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false; // Track authentication state
  User? _currentUser;
  String _userType = "";
  final UserService _userService = UserService();

  bool get isAuthenticated => _isAuthenticated;
  User? get currentUser => _currentUser;
  String get userType => _userType;

  // Simulate login
  Future<void> login(String username, String password) async {
    // Simulate API call to authenticate the user
    try {
      // Use the instance to call getUserByUsername
      final user = await _userService.getUserByUsername(username: username);
      debugPrint("$user");

      // Add password verification (if needed)
      if (user.password == password) { // Assuming your User model has a password field
        _isAuthenticated = true;
        _currentUser = user;
        _userType = user.role;
        switch (_userType) {
          case "EMPLOYER":
            // const RouteToEmployer();
        }
      } else {
        throw Exception("Invalid credentials");
      }
    } catch (e) {
      throw Exception("Error during login: $e");
    } finally {
      debugPrint("Authenticated: $_isAuthenticated, Role: ${_currentUser?.role}, Type: $_userType");
      notifyListeners();
    }
  }

  Future<void> register(Map<String, dynamic> userData) {
    try {
      final user = _userService.registerUser(userData: userData);
      return user;
    } catch (e) {
      throw Exception("Error during registration: $e");
    }
    finally {
      notifyListeners();
    }
  }

  // Logout the user
  void logout(BuildContext context) {
    _isAuthenticated = false;
    _currentUser = null;
    Navigator.pushReplacementNamed(context, '/login');
    notifyListeners();
  }
}
