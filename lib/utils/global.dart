import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Global {
  static XFile? pic;

  static int? a;
  static ImagePicker picker = ImagePicker();
  static TextEditingController namecontroller = TextEditingController();
  static TextEditingController lastnamecontroller = TextEditingController();
  static TextEditingController mobilenumbercontroller = TextEditingController();
  static TextEditingController emailcontroller = TextEditingController();
  static String? lastname;
  static String? mobilenumber;
  static String? name;
  static String? email;
}
