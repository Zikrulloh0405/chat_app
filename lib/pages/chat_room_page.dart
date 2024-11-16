import 'package:chat_app/messages.dart';
import 'package:chat_app/models/userModel.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/chat_room_model.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key, required this.email, required this.chatRoom});

  final String email;
  final ChatRoom chatRoom;

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMessagesList();
    print("messagesList : $messagesList");
    // divideByRole();
  }

  List<UserModel> messagesList = [
    // UserModel(email: "user1@gmail.com",
    //     messages: [
    //       MessagesModel(message: "Hello", messageTime: "01:10")
    //     ]
    // )
  ];

  List<UserModel> chatMessages = [];
  // List<UserModel>  myMessagesList = [];
  // List<UserModel>  outMessagesList = [];

  void loadMessagesList()async{
    final messages = await fetchListOfMessagins();
    setState(() {
      messagesList = messages;

      chatMessages.expand((user){
        return user.messages.map((elem){
          return MessagesModel(
              message: elem.message,
              messageTime: elem.messageTime,
          );
        }).toList();
      });

    });
  }
  
  // void divideByRole(){
  //   for(var i = 1; i <= messagesList.length; i ++){
  //     if(messagesList[i].email == widget.email){
  //       myMessagesList.add(messagesList[i]);
  //     }else{
  //       outMessagesList.add(messagesList[i]);
  //     }
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    print("a : ${chatMessages.length}");
  // print("b : ${chatMessages.length}");
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return ChatMembers(widget: widget);
                });
          },
          child: Row(
            children: [Text("Topic : "), Text("${widget.chatRoom.chatName}")],
          ),
        ),
        actions: [
          ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                "Logout",
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              iconAlignment: IconAlignment.end,
              icon: Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    var user = chatMessages[index];
                    bool isMine = user.email == widget.email;
                    return !isMine
                        ? Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: Icon(Icons.person_outline_rounded),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    decoration: BoxDecoration(
                                      color: isMine
                                          ? Colors.blue[100]
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                        bottomLeft: const Radius.circular(0),
                                        bottomRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: CustomMessageWidget(
                                      user: user,
                                      index: index,
                                    )),
                              ],
                            ))
                        : Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                  color: isMine
                                      ? Colors.blue[100]
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                    bottomLeft: const Radius.circular(12),
                                    bottomRight: Radius.circular(0),
                                  ),
                                ),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Message"),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "12:00",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                )));
                  },
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                        suffix: IconButton(
                            onPressed: () {}, icon: Icon(Icons.send))),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomMessageWidget extends StatelessWidget {
  const CustomMessageWidget({
    super.key, required this.user, required this.index,
  });

  final UserModel user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${user.email}",
          style: TextStyle(fontSize: 14),
        ),
        Row(
          children: [
            Text("${user.messages[index].message}"),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "${{user.messages[index].messageTime}}",
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        )
      ],
    ));
  }
}




class ChatMembers extends StatelessWidget {
  const ChatMembers({
    super.key,
    required this.widget,
  });

  final ChatRoomPage widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            Text("Members ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ListTile(
                leading: CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.person_outline_rounded,
                      size: 30,
                    )),
                title: Text(
                  "${widget.email}",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  "Online",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// extension TimeFormatExtension on String {
//   String toOnlineTime() {
//     final messageTime = DateTime.parse(this);
//     final now = DateTime.now();
//     final difference = now.difference(messageTime);
//
//     if (difference.inSeconds < 60) {
//       return "${difference.inSeconds} seconds ago";
//     } else if (difference.inMinutes < 60) {
//       return "${difference.inMinutes} minutes ago";
//     } else if (difference.inHours < 24) {
//       return "${difference.inHours} hours ago";
//     } else {
//       return DateFormat('MMM dd, yyyy').format(messageTime);
//     }
//   }
// }
