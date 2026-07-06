import 'package:flutter/material.dart';
import '../models/person.dart';

Color getBloodColor(BloodType type) => switch (type){
  BloodType.aPositive =>Colors.blue,
  BloodType.aNegative => Colors.red,
  BloodType.bPositive => Colors.purple,
  BloodType.bNegative => Colors.orange,
  BloodType.oPositive => Colors.green,
  BloodType.oNegative => Colors.yellow,
  BloodType.abPositive => Colors.cyan,
  BloodType.abNegative => Colors.white,
};