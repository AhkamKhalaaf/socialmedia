import 'package:flutter/material.dart';

class Responsive extends StatefulWidget {
  const Responsive(
      {Key? key, required this.mobile, required this.desktop, this.tablet})
      : super(key: key);
  final Widget mobile;
  final Widget desktop;
  final Widget? tablet;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.minWidth >= 1200) {
        return widget.desktop;
      } else if (constraints.minWidth >= 800) {
        return widget.tablet ?? widget.mobile;
      } else {
        return widget.mobile;
      }
    });
  }
}
