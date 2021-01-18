import 'package:flutter/material.dart';
import 'package:responsive/device_screen_type.dart';

class SizingInfo {
  final DeviceScreenType type;
  final Size screenSize;
  final Size widgetSize;

  SizingInfo({this.type, this.screenSize, this.widgetSize});

  @override
  String toString() {
    return "type: $type, screenSize = $screenSize, widgetSize = $widgetSize";
  }
}
