import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData iconData;
  final double iconSize;
  final Function? onPressed;

  const CircleButton(
      {Key? key,
      required this.iconData,
      required this.iconSize,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      alignment: Alignment.center,
      child: Center(
        child: IconButton(
            onPressed: onPressed!(),
            icon: Icon(
              iconData,
              color: Colors.black,
              size: iconSize,
            )),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
    );
  }
}
