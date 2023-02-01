// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatroom/common/features/auth/controller/auth_controller.dart';
import 'package:chatroom/common/features/chat/widgets/bottom_chat_field.dart';
import 'package:chatroom/common/widgets/common_widgets.dart';
import 'package:chatroom/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import 'package:chatroom/utilis/theme.dart';

import '../../../../widgets/widgets.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat-screen';
  final String name;
  final String uid;
  final String photoUrl;
  const ChatScreen({
    Key? key,
    required this.name,
    required this.uid,
    required this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: CustomIconButton(
            icon: CupertinoIcons.back,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: _AppBarTitle(
          name: name,
          photoUrl: photoUrl,
          uid: uid,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: IconBorder(
                icon: Ionicons.videocam,
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.phone_solid,
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Expanded(
            child: ChatList(),
          ),
          const BottomChatField(),
        ],
      ),
    );
  }
}

class _AppBarTitle extends ConsumerWidget {
  final String name;
  final String photoUrl;
  final String uid;
  const _AppBarTitle({
    Key? key,
    required this.name,
    required this.photoUrl,
    required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Avatar.small(
          photoUrl: photoUrl,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    snapshot.data!.isOnline ? 'online' : 'offline',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textFaded,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        height: 70,
        color: Theme.of(context).cardColor,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(
                  splashColor: Theme.of(context).primaryColor,
                  onTap: () {},
                  child: const Icon(
                    Ionicons.camera_sharp,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Type something...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 24.0,
                bottom: 4.0,
                top: 4.0,
              ),
              child: GlowingActionButton(
                size: 46,
                color: AppColors.accent,
                icon: Ionicons.send,
                onPressed: () {
                  print('TODO: send a message');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
