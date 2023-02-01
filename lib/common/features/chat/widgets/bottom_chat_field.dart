import 'package:chatroom/utilis/theme.dart';
import 'package:chatroom/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({super.key});

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  bool isSending = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
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
                        onPressed: () {},
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
                      onPressed: () {},
                      icon: const Icon(
                        Entypo.camera,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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
          child: GlowingActionButton.advance(
              iconSize: 22,
              color: AppColors.accent,
              icon: isSending ? Feather.send : Ionicons.ios_mic,
              size: 40,
              onPressed: () {}),
        )
      ],
    );
  }
}
