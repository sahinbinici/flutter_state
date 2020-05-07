import 'dart:async';

import 'package:state/block/sayac/SayacEvent.dart';

class SayacBlock{
  int _sayac=0;
  //State için Streamcontroller
  final _sayacStateStreamController=StreamController<int>();
  Stream<int> get sayac=>_sayacStateStreamController.stream;
  StreamSink<int> get _sayacStateSink =>_sayacStateStreamController.sink;


  //Event için StreamController
    final _sayacEventStreamController=StreamController<SayacEvent>();
    Stream<SayacEvent> get _sayacEventStream=>_sayacEventStreamController.stream;
    StreamSink<SayacEvent> get sayacEventSink =>_sayacEventStreamController.sink;


    SayacBlock(){
      _sayacEventStream.listen(_mapEventToState);
    }

  void _mapEventToState(SayacEvent event) {
      if(event is SayacArttirEvent){
        _sayac++;

      }else if(event is SayacAzaltEvent){
        _sayac--;

      }
      _sayacStateSink.add(_sayac);
  }
}