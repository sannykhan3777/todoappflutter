import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddNewScreenController extends GetxController {
  RxBool switchbtn = RxBool(false);
  RxBool lowColor = RxBool(false);
  RxBool mediumColor = RxBool(false);
  RxBool highColor = RxBool(false);

  RxBool onWorkClick  =RxBool(false);
  RxBool onHomeClick  =RxBool(false);
  RxBool onSchoolClick  =RxBool(false);

  bool pinned = true;
  bool snap = false;
  bool floating = false;

  TextEditingController tasknameController = TextEditingController();
  TextEditingController taskdescriptionController = TextEditingController();
  RxString date = RxString("Not Set");
  RxString time = RxString("Not Set");
  RxInt togglebtn = RxInt(0);
  RxString priority = RxString("");
  RxString category = RxString("");



}