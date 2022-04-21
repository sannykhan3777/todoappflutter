import 'dart:convert';

import 'package:todoappflutter/database/database_helper.dart';

List<Task> personFromJson(String str) =>
    List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String personToJson(List<Task> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  final int? id;
  final String name;
  final String? description;
  final String date;
  final String time;
  final int? togglebtn;
  final String? priority;
  final String ?category;




  Task({
    this.id,
    required this.name,
    this.description,
    required this.date,
    required this.time,
    this.togglebtn,
    this.priority,
    this.category,

  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"] ,
    name: json["name"] ,
    description: json["description"] ,
    date: json["date"] ,
    time: json["time"] ,
    togglebtn: json["togglebtn"] ,
    priority: json["priority"] ,
    category: json["category"] ,
  );



  Map<String, dynamic> toJson() => {
    DatabaseHelper.idColumn: id,
    DatabaseHelper.nameColumn: name,
    DatabaseHelper.descriptionColumn: description,
    DatabaseHelper.dateColumn: date,
    DatabaseHelper.timeColumn: time,
    DatabaseHelper.togglebtnColumn: togglebtn,
    DatabaseHelper.priorityColumn: priority,
    DatabaseHelper.categoryColumn: category,
  };
}
