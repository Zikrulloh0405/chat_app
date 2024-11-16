import 'package:chat_app/pages/chat_room_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/chat_room_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // bool isEmailValid = false;



  ChatRoom? chosenChat;

  bool isEmailValid = false;

  void changeButtonStatus(ChatRoom chatRoom) {
    setState(() {
      if (chosenChat == chatRoom) {
        chosenChat = null; // Deselect the chat if it's already selected
      } else {
        chosenChat = chatRoom; // Select the new chat
      }
    });
  }

  bool validateEmail() {
    if (emailController.text.isEmpty) {
      return true;
    }
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(emailController.text);
  }

  bool isJoinActive() {
    return chosenChat != null && isEmailValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 7,
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// chat app and text field
                    Column(
                      children: [
                        const Text(
                          "Chat App",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            error: validateEmail()
                                ? null
                                : const Row(
                                    children: [
                                      Icon(
                                        Icons.warning,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "wrong email format, please try again",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 16),
                                      )
                                    ],
                                  ),
                            hintText: "Please Enter Your Email",
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              isEmailValid = validateEmail();
                            });
                          },
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    Column(
                      children: [
                        const Text(
                          "Please choose a topic below to discuss:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 320,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: listOfChats.length,
                            itemBuilder: (context, index) {
                              final chatRoom = listOfChats[index];
                              final isButtonActive = chosenChat == chatRoom;
                              return Container(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      color: isButtonActive
                                          ? Colors.pink
                                          : Colors.grey,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    changeButtonStatus(chatRoom);
                                  },
                                  icon: Icon(chatRoom.chatIcon,
                                      color: isButtonActive
                                          ? Colors.pink
                                          : Colors.grey),
                                  label: Text(
                                    chatRoom.chatName,
                                    style: TextStyle(
                                      color: isButtonActive
                                          ? Colors.pink
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    /// join
                    MaterialButton(
                      onPressed: isJoinActive()
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatRoomPage(
                                    email: emailController.text,
                                    chatRoom: chosenChat!,
                                  ),
                                ),
                              );
                            }
                          : null,
                      minWidth: double.infinity,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                            color: isJoinActive() ? Colors.black : Colors.grey,
                          )),
                      child: Text(
                        "Join",
                        style: TextStyle(
                            color: isJoinActive() ? Colors.black : Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}




// final Map categoryData = {
//   ChatRoom(),
//   "Technology": FontAwesomeIcons.microchip,
//   "Sport": FontAwesomeIcons.football,
//   "Fashion": FontAwesomeIcons.tshirt,
//   "Crypto": FontAwesomeIcons.bitcoin,
//   "Market": FontAwesomeIcons.shoppingCart,
//   "Others": FontAwesomeIcons.ellipsisH,
// };

final List listOfChats = [
  ChatRoom(chatName: "Car", chatIcon: FontAwesomeIcons.car),
  ChatRoom(chatName: "Technology", chatIcon: FontAwesomeIcons.microchip),
  ChatRoom(chatName: "Sport", chatIcon: FontAwesomeIcons.football),
  ChatRoom(chatName: "Fashion", chatIcon: FontAwesomeIcons.tshirt),
  ChatRoom(chatName: "Crypto", chatIcon: FontAwesomeIcons.bitcoin),
  ChatRoom(chatName: "Market", chatIcon: FontAwesomeIcons.shoppingCart),
  ChatRoom(chatName: "Others", chatIcon: FontAwesomeIcons.ellipsisH),
];

