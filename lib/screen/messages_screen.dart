import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/widgets.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Messages",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Avatar(
                  radius: 18,
                  photoUrl:
                      'https://images.unsplash.com/photo-1669616923428-1513f6ebc23b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTF8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
            ),
          ],
          leadingWidth: 54,
          leading: Align(
            alignment: Alignment.centerRight,
            child: CustomIconButton(
              icon: Ionicons.search,
              onTap: () {},
            ),
          ),
        ),
        body: const ContactList(),
      ),
    );
  }
}
