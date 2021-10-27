import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            user.imageUrl,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          user.name,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
