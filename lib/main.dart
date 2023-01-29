// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatroom/common/features/landing/screens/landing_screen.dart';
import 'package:chatroom/firebase_options.dart';
import 'package:chatroom/responsive/mobile_screen_layout.dart';
import 'package:chatroom/responsive/responsive_layout.dart';
import 'package:chatroom/responsive/web_screen_layout.dart';
import 'package:chatroom/router.dart';
import 'package:chatroom/screen/chats_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:chatroom/utilis/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: MyApp(
        appTheme: AppTheme(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppTheme appTheme;
  const MyApp({
    Key? key,
    required this.appTheme,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatroom',
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.dark,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LandingScreen(),
    );
  }
}
