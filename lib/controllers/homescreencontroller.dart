import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todoappflutter/database/database_helper.dart';
import 'package:todoappflutter/models/task_model.dart';

class HomeScreenController extends GetxController {
  RxInt selectedIndex = RxInt(0);
  var greyColor = Colors.grey;
  RxBool colorGrey0 = RxBool(false);
  RxBool colorGrey1 = RxBool(true);
  RxBool colorGrey2 = RxBool(true);
  RxBool colorGrey3 = RxBool(true);
  void onItemTapped(int index) {
    print(index);
    selectedIndex.value = index;
  }

  RxList<Task> taskList =  RxList([]);
  getData() async
  {
    taskList(await DatabaseHelper.instance.retrieveAllDb());
  }
}
