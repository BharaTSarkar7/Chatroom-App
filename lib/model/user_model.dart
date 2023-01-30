// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String name;
  final String uid;
  final String profilePic;
  final String phoneNumber;
  final bool isOnline;
  final List<String> groupId;

  UserModel({
    required this.name,
    required this.uid,
    required this.profilePic,
    required this.phoneNumber,
    required this.isOnline,
    required this.groupId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'profilePic': profilePic,
      'phoneNumber': phoneNumber,
      'isOnline': isOnline,
      'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] as String,
        uid: map['uid'] as String,
        profilePic: map['profilePic'] as String,
        phoneNumber: map['phoneNumber'] as String,
        isOnline: map['isOnline'] as bool,
        groupId: List<String>.from(
          (map['groupId']),
        ));
  }
}
