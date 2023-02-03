// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatroom/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:chatroom/common/features/chat/controller/chat_controller.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/widgets.dart';
import '../../../widgets/loader.dart';

class ChatList extends ConsumerStatefulWidget {
  final String recieverUserId;
  const ChatList({
    super.key,
    required this.recieverUserId,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends ConsumerState<ChatList> {
  final ScrollController _messageController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream:
            ref.read(chatControllerProvider).chatStream(widget.recieverUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }

          SchedulerBinding.instance.addPostFrameCallback((_) {
            _messageController
                .jumpTo(_messageController.position.maxScrollExtent);
          });

          return ListView.builder(
            controller: _messageController,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final messageData = snapshot.data![index];
              if (messageData.senderId ==
                  FirebaseAuth.instance.currentUser!.uid) {
                return MyMessageCard(
                  message: messageData.text,
                  date: DateFormat.Hm().format(messageData.timeSent),
                  type: messageData.type,
                );
              }
              return SenderMessageCard(
                message: messageData.text,
                date: DateFormat.Hm().format(messageData.timeSent),
                type: messageData.type,
              );
            },
          );
        });
  }
}
