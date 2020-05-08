class SayiState{
  final int sayi;
  SayiState({this.sayi});
  factory SayiState.initialState(){
    return SayiState(sayi:0);
  }
}