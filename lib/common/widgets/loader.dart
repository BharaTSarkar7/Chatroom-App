import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).focusColor,
        valueColor:
            AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      ),
    );
  }
}


// new AlwaysStoppedAnimation<Color>(Colors.red),