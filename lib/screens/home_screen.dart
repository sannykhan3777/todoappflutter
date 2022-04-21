import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoappflutter/controllers/homescreencontroller.dart';
import 'package:todoappflutter/screens/addnew_screen.dart';
import 'package:todoappflutter/screens/home1_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List<Widget> _widgetOptions = <Widget>[
    HomeScreen1(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: noti',
      style: optionStyle,
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF7F7F7),
        // appBar: AppBar(
        //   title: Text("Home Screen"),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddNewScreen());
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // body: Obx(()=> _widgetOptions.elementAt(homeScreenController.selectedIndex.value)),
        // bottomNavigationBar: BottomAppBar(
        //   color: Colors.green,
        //   shape: CircularNotchedRectangle(),
        // ),
        body: SafeArea(
          bottom: false,
          child: Obx(
            () => _widgetOptions
                .elementAt(homeScreenController.selectedIndex.value),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomAppBar(
              color: Colors.white,
              notchMargin: 5.0,
              shape: CircularNotchedRectangle(),
              elevation: 30.0,
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                        icon:homeScreenController.colorGrey0.value ?  Icon(Icons.home , size: 30.0,) : Icon(Icons.house , size: 30.0,),
                        color: homeScreenController.colorGrey0.value
                            ? Colors.grey
                            : Colors.lime,
                        onPressed: () {
                          homeScreenController.selectedIndex.value = 0;
                          homeScreenController.colorGrey0.value = false;
                          homeScreenController.colorGrey1.value = true;
                          homeScreenController.colorGrey2.value = true;
                          homeScreenController.colorGrey3.value = true;
                        }),
                    IconButton(
                        icon: homeScreenController.colorGrey1.value ? Icon(Icons.notifications , size: 30.0,) : Icon(Icons.notifications_active_rounded, size: 30.0,),
                        color: homeScreenController.colorGrey1.value
                            ? Colors.grey
                            : Colors.lime,
                        onPressed: () {
                          homeScreenController.selectedIndex.value = 1;
                          homeScreenController.colorGrey0.value = true;
                          homeScreenController.colorGrey1.value = false;
                          homeScreenController.colorGrey2.value = true;
                          homeScreenController.colorGrey3.value = true;
                        }),
                    SizedBox(
                      width: 30.0,
                    ),
                    IconButton(
                        icon: homeScreenController.colorGrey2.value ? Icon(Icons.date_range_rounded , size: 30.0,) : Icon(Icons.calendar_today, size: 30.0,),
                        color: homeScreenController.colorGrey2.value
                            ? Colors.grey
                            : Colors.lime,
                        onPressed: () {
                          homeScreenController.selectedIndex.value = 2;
                          homeScreenController.colorGrey0.value = true;
                          homeScreenController.colorGrey1.value = true;
                          homeScreenController.colorGrey2.value = false;
                          homeScreenController.colorGrey3.value = true;
                        }),
                    IconButton(
                        icon: homeScreenController.colorGrey3.value ? Icon(Icons.account_circle_rounded , size: 30.0,) : Icon(Icons.person , size: 30.0,),
                        color: homeScreenController.colorGrey3.value
                            ? Colors.grey
                            : Colors.lime,
                        onPressed: () {
                          homeScreenController.selectedIndex.value = 3;
                          homeScreenController.colorGrey0.value = true;
                          homeScreenController.colorGrey1.value = true;
                          homeScreenController.colorGrey2.value = true;
                          homeScreenController.colorGrey3.value = false;
                        })
                  ])),
        ));
  }
}
