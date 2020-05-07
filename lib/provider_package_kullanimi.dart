import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/sayac.dart';

class PackageProviderKullanimi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mySayac=Provider.of<Sayac>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Package Kullanımı"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${mySayac.sayac}",style: Theme.of(context).textTheme.display1),

          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(onPressed:(){
            mySayac.arttir();

          },
            heroTag: "1",
            child: Icon(Icons.add),
          ),SizedBox(
            height: 5,
          ),
          FloatingActionButton(onPressed:(){
            mySayac.azalt();

          },
            heroTag: "2",
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
