import 'package:chatroom/screen/calls_screen.dart';
import 'package:chatroom/screen/messages_screen.dart';
import 'package:chatroom/screen/setting_screen.dart';
import 'package:chatroom/screen/status_screen.dart';
import 'package:flutter/cupertino.dart';

List<Widget> homeScreenItems = [
  const MessagesScreen(),
  const CallsScreen(),
  const StatusScreen(),
  const SettingScreen(),
];
