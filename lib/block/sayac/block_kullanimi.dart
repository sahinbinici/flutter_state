import 'dart:async';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/block/sayac/SayacEvent.dart';
import 'package:state/block/sayac/sayac_block.dart';
import 'package:state/sayac.dart';

class BlockKullanimi extends StatefulWidget {
  @override
  _BlockKullanimiState createState() => _BlockKullanimiState();
}

class _BlockKullanimiState extends State<BlockKullanimi> {
 final _sayacBlock=SayacBlock();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Block Kullanımı"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("",style: Theme.of(context).textTheme.display1),
            StreamBuilder(
                initialData: 0,
                stream: _sayacBlock.sayac,
                builder: (context,snapshot){
                  return Text(snapshot.data.toString(),style: TextStyle(fontSize: 36),);
                })
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(onPressed:(){
            _sayacBlock.sayacEventSink.add(SayacArttirEvent());

          },
            heroTag: "1",
            child: Icon(Icons.add),
          ),SizedBox(
            height: 5,
          ),
          FloatingActionButton(onPressed:(){

            _sayacBlock.sayacEventSink.add(SayacAzaltEvent());
          },
            heroTag: "2",
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
