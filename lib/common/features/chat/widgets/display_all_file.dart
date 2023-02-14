// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatroom/common/features/chat/widgets/video_player.dart';
import 'package:flutter/material.dart';

import 'package:chatroom/common/enums/messages_enum.dart';

class DisplayAllFile extends StatelessWidget {
  final String message;
  final MessageEnum type;
  const DisplayAllFile({
    Key? key,
    required this.message,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == MessageEnum.text
        ? Text(
            message,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        : type == MessageEnum.video
            ? CustomVideoPlayer(
                videoUrl: message,
              )
            : type == MessageEnum.gif
                ? CachedNetworkImage(imageUrl: message)
                : CachedNetworkImage(imageUrl: message);
  }
}
