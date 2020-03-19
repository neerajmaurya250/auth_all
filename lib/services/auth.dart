import 'package:authall/models/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
//user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user){
    return user!= null? User(uid: user.uid):null;
  }

//auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future registerWithEmailAndPassword(String email,String password) async {

    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      //Create new document for the user with the uid
//      await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }

  }



}