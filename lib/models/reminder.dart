import 'package:flutter/material.dart';

class Reminder {
  final String message;
  final TimeOfDay time;  // TimeOfDay artık tanımlanmış olacak
  bool isActive;

  Reminder({
    required this.message,
    required this.time,
    this.isActive = true,
  });
}
