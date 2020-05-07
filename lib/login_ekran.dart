import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/user_repository.dart';

class LoginEkran extends StatefulWidget {
  @override
  _LoginEkranState createState() => _LoginEkranState();
}

class _LoginEkranState extends State<LoginEkran> {
  final _formKey=GlobalKey<FormState>();
  final _scaffoldKey=GlobalKey<ScaffoldState>();
  TextEditingController _email;
  TextEditingController _sifre;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email=TextEditingController(text: "");
    _sifre=TextEditingController(text: "");
  }
  @override
  Widget build(BuildContext context) {
    final userRepo=Provider.of<UserRepository>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login Ekranı"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              userRepo.durum==UserDurumu.oturumAciliyor ? Center(child: CircularProgressIndicator(),) :
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _email,
                  validator: (deger){
                    if(deger.length<=0){
                      return "Email boş geçilmez";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _sifre,
                  validator: (deger){
                    if(deger.length<=0){
                      return "Şifre boş geçilmez";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Şifre",
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(onPressed: ()async{
                  if(_formKey.currentState.validate()){
                    if(!await userRepo.signIn(_email.text, _sifre.text)){
                      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Email / Şifre hatalı")));
                    }
                  }
                },
                  child: Text("Giriş Yap"),color: Colors.blue,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(onPressed: ()async{
                    userRepo.signInWithGoogle();
                },
                  child: Text("Gmail Giriş Yap"),color: Colors.blue,),
              )
            ],
          ),
        ),
      )
    );
  }
}
