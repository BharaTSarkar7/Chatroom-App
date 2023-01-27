// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatroom/responsive/mobile_screen_layout.dart';
import 'package:chatroom/responsive/responsive_layout.dart';
import 'package:chatroom/responsive/web_screen_layout.dart';
import 'package:flutter/material.dart';

import 'package:chatroom/utilis/theme.dart';

void main() {
  runApp(MyApp(
    appTheme: AppTheme(),
  ));
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
      home: const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout()),
    );
  }
}
