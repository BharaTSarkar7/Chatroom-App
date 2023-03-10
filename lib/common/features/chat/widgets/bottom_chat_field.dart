// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:chatroom/common/enums/messages_enum.dart';
import 'package:chatroom/utilis/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:chatroom/common/features/chat/controller/chat_controller.dart';
import 'package:chatroom/utilis/theme.dart';

class BottomChatField extends ConsumerStatefulWidget {
  final String recieverUserId;
  const BottomChatField({
    super.key,
    required this.recieverUserId,
  });

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  bool isSending = false;
  final TextEditingController _messageController = TextEditingController();

  void sendTextMessage() async {
    if (isSending) {
      ref.read(chatControllerProvider).sendTextMessage(
          context, _messageController.text.trim(), widget.recieverUserId);
      setState(() {
        _messageController.text = '';
      });
    }
  }

  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) {
    ref
        .read(chatControllerProvider)
        .sendFileMessage(context, file, widget.recieverUserId, messageEnum);
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);

    if (image != null) {
      sendFileMessage(image, MessageEnum.image);
    }
  }

  void selectVideo() async {
    File? video = await pickVideoFromGallery(context);

    if (video != null) {
      sendFileMessage(video, MessageEnum.video);
    }
  }

  void selectGIF() async {
    final gif = await pickGIF(context);
    if (gif != null) {
      // ignore: use_build_context_synchronously
      ref
          .read(chatControllerProvider)
          .sendGIFMessage(context, gif.url, widget.recieverUserId);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _messageController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  isSending = true;
                });
              } else {
                isSending = false;
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.mobileChatBoxColor,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.emoji_emotions,
                        ),
                      ),
                      IconButton(
                        onPressed: selectGIF,
                        icon: const Icon(
                          MaterialIcons.gif,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Entypo.camera,
                      ),
                    ),
                    IconButton(
                      onPressed: selectVideo,
                      icon: const Icon(
                        Ionicons.ios_attach_outline,
                      ),
                    ),
                  ],
                ),
              ),
              hintText: 'Type a message...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 2,
            right: 2,
            left: 2,
          ),
          child: CircleAvatar(
            backgroundColor: AppColors.accent,
            radius: 25,
            child: GestureDetector(
              onTap: sendTextMessage,
              child: Icon(
                isSending ? Feather.send : Ionicons.ios_mic,
              ),
            ),
          ),
        )
      ],
    );
  }
}
