import 'package:chatroom/common/widgets/common_widgets.dart';
import 'package:chatroom/features/auth/screen/login_screen.dart';
import 'package:chatroom/utilis/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Welcome to Chatroom',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: (size.height / 9)),
              SvgPicture.asset(
                'assets/undraw.svg',
                height: 340,
                width: 340,
              ),
              SizedBox(height: (size.height / 9)),
              const Text(
                'Read our Privacy Policy. Tap "Agree and continue" to accept the terms and conditions',
                style: TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width * 0.75,
                child: CustomButton(
                  text: "AGREE AND CONTINUE",
                  onPressed: () => navigateToLoginScreen(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
