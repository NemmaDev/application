import 'package:application/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<userModel> auth(userModel userModel) async {
    UserCredential userCredential;
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
    } catch (e) {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: userModel.email, password: userModel.password);
    }
    if (userCredential.user != null) {
    userModel.setUid = userCredential.user?.uid;
    return userModel; // Retourne le userModel si tout s'est bien déroulé
  } else {
    throw Exception("L'utilisateur n'a pas pu être authentifié."); // Lance une exception si l'utilisateur est null
  }
  }
}
