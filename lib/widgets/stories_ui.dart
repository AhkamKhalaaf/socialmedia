import 'package:flutter/material.dart';
import '../models/story_model.dart';
import '../models/user_model.dart';
import '../widgets/story_item.dart';

class StoryUi extends StatelessWidget {
  const StoryUi({Key? key, required this.stories, required this.currentUser})
      : super(key: key);
  final List<Story> stories;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stories.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return StoryItem(
                  isAddStory: true, user: currentUser, story: stories[0]);
            }
            return StoryItem(
                isAddStory: false,
                user: currentUser,
                story: stories[index - 1]);
          }),
    );
  }
}
