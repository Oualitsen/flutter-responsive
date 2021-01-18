import 'package:flutter/material.dart';
import 'package:responsive/device_screen_type.dart';
import 'package:responsive/sizing_info.dart';
import 'package:flutter/foundation.dart';

DeviceScreenType getDeviceScreenType(MediaQueryData data) {
  var width = data.size.shortestSide;
  if (kIsWeb) {
    width = data.size.width;
  }
  if (width > 950) {
    return DeviceScreenType.Desktop;
  }
  if (width > 600) {
    return DeviceScreenType.Tablet;
  }
  return DeviceScreenType.Mobile;
}

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInfo info) builder;

  ResponsiveBuilder(this.builder);

  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);

    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        SizingInfo info = SizingInfo(
            type: getDeviceScreenType(query),
            screenSize: query.size,
            widgetSize: Size(constraints.maxWidth, constraints.maxHeight));

        return builder(context, info);
      },
    );
  }
}
