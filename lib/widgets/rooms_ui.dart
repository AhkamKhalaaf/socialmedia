import 'package:flutter/material.dart';
import '../config/palette_config.dart';
import '../models/user_model.dart';
import 'profile_avatar.dart';

class RoomUi extends StatelessWidget {
  const RoomUi({Key? key, required this.users}) : super(key: key);
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
          itemCount: 1 + users.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _createRoom();
            }
            return Container(
              margin: const EdgeInsets.all(1.0),
              color: Colors.white,
              child: ProfileAvatar(
                imagePath: users[index - 1].imageUrl,
              ),
            );
          }),
    );
  }
}

Widget _createRoom() {
  return MaterialButton(
    onPressed: () {},
    color: Colors.white,
    child: Row(
      children: [
        ShaderMask(
          shaderCallback: (rect) => Palette.storyGradient.createShader(rect),
          child: const Icon(
            Icons.video_call_outlined,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        const Text(
          'Create\nRoom',
          style: TextStyle(color: Palette.facebookBlue),
        )
      ],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
      side: const BorderSide(width: 2.0, color: Palette.facebookBlue),
    ),
  );
}
