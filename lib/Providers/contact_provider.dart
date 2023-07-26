import 'package:coantact_diary/Model/contact_model.dart';
import 'package:flutter/material.dart';

class Contactprovider extends ChangeNotifier {
  static List<Contact> allcontact = [];
  List <Contact> get contact => [];
  static List<Contact> hiddencontact = [];

  void add_contact(Contact add){
    allcontact.add(add);
    notifyListeners();
   }
  void removeContact(Contact v1){
    allcontact.remove(v1);
    notifyListeners();
  }
  void addhiddencontact(Contact add) {
    hiddencontact.add(add);
    notifyListeners();
  }
}