import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';

class ChatMessage extends StatefulWidget {
  final Map<String, String> userData;
  const ChatMessage({super.key, required this.userData});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  TextEditingController textEditingController = TextEditingController();
  List<Map<String, dynamic>> chatMessages = [
    {
      "isMe": "true",
      "Message":
          "Hey there! How's your day going?\nJust wanted to say hello and see how you're doing.\nLet's catch up soon.",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "isMe": "false",
      "Message":
          "Hi there! I'm doing well, thanks for asking.\nHow about you?\nIt's been a busy day for me.",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "isMe": "true",
      "Message":
          "I'm good too, thanks!\nJust trying to get through some work.\nBut I'm looking forward to the weekend.",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "isMe": "false",
      "Message":
          "Weekends are the best!\nAny plans for yours?\nI'm thinking of going hiking.",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "isMe": "true",
      "Message":
          "Sounds like a great plan!\nI might just relax at home.\nNeed some downtime after a busy week.",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "isMe": "false",
      "Message":
          "That sounds lovely!\nSometimes a quiet weekend is all you need.\nEnjoy your relaxation time!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "isMe": "true",
      "Message":
          "Thank you!\nI definitely will.\nHope you have a fantastic time hiking!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "isMe": "false",
      "Message":
          "Thank you!\nI'm sure I will.\nNature always helps clear the mind.",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "isMe": "true",
      "Message":
          "Absolutely!\nIt's refreshing to be out in nature.\nLet's chat again soon!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "isMe": "false",
      "Message": "Definitely!\nLooking forward to it.\nTake care!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Expanded(child: chat()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              controller: textEditingController,
              onChanged: (v) {
                setState(() {});
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        chatMessages.add(
                          {
                            "isMe": "true",
                            "Message": textEditingController.text,
                            "Image":
                                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
                          },
                        );
                        setState(() {});
                        textEditingController.clear();
                      },
                      icon: const Icon(Icons.send)),
                  hintText: "Type Your Message Here"),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 80),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(widget.userData["Image"]!),
              ),
            ),
            Expanded(
                child: Center(
              child: Text(
                widget.userData["Name"]!,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget chat() {
    return ListView.builder(
        itemCount: chatMessages.length,
        itemBuilder: (context, index) {
          final isMe =
              chatMessages[index]['isMe'] == 'true'; // Convert to boolean
          switch (isMe) {
            // Use boolean value for switch case
            case false:
              return chatFromOtherUser(index);
            default:
              return chatFromMe(index);
          }
        });
  }

  Widget chatFromOtherUser(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: AppSizing.screenSizeonHeight(14),
            backgroundImage: NetworkImage(chatMessages[index]['Image']),
          ),
          const SizedBox(
            width: 16,
          ),
          Flexible(
              child: Container(
            constraints: const BoxConstraints(minHeight: 40),
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Text(chatMessages[index]['Message']),
            ),
            //give padding pending
          )),
          Flexible(flex: 3, child: Container()),
        ],
      ),
    );
  }

  Widget chatFromMe(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(flex: 3, child: Container()),
          Flexible(
              child: Container(
            constraints: BoxConstraints(
                minHeight: 40, minWidth: MediaQuery.of(context).size.width / 4),
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Text(chatMessages[index]['Message']),
            ),
          )),
          SizedBox(
            width: 16,
          ),
          CircleAvatar(
            radius: AppSizing.screenSizeonHeight(14),
            backgroundImage: NetworkImage(chatMessages[index]['Image']),
          ),
        ],
      ),
    );
  }
}
