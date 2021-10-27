import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/palette_config.dart';

class ProfileAvatar extends StatelessWidget {
  ProfileAvatar({Key? key, required this.imagePath, this.isActive = false})
      : super(key: key);
  late String imagePath;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundImage: CachedNetworkImageProvider(
            imagePath,
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  decoration: BoxDecoration(
                      color: Palette.online,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.0)),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
