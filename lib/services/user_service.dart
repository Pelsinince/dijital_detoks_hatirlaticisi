import '../models/user.dart';

class UserService {
  static final List<User> _users = [];

  // Kullanıcı kayıt işlemi
  static void signUp(String email, String password) {
    _users.add(User(email, password));
  }

  // Kullanıcı giriş kontrolü
  static bool signIn(String email, String password) {
    for (var user in _users) {
      if (user.email == email && user.password == password) {
        return true; // Giriş başarılı
      }
    }
    return false; // Giriş başarısız
  }
}
