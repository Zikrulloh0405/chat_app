// import 'package:chat_app/pages/chat_room_page.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   TextEditingController emailController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   // bool isEmailValid = false;
//
//   final Map categoryData = {
//     "Cars": FontAwesomeIcons.car,
//     "Technology": FontAwesomeIcons.microchip,
//     "Sport": FontAwesomeIcons.football,
//     "Fashion": FontAwesomeIcons.tshirt,
//     "Crypto": FontAwesomeIcons.bitcoin,
//     "Market": FontAwesomeIcons.shoppingCart,
//     "Others": FontAwesomeIcons.ellipsisH,
//   };
//
//   List listOfActiveButtons = [];
//
//   bool isEmailValid = false;
//
//   void changeButtonStatus(elem) {
//     setState(() {
//       if (listOfActiveButtons.contains(elem)) {
//         listOfActiveButtons.remove(elem);
//       } else {
//         listOfActiveButtons.add(elem);
//       }
//     });
//   }
//
//   bool validateEmail() {
//     if (emailController.text.isEmpty) {
//       return true;
//     }
//     return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
//         .hasMatch(emailController.text);
//   }
//
//   bool isJoinActive() {
//     return listOfActiveButtons.isNotEmpty && isEmailValid;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print(listOfActiveButtons);
//     print(validateEmail());
//     return Scaffold(
//       body: Column(
//         children: [
//           // const Spacer(),
//           Expanded(
//             flex: 5,
//             child: Card(
//               color: Colors.white,
//               margin: const EdgeInsets.symmetric(horizontal: 20),
//               // padding: const EdgeInsets.symmetric(horizontal: 20),
//               // decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.circular(4),
//               //     border: Border.all(
//               //       color: Colors.grey,
//               //     )),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     /// chat app and text field
//                     Column(
//                       children: [
//                         const Text(
//                           "Chat App",
//                           style: TextStyle(
//                               fontSize: 40, fontWeight: FontWeight.w500),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         TextField(
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             error: validateEmail()
//                                 ? null
//                                 : const Row(
//                               children: [
//                                 Icon(
//                                   Icons.warning,
//                                   color: Colors.red,
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Text(
//                                   "wrong email format, please try again",
//                                   style: TextStyle(
//                                       color: Colors.red, fontSize: 16),
//                                 )
//                               ],
//                             ),
//                             hintText: "Please Enter Your Email",
//                             hintStyle: const TextStyle(color: Colors.grey),
//                             border: const OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.grey)),
//                           ),
//                           onChanged: (value) {
//                             setState(() {
//                               // if (emailController.text.isNotEmpty) {
//                               //   isEmailValid = RegExp(
//                               //           r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
//                               //       .hasMatch(emailController.text);
//                               // }
//                               isEmailValid = validateEmail();
//                             });
//                           },
//                         )
//                       ],
//                     ),
//
//                     const SizedBox(
//                       height: 40,
//                     ),
//
//                     /// text and categories
//                     Column(
//                       children: [
//                         const Text(
//                           "Please Choose one of the following topics below that you want to discuss about ...",
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Flexible(
//                             child: GridView.builder(
//                                 shrinkWrap: true,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2, // Two items per row
//                                   crossAxisSpacing: 10,
//                                   mainAxisSpacing: 10,
//                                   childAspectRatio: 3,
//
//                                 ),
//                                 itemCount: categoryData.length,
//                                 itemBuilder: (context, index) {
//                                   String key =
//                                   categoryData.keys.elementAt(index);
//                                   IconData icon = categoryData[key]!;
//
//                                   bool isButtonActive =
//                                   listOfActiveButtons.contains(key);
//                                   return ElevatedButton.icon(
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                       const WidgetStatePropertyAll(
//                                           Colors.white),
//                                       shape: WidgetStatePropertyAll(
//                                         RoundedRectangleBorder(
//                                           side: BorderSide(
//                                               color: isButtonActive
//                                                   ? Colors.pink
//                                                   : Colors.grey),
//                                           borderRadius:
//                                           BorderRadius.circular(8),
//                                         ),
//                                       ),
//                                     ),
//                                     onPressed: () {
//                                       changeButtonStatus(key);
//                                       print(
//                                           "List of Active Buttons $listOfActiveButtons");
//                                       // print("Name ${elem.key}, Icon ${elem.value}, ");
//                                     },
//                                     icon: Icon(icon,
//                                         color: isButtonActive
//                                             ? Colors.pink
//                                             : Colors.grey),
//                                     label: Text(
//                                       key,
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w700,
//                                           color: isButtonActive
//                                               ? Colors.pink
//                                               : Colors.grey),
//                                     ),
//                                     iconAlignment: IconAlignment.end,
//                                   );
//                                 })),
//                         // Wrap(
//                         //   runAlignment: WrapAlignment.start,
//                         //   spacing: 10.0,
//                         //   runSpacing: 16.0,
//                         //   children: categoryData.entries.map((elem) {
//                         //     bool isButtonActive =
//                         //         listOfActiveButtons.contains(elem.key);
//                         //     return ElevatedButton.icon(
//                         //       style: ButtonStyle(
//                         //         backgroundColor:
//                         //             const WidgetStatePropertyAll(Colors.white),
//                         //         shape: WidgetStatePropertyAll(
//                         //           RoundedRectangleBorder(
//                         //             side: BorderSide(
//                         //                 color: isButtonActive
//                         //                     ? Colors.pink
//                         //                     : Colors.grey),
//                         //             borderRadius: BorderRadius.circular(8),
//                         //           ),
//                         //         ),
//                         //       ),
//                         //       onPressed: () {
//                         //         changeButtonStatus(elem.key);
//                         //         print(
//                         //             "List of Active Buttons $listOfActiveButtons");
//                         //         print("Name ${elem.key}, Icon ${elem.value}, ");
//                         //       },
//                         //       icon: Icon(elem.value,
//                         //           color: isButtonActive
//                         //               ? Colors.pink
//                         //               : Colors.grey),
//                         //       label: Text(
//                         //         elem.key,
//                         //         style: TextStyle(
//                         //             fontWeight: FontWeight.w700,
//                         //             color: isButtonActive
//                         //                 ? Colors.pink
//                         //                 : Colors.grey),
//                         //       ),
//                         //       iconAlignment: IconAlignment.end,
//                         //     );
//                         //   }).toList(),
//                         // )
//                       ],
//                     ),
//
//                     const SizedBox(
//                       height: 30,
//                     ),
//
//                     /// join
//                     MaterialButton(
//                       onPressed: isJoinActive()
//                           ? () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ChatRoomPage(),
//                           ),
//                         );
//                       }
//                           : null,
//                       minWidth: double.infinity,
//                       height: 50,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5),
//                           side: BorderSide(
//                             color: isJoinActive() ? Colors.black : Colors.grey,
//                           )),
//                       child: Text(
//                         "Join",
//                         style: TextStyle(
//                             color: isJoinActive() ? Colors.black : Colors.grey,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 20),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // const Spacer()
//         ],
//       ),
//     );
//   }
// }
