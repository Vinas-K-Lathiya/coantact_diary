import 'package:coantact_diary/Model/counter.dart';
import 'package:flutter/material.dart';

class Counterprovider extends ChangeNotifier{
  Countermodel count = Countermodel(Count: 0);

   void Increment(){
    count.Count++;
    notifyListeners();
  }
  void decrement(){
    count.Count--;
    notifyListeners();
  }
}