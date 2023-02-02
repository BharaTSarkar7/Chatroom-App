// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chatroom/common/enums/messages_enum.dart';

class Message {
  final String senderId;
  final String receieverId;
  final String text;
  final String messageId;
  final MessageEnum type;
  final DateTime timeSent;
  final bool isSeen;
  Message({
    required this.senderId,
    required this.receieverId,
    required this.text,
    required this.messageId,
    required this.type,
    required this.timeSent,
    required this.isSeen,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'receieverId': receieverId,
      'text': text,
      'messageId': messageId,
      'type': type.type,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'isSeen': isSeen,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'] as String,
      receieverId: map['receieverId'] as String,
      text: map['text'] as String,
      messageId: map['messageId'] as String,
      type: (map['type'] as String).toEnum(),
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
      isSeen: map['isSeen'] as bool,
    );
  }
}
