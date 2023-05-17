import 'package:flutter/material.dart';

import 'constants.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {super.key,
      required this.text,
      required this.sender,
      this.isImage = false});

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: sender == "user" ? scaffoldBackgroundColor : cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 14,
                backgroundColor: sender == "user"
                    ? Theme.of(context).primaryColor
                    : Colors.blueGrey,
                child: Image.asset(sender == "user"
                    ? "assets/images/openai_logo.jpg"
                    : "assets/images/contact.png")),
            Expanded(
              child: isImage
                  ? AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        text,
                        loadingBuilder: (context, child, loadingProgress) =>
                            loadingProgress == null
                                ? child
                                : const CircularProgressIndicator.adaptive(),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(left: 15, bottom: 8),
                      child: Text(
                        text.trim(),
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: 'SohneMono-Bold',
                            height: 1.5),
                        textAlign: TextAlign.left,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
//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