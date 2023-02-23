import 'package:flutter/material.dart';

class DeviceSize extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget website;

  const DeviceSize({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.website,
  }) : super(key: key);

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 550;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 550 &&
        MediaQuery.of(context).size.width <= 900;
  }

  static bool isWebsite(BuildContext context) {
    return MediaQuery.of(context).size.width > 900;
  }

  @override
  Widget build(BuildContext context) {
    return
        // website;
        isMobile(context)
            ? mobile
            : isTablet(context)
                ? tablet
                : website;
  }
}
