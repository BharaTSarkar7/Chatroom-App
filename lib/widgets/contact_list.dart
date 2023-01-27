import 'package:chatroom/info.dart';
import 'package:chatroom/screen/chats_screen.dart';
import 'package:chatroom/utilis/theme.dart';
import 'package:chatroom/widgets/avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      info[index]['name'].toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        info[index]['message'].toString(),
                        style: const TextStyle(
                            fontSize: 15, color: AppColors.textFaded),
                      ),
                    ),
                    leading: Avatar.medium(
                      photoUrl: info[index]['profilePic'].toString(),
                    ),
                    trailing: Text(
                      info[index]['time'].toString(),
                      style: const TextStyle(
                          color: AppColors.textFaded, fontSize: 13),
                    ),
                  ),
                ),
              ),
              const Divider(
                indent: 85,
                color: AppColors.dividerColor,
              )
            ],
          );
        },
      ),
    );
  }
}
