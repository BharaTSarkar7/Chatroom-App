// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class Avatar extends StatelessWidget {
  final String photoUrl;
  final double radius;
  const Avatar({
    Key? key,
    required this.photoUrl,
    required this.radius,
  }) : super(key: key);

  const Avatar.small({
    Key? key,
    required this.photoUrl,
    this.radius = 16,
  }) : super(key: key);

  const Avatar.medium({
    Key? key,
    required this.photoUrl,
    this.radius = 22,
  }) : super(key: key);

  const Avatar.large({
    Key? key,
    required this.photoUrl,
    this.radius = 44,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).cardColor,
      backgroundImage: NetworkImage(photoUrl),
    );
  }
}
