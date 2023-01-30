// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatroom/common/features/auth/controller/auth_controller.dart';
import 'package:chatroom/common/features/landing/screens/landing_screen.dart';
import 'package:chatroom/common/widgets/common_widgets.dart';
import 'package:chatroom/firebase_options.dart';
import 'package:chatroom/responsive/mobile_screen_layout.dart';
import 'package:chatroom/router.dart';
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

class MyApp extends ConsumerWidget {
  final AppTheme appTheme;
  const MyApp({
    Key? key,
    required this.appTheme,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatroom',
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.dark,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(userDataAuthProvider).when(
          data: (user) {
            if (user == null) {
              return const LandingScreen();
            }
            return const MobileScreenLayout();
          },
          error: (error, stackTrace) {
            return ErrorScreen(error: error.toString());
          },
          loading: () => const Loader()),
    );
  }
}
