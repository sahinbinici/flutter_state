import 'dart:async';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:state/block/bloc_paket/sayi_bloc.dart';
import 'package:state/block/bloc_paket/sayi_event.dart';
import 'package:state/block/bloc_paket/sayi_state.dart';
import 'package:state/block/sayac/SayacEvent.dart';
import 'package:state/block/sayac/sayac_block.dart';
import 'package:state/sayac.dart';

class FlutterBlockPaketKullanimi extends StatefulWidget {
  @override
  _FlutterBlockPaketKullanimiState createState() => _FlutterBlockPaketKullanimiState();
}

class _FlutterBlockPaketKullanimiState extends State<FlutterBlockPaketKullanimi> {
    final sayiBloc=SayiBloc();

  @override
  Widget build(BuildContext context) {

    return BlocProvider<SayiBloc>(
      create: (context)=>sayiBloc,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Block Kullanımı"),
            backgroundColor: Colors.orange,
          ),
          body: myCenterWidget(),
          floatingActionButton: myFloatingActionButtons(),

      ),
    );
  }
}

class myFloatingActionButtons extends StatelessWidget {
  const myFloatingActionButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(onPressed:(){

          BlocProvider.of<SayiBloc>(context).onArttir();
        },
          heroTag: "1",
          child: Icon(Icons.add),
        ),SizedBox(
          height: 5,
        ),
        FloatingActionButton(onPressed:(){

        BlocProvider.of<SayiBloc>(context).onAzalt();
        },
          heroTag: "2",
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}

class myCenterWidget extends StatelessWidget {
  const myCenterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mySayiWidget();
  }
}

class mySayiWidget extends StatelessWidget {
  const mySayiWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _bloc=BlocProvider.of<SayiBloc>(context);
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("",style: Theme.of(context).textTheme.display1),
          BlocBuilder(builder: (context,SayiState sayiState){
            return Text(
              sayiState.sayi.toString(),style: TextStyle(fontSize: 48),
            );
          },
          bloc: _bloc,)
        ],
      ),
    );
  }
}
