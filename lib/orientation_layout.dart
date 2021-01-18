import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {

  final Widget portrait;
  final Widget landscape;

  OrientationLayout({Key key, this.portrait, this.landscape}): super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if(orientation == Orientation.landscape) {
      return landscape ?? portrait;
    }
    return portrait;
  }
}
