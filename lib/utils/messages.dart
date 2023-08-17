import 'package:flutter/material.dart';
import '../constants/constants.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.by, required this.message});
  final String by;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 9, bottom: 0),
      child: Align(
        alignment:
            (by == "gpt") ? (Alignment.bottomLeft) : (Alignment.bottomRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: (by == "gpt")
                ? (AppColors.sentMessage)
                : (AppColors.receivedMesage),
          ),
          padding: const EdgeInsets.all(15),
          child: Text(
            message,
            style: TextStyle(
              fontSize: 15,
              color: AppColors.mainText,
            ),
          ),
        ),
      ),
    );
  }
}
