// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatroom/model/user_model.dart';
import 'package:chatroom/common/features/chat/screen/chats_screen.dart';
import 'package:chatroom/utilis/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectContactRepositoryProvider = Provider(
  (ref) => SelectContactRepository(firestore: FirebaseFirestore.instance),
);

class SelectContactRepository {
  final FirebaseFirestore firestore;

  SelectContactRepository({
    required this.firestore,
  });

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try {
      if (await FlutterContacts.requestPermission()) {
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async {
    try {
      var userColloection = await firestore.collection('users').get();

      bool isFound = false;

      for (var document in userColloection.docs) {
        var userData = UserModel.fromMap(document.data());

        String selectedPhoneNumber =
            selectedContact.phones[0].number.replaceAll(' ', '');

        if (selectedPhoneNumber == userData.phoneNumber) {
          isFound = true;
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, ChatScreen.routeName, arguments: {
            'name': userData.name,
            'uid': userData.uid,
            'photoUrl': userData.profilePic,
          });
        }
      }

      if (!isFound) {
        // ignore: use_build_context_synchronously
        showSnackBar(
            context: context,
            content: 'This number does not exist in this app');
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}
