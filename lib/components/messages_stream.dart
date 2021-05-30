import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app/components/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class MessagesStream extends StatelessWidget {
  final User loggedInUser;

  MessagesStream({required this.loggedInUser});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("messages").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlue,
            ),
          );
        } else {
          final Iterable<QueryDocumentSnapshot<Object?>> messages =
              snapshot.data!.docs.reversed;
          List<MessageBubble> messageBubbles = [];
          for (QueryDocumentSnapshot<Object?> message in messages) {
            final String messageText = message.get("text");
            final String messageSender = message.get("sender");

            final currentUser = loggedInUser.email;

            final MessageBubble messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender ? true : false,
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              children: messageBubbles,
            ),
          );
        }
      },
    );
  }
}
