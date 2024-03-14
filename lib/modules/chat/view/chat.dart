import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';
import 'package:photogram/modules/chat/view/chat_messages.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Map<String, String>> chatUsers = [
    {
      "Name": "Alice",
      "Message":
          "Hey there! How's your day going?\nJust wanted to say hello and see how you're doing.\nLet's catch up soon.",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Bob",
      "Message":
          "Hi Bob! Did you catch the game last night?\nWhat did you think about the match?\nHope you're having a great day!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Charlie",
      "Message":
          "Good morning! Any plans for the weekend?\nThinking of going hiking, you interested?\nLet me know if you're up for it!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "David",
      "Message":
          "Hey David, have you tried that new restaurant downtown?\nI heard they have amazing sushi.\nWe should check it out sometime!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Eva",
      "Message":
          "Hi Eva! Just wanted to say hello and see how you're doing.\nHope everything is going well for you.\nLet me know if you need anything!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Frank",
      "Message":
          "Hey Frank, long time no see! Let's catch up soon.\nHow have you been?\nWe should grab a coffee sometime!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Grace",
      "Message":
          "Good afternoon Grace! How's work going?\nBusy day today?\nLet's plan something fun for the weekend!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Henry",
      "Message":
          "Hey Henry, did you hear about the upcoming project?\nI think it's going to be really exciting.\nLooking forward to working on it together!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Ivy",
      "Message":
          "Hi Ivy! How was your vacation?\nDid you go anywhere interesting?\nTell me all about it!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Jack",
      "Message":
          "Hey Jack, what's the plan for tonight?\nThinking of going to that new bar downtown.\nYou in?",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Kate",
      "Message":
          "Hi Kate! How's everything going with your new job?\nSettling in well?\nLet's catch up soon!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Liam",
      "Message":
          "Hey Liam, how was your weekend?\nDo anything fun?\nLet's hang out sometime!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Mia",
      "Message":
          "Hi everyone, Mia here!\nHope you're all doing well.\nLet's plan something fun!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Noah",
      "Message":
          "Hey Noah, any exciting plans for the holidays?\nThinking of going on a trip?\nLet's plan something together!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Olivia",
      "Message":
          "Hi Olivia! How was your trip?\nDid you have a good time?\nTell me all about it!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Peter",
      "Message":
          "Hey Peter, did you check out that new movie yet?\nI heard it's really good.\nLet's go watch it together!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Quinn",
      "Message":
          "Hi Quinn! What's your favorite hobby?\nMine is painting.\nWhat about you?",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Ryan",
      "Message":
          "Hey Ryan, how's the weather over there?\nSunny or rainy?\nLet's grab lunch sometime!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Samantha",
      "Message":
          "Hi Samantha! How's your day been so far?\nBusy or relaxed?\nLet's catch up soon!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    },
    {
      "Name": "Thomas",
      "Message":
          "Hey Thomas, did you read that interesting article I sent you?\nWhat did you think about it?\nLet's discuss it sometime!",
      "Image":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      body: ListView.builder(
          itemCount: chatUsers.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ChatMessage(
                            userData: chatUsers[index] as Map<String, String>);
                      }));
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: AppSizing.screenSizeonHeight(32),
                          backgroundImage:
                              NetworkImage(chatUsers[index]["Image"]!),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chatUsers[index]['Name']!,
                              style: GoogleFonts.roboto(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              chatUsers[index]['Message']!,
                              style: GoogleFonts.roboto(fontSize: 13),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.chevron_right),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider()
              ],
            );
          }),
    );
  }
}
