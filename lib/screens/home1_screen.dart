import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todoappflutter/controllers/homescreencontroller.dart';
import 'package:todoappflutter/database/database_helper.dart';

class HomeScreen1 extends StatelessWidget {
  HomeScreen1({Key? key}) : super(key: key);

  HomeScreenController homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    var height = Get.height;
    homeScreenController.getData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 25.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search_rounded,
                          size: 50.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Hello John!",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "Let's be Productive today",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Obx(
          () => Container(
            child: Flexible(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: homeScreenController.taskList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // print(homeScreenController.taskList[index].id);
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: const BehindMotion(),
                        children: [
                          SlidableWidget(height: height, width: width , icon: Icons.cancel, boxColor: Colors.grey.shade400.withOpacity(0.5), text: "Cancel" , textColor: Colors.white,),
                          SizedBox(width: 20.0,),
                          // SlidableWidget(height: height, width: width , icon: Icons.edit, boxColor: Colors.grey.shade400.withOpacity(0.5), text: "Edit" , textColor: Colors.white,),

                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: const BehindMotion(),
                        children: [
                          // SlidableWidget(height: height, width: width , icon: Icons.delete, boxColor: Colors.redAccent.shade400.withOpacity(0.5), text: "Delete" , textColor: Colors.white,),


                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
                        child: Container(
                          height: height * 0.12,
                          width: double.infinity,
                          child: Stack(children: [
                            Positioned(
                              top: 12.0,
                              left: 10.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: Colors.lime,
                                ),
                                height: height * 0.10,
                                width: width * 0.75,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(13.0),
                                    onTap: () {},
                                    onLongPress: () {
                                      print("longpress");
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: width * 0.5,
                                                      child: Text(
                                                        homeScreenController
                                                            .taskList[index].name,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.clip,
                                                        softWrap: false,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontSize: 20.0,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13.0),
                                                    color: Colors.red,
                                                  ),
                                                  height: 30.0,
                                                  width: 65.0,
                                                  child: Center(
                                                    child: Text(
                                                      homeScreenController
                                                          .taskList[index]
                                                          .category
                                                          .toString(),
                                                      style: TextStyle(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  homeScreenController
                                                      .taskList[index].time
                                                      .toString(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // top: -20.0,
                              // left: -20.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13.0),
                                  color: Colors.red,
                                ),
                                height: 30.0,
                                width: 65.0,
                                child: Center(
                                  child: Text(
                                    homeScreenController.taskList[index].priority
                                        .toString(),
                                    style: TextStyle(),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}

class SlidableWidget extends StatelessWidget {
  const SlidableWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.icon,
    required this.text,
    required this.textColor,
    required this.boxColor,
  }) : super(key: key);

  final double height;
  final double width;
  final IconData icon;
  final String text;
  final Color textColor ;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.11,
      width: width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13.0),
        child: SlidableAction(
          onPressed: (context) {},
          backgroundColor: boxColor,
          foregroundColor: textColor,
          icon: icon,
          label: text,
        ),
      ),
    );
  }
}
