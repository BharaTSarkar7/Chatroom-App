import 'package:chatroom/common/features/auth/screen/otp_screen.dart';
import 'package:chatroom/common/features/auth/screen/user_info_screen.dart';
import 'package:chatroom/common/features/select_contacts/screens/select_contacts_screen.dart';
import 'package:chatroom/common/widgets/error.dart';
import 'package:chatroom/common/features/auth/screen/login_screen.dart';
import 'package:chatroom/common/features/chat/screen/chats_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OTPScreen(
                verificationId: verificationId,
              ));
    case UserInfoScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const SelectContactScreen());
    case SelectContactScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const SelectContactScreen());
    case ChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];
      final photoUrl = arguments['photoUrl'];
      return MaterialPageRoute(
          builder: (context) => ChatScreen(
                name: name,
                uid: uid,
                photoUrl: photoUrl,
              ));
    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(error: 'This Page doesn\'t exist'),
              ));
  }
}
