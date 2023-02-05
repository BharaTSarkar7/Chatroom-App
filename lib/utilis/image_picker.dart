import 'dart:io';

import 'package:chatroom/utilis/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }

  return image;
}

Future<File?> pickVideoFromGallery(BuildContext context) async {
  File? video;
  try {
    final pickVideo =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickVideo != null) {
      video = File(pickVideo.path);
    }
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }

  return video;
}
