import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'user_card.dart';
class ContactsList extends StatelessWidget {
  const ContactsList({Key? key, required this.users}) : super(key: key);
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),

      //  constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                  child: Text(
                'Contacts',
                style: TextStyle(color: Colors.grey),
              )),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              SizedBox(
                width: 8.0,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: UserCard(user: users[index]));
                }),
          )
        ],
      ),
    );
  }
}
