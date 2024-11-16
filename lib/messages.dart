import 'dart:convert';

import 'package:chat_app/models/userModel.dart';

const String sampleJsonData =
'''
[
    {
        "email": "user1@example.com",
        "messages": [
            {
                "message": "Let's meet tomorrow.",
                "messageTime": "07:08"
            },
            {
                "message": "Hello!",
                "messageTime": "07:08"
            },
            {
                "message": "Good morning!",
                "messageTime": "07:08"
            },
            {
                "message": "I'll let you know.",
                "messageTime": "07:08"
            }
        ]
    },
    {
        "email": "user2@example.com",
        "messages": [
            {
                "message": "The deadline is tomorrow.",
                "messageTime": "07:08"
            },
            {
                "message": "Any updates on the project?",
                "messageTime": "07:08"
            },
            {
                "message": "Good night!",
                "messageTime": "07:08"
            },
            {
                "message": "Hello!",
                "messageTime": "07:08"
            }
        ]
    },
    {
        "email": "user4@example.com",
        "messages": [
            {
                "message": "Let's discuss this in the meeting.",
                "messageTime": "07:08"
            },
            {
                "message": "How are you?",
                "messageTime": "07:08"
            },
            {
                "message": "I'll take care of it.",
                "messageTime": "07:08"
            }
        ]
    },
    {
        "email": "hello@gmail.com",
        "messages": [
            {
                "message": "Thanks a lot.",
                "messageTime": "07:08"
            },
            {
                "message": "You're welcome.",
                "messageTime": "07:08"
            },
            {
                "message": "How are you?",
                "messageTime": "07:08"
            },
            {
                "message": "You're welcome.",
                "messageTime": "07:08"
            }
        ]
    },
    {
        "email": "user3@example.com",
        "messages": [
            {
                "message": "Got it, thanks!",
                "messageTime": "07:08"
            },
            {
                "message": "Hello!",
                "messageTime": "07:08"
            },
            {
                "message": "Call me when you're free.",
                "messageTime": "07:08"
            },
            {
                "message": "I'll send the details shortly.",
                "messageTime": "07:08"
            },
            {
                "message": "Can you help me with this?",
                "messageTime": "07:08"
            }
        ]
    }
    ]
''';


Future<List<UserModel>> fetchListOfMessagins()async{
  List jsonData  = jsonDecode(sampleJsonData);
  return jsonData.map((elem) => UserModel.fromJson(elem)).toList();
}