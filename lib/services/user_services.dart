import 'package:fire_youtube/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  // créer un istance de firebase
  static final _auth = FirebaseAuth.instance;

  // enregistrement de l'utilisateur
  static Future<bool> register(UserModel user) async {
    var credentials = await _auth.createUserWithEmailAndPassword(
        email: user.Email, password: user.Password);
    if (credentials.user != null) {
      credentials.user!.updateDisplayName(user.name);
      return true;
    }
    
    return false;
  }

  // Connexion de l'user
  static Future<UserModel?> login(String email, String password) async {
    var credentials = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (credentials.user == null) {
      return null;
    }
    return UserModel(
      name: credentials.user!.displayName!,
      Email: credentials.user!.email!,
      Password: "",
    );
  }

  // la deconnexion
  static void logOut() async {
    await _auth.signOut();
  }
}
