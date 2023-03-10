import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).focusColor,
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
    );
  }
}
