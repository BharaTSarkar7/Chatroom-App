import 'package:chatroom/info.dart';
import 'package:chatroom/common/features/chat/screen/chats_screen.dart';
import 'package:chatroom/utilis/theme.dart';
import 'package:chatroom/widgets/avatar.dart';
import 'package:flutter/material.dart';

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
                      builder: (context) => const ChatScreen(
                        name: 'bhart',
                        uid: '12345',
                        photoUrl:
                            'https://firebasestorage.googleapis.com/v0/b/chatroom-cec10.appspot.com/o/profilePic%2FUJ68JIYUMtcwJqR4lkgOwBlSoay2?alt=media&token=5115116e-0231-402a-a50a-6468348c47ec',
                      ),
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
