import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/palette_config.dart';
import '../models/user_model.dart';
import 'circle_button.dart';
import 'custom_bar.dart';
import 'user_card.dart';

class CustomApBar extends StatelessWidget {
  const CustomApBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.onTaped,
      required this.currentUser})
      : super(key: key);
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTaped;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Facebook',
              style: TextStyle(
                letterSpacing: -1.2,
                fontSize: 32,
                color: Palette.facebookBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 600.0,
            child: CustomTabBar(
              selectedIndex: selectedIndex,
              icons: icons,
              onTaped: onTaped,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              UserCard(
                user: currentUser,
              ),
              const SizedBox(
                width: 5.0,
              ),
              CircleButton(
                iconSize: 30.0,
                iconData: MdiIcons.facebookMessenger,
                onPressed: () {
                  print('facebookMessenger');
                },
              ),
              CircleButton(
                iconSize: 30.0,
                iconData: Icons.search,
                onPressed: () {
                  print('search');
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
