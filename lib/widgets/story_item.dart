import 'package:flutter/material.dart';
import '../config/palette_config.dart';
import '../models/story_model.dart';
import '../models/user_model.dart';
import '../widgets/profile_avatar.dart';

class StoryItem extends StatefulWidget {
  StoryItem(
      {Key? key,
      required this.user,
      required this.story,
      this.isAddStory = false})
      : super(key: key);
  final User user;
  final Story story;
  bool isAddStory;

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Stack(
        children: [
          ClipRRect(
            child: Image.network(
              !widget.isAddStory ? widget.story.imageUrl : widget.user.imageUrl,
              width: 110,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          Container(
            width: 110.0,
            height: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: Palette.storyGradient),
          ),
          Positioned(
              bottom: 5.0,
              right: 2.0,
              left: 5.0,
              child: Text(
                widget.story.user.name,
                style: const TextStyle(color: Colors.white),
              )),
          Positioned(
              top: 5.0,
              right: 2.0,
              left: 5.0,
              child: !widget.isAddStory
                  ? ProfileAvatar(imagePath: widget.story.imageUrl)
                  : ProfileAvatar(imagePath: widget.story.imageUrl))
        ],
      ),
    );
  }
}
