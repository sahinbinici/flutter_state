
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state/block/bloc_paket/sayi_event.dart';
import 'package:state/block/bloc_paket/sayi_state.dart';

class SayiBloc extends Bloc<SayiEvent,SayiState>{

  @override
  // TODO: implement initialState
  SayiState get initialState => SayiState.initialState();

  @override
  Stream<SayiState> mapEventToState(SayiEvent event) async*{
     final _currentState=state;
    // TODO: implement mapEventToState
    if(event is SayiArttirEvent){
        yield SayiState(sayi: _currentState.sayi+1);
    }else if(event is SayiAzaltEvent){
      yield SayiState(sayi: _currentState.sayi-1);
    }
  }
  void onArttir() {
    add(SayiArttirEvent());
  }

  void onAzalt() {
    add(SayiAzaltEvent());
  }

}