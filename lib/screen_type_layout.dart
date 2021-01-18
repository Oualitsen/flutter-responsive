import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive/device_screen_type.dart';
import 'package:responsive/responsive_builder.dart';
import 'package:responsive/sizing_info.dart';

const double WIDTH_DESKTOP = 800;
const double WIDTH_TABLET = 600;

class ScreenTypeLayout extends StatelessWidget {
  final Widget Function() mobile;
  final Widget Function() tablet;
  final Widget Function() desktop;

  ScreenTypeLayout({Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder((BuildContext context, SizingInfo info) {
      switch (info.type) {
        case DeviceScreenType.Desktop:
          return (desktop ?? tablet ?? mobile)();
        case DeviceScreenType.Tablet:
          return (tablet ?? mobile)();
        default:
          return mobile();
      }
    });
  }
}

class DeviceTypeLayout extends StatelessWidget {
  final Widget Function() mobile;
  final Widget Function() web;

  const DeviceTypeLayout({
    Key key,
    @required this.mobile,
    @required this.web,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? web() : mobile();
  }
}

class AutoScreenTypeLayout extends StatelessWidget {
  final Widget child;
  final bool useCenter;
  final double tabletWidth;
  final double desktopWidth;
  AutoScreenTypeLayout({@required this.child, this.useCenter = true, this.tabletWidth, this.desktopWidth});

  @override
  Widget build(BuildContext context) => ScreenTypeLayout(
        mobile: () => child,
        tablet: () {
          return useCenter
              ? Center(
                  child: Container(
                    width: tabletWidth ?? WIDTH_TABLET,
                    child: child,
                  ),
                )
              : Container(
                  width: tabletWidth ?? WIDTH_TABLET,
                  child: child,
                );
        },
        desktop: () {
          return useCenter
              ? Center(
                  child: Container(
                    width: desktopWidth ?? WIDTH_DESKTOP,
                    child: child,
                  ),
                )
              : Container(
                  width: desktopWidth ?? WIDTH_DESKTOP,
                  child: child,
                );
        },
      );
}
