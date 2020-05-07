import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/block/sayac/block_kullanimi.dart';
import 'package:state/providerWithFirebaseAuth.dart';
import 'package:state/provider_package_kullanimi.dart';
import 'package:state/sayac.dart';
import 'package:state/stream_kullanimi.dart';
import 'package:state/user_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<Sayac>(
        create: (context)=>Sayac(0),
      ),
      ChangeNotifierProvider<UserRepository>(
        create: (context)=>UserRepository(),
      ),

    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),

            RaisedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PackageProviderKullanimi()));
            },child: Text("PackageProvider",style: TextStyle(color: Colors.white),),color: Colors.blue,),
            RaisedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProviderWithFirebaseAuth()));
            },child: Text("ProviderWithAuth",style: TextStyle(color: Colors.white),),color: Colors.blue,),
            RaisedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StreamKullanimi()));
            },child: Text("Stream Kullanini",style: TextStyle(color: Colors.white),),color: Colors.blue,),
            RaisedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlockKullanimi()));
            },child: Text("Block Kullanimi",style: TextStyle(color: Colors.white),),color: Colors.blue,)
          ],
        ),
      ),
      floatingActionButton:MyButton(_incrementCounter),  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyButton extends StatefulWidget {
  Function incrementCounter;
  MyButton(this.incrementCounter);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}

