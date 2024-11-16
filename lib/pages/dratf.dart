// import 'dart:convert';
//
// import 'package:chat_app/models/userModel.dart';
//
// const String sampleJsonData =
// '''
// [
//     {
//         "email": "user1@example.com",
//         "messages": [
//             {
//                 "message": "Let's meet tomorrow.",
//                 "messageTime": "2024-10-16 07:16:19"
//             },
//             {
//                 "message": "Hello!",
//                 "messageTime": "2024-11-02 04:21:19"
//             },
//             {
//                 "message": "Good morning!",
//                 "messageTime": "2024-10-28 16:42:19"
//             },
//             {
//                 "message": "I'll let you know.",
//                 "messageTime": "2024-11-12 02:50:19"
//             }
//         ]
//     },
//     {
//         "email": "user2@example.com",
//         "messages": [
//             {
//                 "message": "The deadline is tomorrow.",
//                 "messageTime": "2024-11-10 18:10:19"
//             },
//             {
//                 "message": "Any updates on the project?",
//                 "messageTime": "2024-10-19 05:27:19"
//             },
//             {
//                 "message": "Good night!",
//                 "messageTime": "2024-10-26 22:22:19"
//             },
//             {
//                 "message": "Hello!",
//                 "messageTime": "2024-10-30 18:03:19"
//             }
//         ]
//     },
//     {
//         "email": "user4@example.com",
//         "messages": [
//             {
//                 "message": "Let's discuss this in the meeting.",
//                 "messageTime": "2024-10-26 22:42:19"
//             },
//             {
//                 "message": "How are you?",
//                 "messageTime": "2024-10-21 05:52:19"
//             },
//             {
//                 "message": "I'll take care of it.",
//                 "messageTime": "2024-10-24 21:03:19"
//             }
//         ]
//     },
//     {
//         "email": "user5@example.com",
//         "messages": [
//             {
//                 "message": "Thanks a lot.",
//                 "messageTime": "2024-11-08 07:57:19"
//             },
//             {
//                 "message": "You're welcome.",
//                 "messageTime": "2024-11-02 18:55:19"
//             },
//             {
//                 "message": "How are you?",
//                 "messageTime": "2024-11-13 01:38:19"
//             },
//             {
//                 "message": "You're welcome.",
//                 "messageTime": "2024-11-02 23:48:19"
//             }
//         ]
//     },
//     {
//         "email": "user3@example.com",
//         "messages": [
//             {
//                 "message": "Got it, thanks!",
//                 "messageTime": "2024-10-31 15:21:19"
//             },
//             {
//                 "message": "Hello!",
//                 "messageTime": "2024-11-02 16:43:19"
//             },
//             {
//                 "message": "Call me when you're free.",
//                 "messageTime": "2024-11-07 15:39:19"
//             },
//             {
//                 "message": "I'll send the details shortly.",
//                 "messageTime": "2024-10-18 18:19:19"
//             },
//             {
//                 "message": "Can you help me with this?",
//                 "messageTime": "2024-10-25 04:19:19"
//             }
//         ]
//     }
//     ]
// ''';
//
//
// Future<List<UserModel>> fetchListOfMessagins()async{
//   List jsonData  = jsonDecode(sampleJsonData);
//   return jsonData.map((elem) => UserModel.fromJson(elem)).toList();
// }