import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/palette_config.dart';
import '../models/post_model.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerTop(post: post),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              post.caption,
              style: TextStyle(color: Colors.grey),
            ),
            post.imageUrl != null
                ? const SizedBox(
                    height: 6.0,
                  )
                : const SizedBox.shrink(),
            post.imageUrl != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.network(
                      post.imageUrl!,
                      fit: BoxFit.contain,
                    ))
                : const SizedBox.shrink(),
            post.imageUrl != null
                ? const SizedBox(
                    height: 6.0,
                  )
                : const SizedBox.shrink(),
            _postState(post: post)
          ],
        ),
      ),
    );
  }

  Widget _headerTop({required Post post}) {
    return Row(
      children: [
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Text(
                    post.timeAgo.toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  const Icon(
                    Icons.public,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () => print('gfd'),
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.grey,
            ))
      ],
    );
  }

  Widget _postState({required Post post}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Palette.facebookBlue),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              '${post.likes}',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              width: 4.0,
            ),
            Expanded(
                child: Text(
              '${post.comments} comments',
              style: const TextStyle(color: Colors.grey),
            )),
            const SizedBox(
              width: 4.0,
            ),
            Text(
              '${post.shares} shares',
              style: const TextStyle(color: Colors.grey),
            ),
            const Divider(),
          ],
        ),
        Row(
          children: [
            _postButton(
                icon: Icon(
                  MdiIcons.thumbUpOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: 'like',
                onTaped: () {}),
            _postButton(
                icon: Icon(
                  MdiIcons.commentOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: 'comment',
                onTaped: () {}),
            _postButton(
                icon: Icon(
                  MdiIcons.shareOutline,
                  color: Colors.grey[600],
                  size: 20.0,
                ),
                label: 'share',
                onTaped: () {})
          ],
        )
      ],
    );
  }
}

Widget _postButton(
    {required Icon icon, required String label, required Function onTaped}) {
  return Expanded(
    child: Material(
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 4.0,
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    ),
  );
}
