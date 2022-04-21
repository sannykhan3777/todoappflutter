import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoappflutter/constants/color_constants.dart';
import 'package:todoappflutter/controllers/addnewscreencontroller.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:todoappflutter/database/database_helper.dart';
import 'package:todoappflutter/models/task_model.dart';
import 'package:todoappflutter/screens/home_screen.dart';

class AddNewScreen extends StatelessWidget {
  AddNewScreen({Key? key}) : super(key: key);
  AddNewScreenController addNewScreenController =
      Get.put(AddNewScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: greyWhite,
      // appBar: AppBar(
      //   foregroundColor: Colors.black,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_rounded),
      //     iconSize: 40.0,
      //     onPressed: (){
      //       Get.back();
      //     },
      //   ),
      //   backgroundColor: Colors.white,
      //   title: Text("Add New"),
      // ),
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.west_rounded),
                      iconSize: 45.0,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert_rounded),
                      iconSize: 45.0,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Create new task",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 32.0,
                      color: Colors.grey.shade800),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3.0, horizontal: 25.0),
                  child: Column(
                    children: [
                      TaskField(
                        text: "Add Task",
                        controller: addNewScreenController.tasknameController,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TaskField(
                        text: "Task Description",
                        controller: addNewScreenController.taskdescriptionController,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          DatePicker.showPicker(
                            context,
                            showTitleActions: true,
                            // minTime: DateTime(2018, 3, 5),
                            // maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                            //
                            // },
                            onConfirm: (date) {
                              var now = date;
                              var formatter = DateFormat.yMMMEd();
                              // addNewScreenController.time.value = DateFormat('kk:mm:a').format(now);
                              String formattedDate = formatter.format(now);
                              addNewScreenController.date.value = formattedDate;

                              print(
                                  'confirm ${addNewScreenController.date.value}');
                            },
                            // currentTime: DateTime.now(), locale: LocaleType.en
                          );
                        },
                        child: IconwithDateTime(
                          icon: Icons.date_range_rounded,
                          text: "${addNewScreenController.date.value}",
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          DatePicker.showTime12hPicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 210.0,
                              ),
                              showTitleActions: true, onConfirm: (time) {
                            print('confirm $time');
                            addNewScreenController.time.value =
                                DateFormat('hh:mm a').format(time);
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                        },
                        child: IconwithDateTime(
                          icon: Icons.notifications_on_outlined,
                          text: "${addNewScreenController.time.value}",
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Transform.scale(
                              scale: 1.2,
                              child: Switch(
                                value: addNewScreenController.switchbtn.value,
                                onChanged: (value) {
                                  addNewScreenController.switchbtn.value = value;
                                  if (addNewScreenController.switchbtn.value ==
                                      true) {
                                    addNewScreenController.togglebtn.value = 1;
                                  } else {
                                    addNewScreenController.togglebtn.value = 0;
                                  }
                                  print(addNewScreenController.switchbtn.value);
                                  print(addNewScreenController.togglebtn.value);
                                },
                                activeColor: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 35.0,
                            ),
                            Text(
                              "Remind me",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Priority",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 20.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                addNewScreenController.lowColor.value = true;
                                addNewScreenController.mediumColor.value = false;
                                addNewScreenController.highColor.value = false;
                                addNewScreenController.priority.value = "Low";
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: addNewScreenController.lowColor.value
                                      ? Colors.greenAccent
                                      : Colors.white,
                                  border: Border.all(
                                    color: addNewScreenController.lowColor.value
                                        ? Colors.transparent
                                        : Colors.greenAccent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Text(
                                  "Low",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18.0,
                                      color: addNewScreenController.lowColor.value
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                addNewScreenController.lowColor.value = false;
                                addNewScreenController.mediumColor.value = true;
                                addNewScreenController.highColor.value = false;
                                addNewScreenController.priority.value = "Medium";
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: addNewScreenController.mediumColor.value
                                      ? Colors.orangeAccent
                                      : Colors.white,
                                  border: Border.all(
                                    color:
                                        addNewScreenController.mediumColor.value
                                            ? Colors.transparent
                                            : Colors.orangeAccent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Text(
                                  "Medium",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18.0,
                                      color:
                                          addNewScreenController.mediumColor.value
                                              ? Colors.white
                                              : Colors.black),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                addNewScreenController.lowColor.value = false;
                                addNewScreenController.mediumColor.value = false;
                                addNewScreenController.highColor.value = true;
                                addNewScreenController.priority.value = "High";
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: addNewScreenController.highColor.value
                                      ? Colors.purpleAccent
                                      : Colors.white,
                                  border: Border.all(
                                    color: addNewScreenController.highColor.value
                                        ? Colors.transparent
                                        : Colors.purpleAccent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Text(
                                  "High",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18.0,
                                      color:
                                          addNewScreenController.highColor.value
                                              ? Colors.white
                                              : Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 20.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                addNewScreenController.onWorkClick.value = true;
                                addNewScreenController.onHomeClick.value = false;
                                addNewScreenController.onSchoolClick.value =
                                    false;
                                addNewScreenController.category.value = "Work";
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: addNewScreenController.onWorkClick.value
                                      ? Colors.greenAccent.withOpacity(0.2)
                                      : Colors.greenAccent,
                                  // border: Border.all(
                                  //   color: Colors.greenAccent,
                                  //   width: 2,
                                  // ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: addNewScreenController.onWorkClick.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Work",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18.0,
                                              color: Colors.green.shade800
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.check_circle_rounded,
                                          )
                                        ],
                                      )
                                    : Text(
                                        "Work",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18.0,
                                            color: Colors.green.shade800),
                                      ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                addNewScreenController.onWorkClick.value = false;
                                addNewScreenController.onHomeClick.value = true;
                                addNewScreenController.onSchoolClick.value =
                                    false;
                                addNewScreenController.category.value = "Home";
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: addNewScreenController.onHomeClick.value
                                      ? Colors.lightBlueAccent.withOpacity(0.2)
                                      : Colors.lightBlueAccent,
                                  // border: Border.all(
                                  //   color: Colors.greenAccent,
                                  //   width: 2,
                                  // ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: addNewScreenController.onHomeClick.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Home",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18.0,
                                              color: Colors.blue.shade800
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.check_circle_rounded,
                                          )
                                        ],
                                      )
                                    : Text(
                                        "Home",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18.0,
                                            color: Colors.blue.shade800),
                                      ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                addNewScreenController.onWorkClick.value = false;
                                addNewScreenController.onHomeClick.value = false;
                                addNewScreenController.onSchoolClick.value = true;
                                addNewScreenController.category.value = "School";
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color:
                                      addNewScreenController.onSchoolClick.value
                                          ? Colors.purpleAccent.withOpacity(0.2)
                                          : Colors.purpleAccent,
                                  // border: Border.all(
                                  //   color: Colors.greenAccent,
                                  //   width: 2,
                                  // ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: addNewScreenController.onSchoolClick.value
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "School",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18.0,
                                              color: Colors.purple.shade800
                                                  .withOpacity(0.6),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.check_circle_rounded,
                                          )
                                        ],
                                      )
                                    : Text(
                                        "School",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18.0,
                                            color: Colors.purple.shade800),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 38.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await DatabaseHelper.instance.insertDb(Task(
                              name: addNewScreenController.tasknameController.text,
                              description: addNewScreenController
                                  .taskdescriptionController.text,
                              date: addNewScreenController.date.value,
                              time: addNewScreenController.time.value,
                              togglebtn: addNewScreenController.togglebtn.value,
                              priority: addNewScreenController.priority.value,
                              category: addNewScreenController.category.value,
                            ));
                            print("Data saved Successfully");
                            Get.offAll(()=> HomeScreen());
                          } catch(e) {
                            print(e.toString());
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                          primary: Colors.black54,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconwithDateTime extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconwithDateTime({
    required this.text,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 45.0,
        ),
        SizedBox(
          width: 50.0,
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
        ),
      ],
    );
  }
}

class TaskField extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const TaskField({
    required this.text,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: black,
      style: TextStyle(fontSize: 18.0),
      decoration: new InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: black, width: 3.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: grey400, width: 3.0),
        ),
        hintText: text,
        hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
