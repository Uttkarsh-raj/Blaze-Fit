import 'package:blaze_fit/constants/constants.dart';
import 'package:blaze_fit/utils/glassmorphidm.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_button.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: size.height * 0.1,
      //   backgroundColor: const Color.fromARGB(250, 49, 47, 47),
      //   leading: Padding(
      //     padding: const EdgeInsets.fromLTRB(6, 18, 6, 18),
      //     child: GestureDetector(
      //       onTap: () {
      //         Navigator.of(context).pop();
      //       },
      //       child: CustomButton(
      //         height: size.height * 0.06,
      //         width: size.width * 0.2,
      //         child: const Icon(
      //           Icons.keyboard_arrow_left_outlined,
      //           size: 25,
      //         ),
      //       ),
      //     ),
      //   ),
      //   centerTitle: true,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: const [
      //       CircleAvatar(
      //         // backgroundImage: NetworkImage( //TODO: Add the app icon here...
      //         //   widget.receiver.profilePic,
      //         // ),
      //         radius: 25,
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text(
      //         'Blaze Bot',
      //         style: TextStyle(
      //           fontWeight: FontWeight.w500,
      //           fontSize: 20,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: size.height,
                width: size.width,
                child: AppColors.background),
            GlassContainer(
              colors: AppColors.gradient,
              blur: 65,
              height: size.height,
              width: size.width,
              border: 0,
              borderRadius: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0)
                    .copyWith(top: 0, right: 3, left: 3),
                child: Column(
                  children: [
                    GlassContainer(
                      blur: 20,
                      height: size.height * 0.08,
                      width: size.width,
                      border: 0,
                      borderRadius: 3,
                      colors: AppColors.gradient,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0)
                              .copyWith(left: 10, right: 10),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.keyboard_arrow_left_outlined,
                                  size: 25,
                                ),
                              ),
                              SizedBox(
                                width:
                                    (size.width * 0.33) - (size.height * 0.06),
                              ),
                              Row(
                                children: const [
                                  CircleAvatar(
                                    // backgroundImage: NetworkImage( //TODO: Add the app icon here...
                                    //   widget.receiver.profilePic,
                                    // ),
                                    radius: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Blaze Bot',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.78,
                      // child: Messages(widget.receiver, currentUser!),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: GlassContainer(
                        blur: 20,
                        height: size.height * 0.08,
                        width: size.width,
                        border: 0,
                        borderRadius: 20,
                        colors: AppColors.gradient,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.6,
                                child: TextField(
                                  enableSuggestions: true,
                                  keyboardType: TextInputType.text,
                                  maxLines: null,
                                  controller: messageController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 8),
                                    border: InputBorder.none,
                                    iconColor: Colors.grey,
                                    hintText: 'Type a message',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.mic,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      print(messageController.text);
                                      messageController.clear();
                                    },
                                    child: const Icon(
                                      Icons.send_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
