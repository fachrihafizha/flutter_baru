import '../models/user_model.dart';
import '../../services/auth_service.dart'; // di login_screen.dart atau register_screen.dart


class AuthService {
  static UserModel? currentUser;

  static Future<bool> login(String username, String password) async {
    if (username == 'admin' && password == 'admin123')
 {
      currentUser = UserModel(username: 'admin', email: 'admin@example.com');
      return true;
    }
    return false;
  }

  static Future<bool> register(String username, String email, String password) async {
    currentUser = UserModel(username: username, email: email, password: password);
    return true;
  }

  static void logout() {
    currentUser = null;
  }

  static bool isLoggedIn() {
    return currentUser != null;
  }
}
