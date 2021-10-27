import 'package:flutter/material.dart';
import '../config/palette_config.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.onTaped})
      : super(key: key);
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTaped;

  @override
  Widget build(BuildContext context) {
    return TabBar(physics: const NeverScrollableScrollPhysics(),onTap: onTaped,indicatorPadding: EdgeInsets.zero,
        indicator:
             const BoxDecoration(border: Border(top: BorderSide(width: 3.0,
            color: Palette.facebookBlue))),
        tabs: icons.asMap()
            .map((i,e) => MapEntry(i,Tab(
          icon: Icon(e,color: i==selectedIndex?Palette.facebookBlue:Colors.grey,),
        )))
            .values.toList());
  }
}
