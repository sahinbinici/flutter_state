import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/user_repository.dart';

class KullaniciEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context,UserRepository repo,child)=>
      Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Ekranı"),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text(repo.user.email),
          RaisedButton(onPressed: (){
            repo.signOut();
          },
          child: Text("Oturumu Kapat"),color: Colors.blue,)
        ],)
      ),
    ));
  }
}
