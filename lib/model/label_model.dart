import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

var uuid = const Uuid();
final formatter=DateFormat.yMd();

enum ColorLabel{ red,yellow,green}

const modelcolor={
  ColorLabel.red: Colors.red,
  ColorLabel.yellow:Colors.yellow,
  ColorLabel.green:Colors.green
};

class LabelModel{

  LabelModel({
     required this.title,
     required this.description,
     required this.dateTime,
     this.colorLabel=ColorLabel.red,
  }):id=uuid.v4();

  final String id;
  final String title;
  final String description;
  final DateTime dateTime;
  final ColorLabel colorLabel;

  String get formattedDate{
    return formatter.format(dateTime);
  }
}