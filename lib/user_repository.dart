import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

enum UserDurumu{
  idle,
  oturumAcilmamis,
  oturumAciliyor,
  oturumAcik,

}

class UserRepository with ChangeNotifier{
  FirebaseAuth _auth;
  FirebaseUser _user;
  UserDurumu _durum=UserDurumu.idle;
  GoogleSignIn _googleSignIn;

  UserRepository(){
    _auth=FirebaseAuth.instance;
    _auth.onAuthStateChanged.listen(_onAuthStateChange);
    _googleSignIn=GoogleSignIn();
  }

  FirebaseUser get user => _user;

  set user(FirebaseUser value) {
    _user = value;
  }

  UserDurumu get durum => _durum;

  set durum(UserDurumu value) {
    _durum = value;
  }

  Future<bool> signInWithGoogle()async{
    try{
      _durum=UserDurumu.oturumAciliyor;
      notifyListeners();
      final GoogleSignInAccount googleUser=await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth=await googleUser.authentication;
      final AuthCredential credential=GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await _auth.signInWithCredential(credential);
      return true;
    }catch(e){
      _durum=UserDurumu.oturumAcilmamis;
      return false;
    }
  }

  Future<bool> signIn(String email,String sifre)async{
    try{
    _durum=UserDurumu.oturumAciliyor;
    notifyListeners();
    await _auth.signInWithEmailAndPassword(email: email, password: sifre);
    return true;
    }catch(e){
    _durum=UserDurumu.oturumAcilmamis;
    notifyListeners();
    return false;
    }
  }

    Future signOut()async{
      _auth.signOut();
      _googleSignIn.signOut();
      _durum=UserDurumu.oturumAcilmamis;
      notifyListeners();
      return Future.delayed(Duration.zero);
    }

  Future<void> _onAuthStateChange(FirebaseUser user) async{
    if(user == null){
        _durum=UserDurumu.oturumAcilmamis;
    }else{
      _user=user;
      _durum=UserDurumu.oturumAcik;
    }
    notifyListeners();
  }


}