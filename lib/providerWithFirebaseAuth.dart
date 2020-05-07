import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:state/login_ekran.dart';
import 'package:state/kullanici_ekran.dart';
import 'package:state/user_repository.dart';

class ProviderWithFirebaseAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // ignore: missing_return
    return Consumer(builder: (context,UserRepository repo,child){
        switch(repo.durum){
          case UserDurumu.idle:
            return SplashEkran();
          case UserDurumu.oturumAciliyor:
          case UserDurumu.oturumAcilmamis:
            return LoginEkran();
          case UserDurumu.oturumAcik:
            return KullaniciEkran();
        }
    });
  }
}

class SplashEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Ekran"),
      ),
      body: Center(
        child: Text("Splash")
      ),
    );
  }
}

