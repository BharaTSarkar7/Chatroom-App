import 'package:chatroom/common/features/chat/controller/chat_controller.dart';

import 'package:chatroom/common/features/chat/screen/chats_screen.dart';
import 'package:chatroom/common/widgets/common_widgets.dart';
import 'package:chatroom/model/chat_contact.dart';
import 'package:chatroom/utilis/theme.dart';
import 'package:chatroom/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ContactList extends ConsumerWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: StreamBuilder<List<ChatContact>>(
          stream: ref.watch(chatControllerProvider).chatContacts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var chatContactData = snapshot.data![index];
                return Column(
                  children: [
                    InkWell(
                      splashColor: Theme.of(context).primaryColor,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ChatScreen.routeName,
                          arguments: {
                            'name': chatContactData.name,
                            'uid': chatContactData.contactId,
                            'photoUrl': chatContactData.profilePic,
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(
                            chatContactData.name,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              chatContactData.lastMessage,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: AppColors.textFaded,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          leading: Avatar.medium(
                            photoUrl: chatContactData.profilePic,
                          ),
                          trailing: Text(
                            DateFormat.Hm().format(chatContactData.timeSent),
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
            );
          }),
    );
  }
}
