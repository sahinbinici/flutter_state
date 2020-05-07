import 'dart:async';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/sayac.dart';

class StreamKullanimi extends StatefulWidget {
  @override
  _StreamKullanimiState createState() => _StreamKullanimiState();
}

class _StreamKullanimiState extends State<StreamKullanimi> {
  int _counter=0;

  final StreamController<int> _streamController=StreamController<int>();

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Kullanımı"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("",style: Theme.of(context).textTheme.display1),
            StreamBuilder<int>(
                initialData: 0,
                stream: _streamController.stream,
                builder: (context,AsyncSnapshot snapshot){
              return Text(snapshot.data.toString(),style: TextStyle(fontSize: 28),);
            }),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(onPressed:(){
            _streamController.sink.add(++_counter);

          },
            heroTag: "1",
            child: Icon(Icons.add),
          ),SizedBox(
            height: 5,
          ),
          FloatingActionButton(onPressed:(){
            _streamController.sink.add(--_counter);

          },
            heroTag: "2",
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
