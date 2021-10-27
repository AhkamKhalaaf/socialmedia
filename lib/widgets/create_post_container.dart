import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/user_model.dart';
import 'responsive.dart';

class CreatePostContainer extends StatelessWidget {
  const CreatePostContainer({Key? key, required this.currentUser})
      : super(key: key);
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    final bool isDeskTop = Responsive.isDesktop(context);
    return Padding(
      padding: const EdgeInsets.all(8.0)
      //,elevation:isDeskTop?1.0:0.0 ,
      //  shape: isDeskTop ?RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)):null,
      ,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  currentUser.imageUrl,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Expanded(
                  child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: 'what is in your mind ? '),
              ))
            ],
          ),
          const Divider(
            thickness: 0.5,
            height: 10.0,
          ),
          SizedBox(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(
                    onPressed: () => print('live'),
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.red,
                    ),
                    label: const Text(
                      'live',
                      style: TextStyle(color: Colors.black),
                    )),
                FlatButton.icon(
                    onPressed: () => print('photo'),
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: const Text(
                      'Photo',
                      style: TextStyle(color: Colors.black),
                    )),
                FlatButton.icon(
                    onPressed: () => print('room'),
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: const Text(
                      'room',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
