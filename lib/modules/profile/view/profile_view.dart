import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/modules/home/view/home_image_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int multipleImage = 1;
  static const List<String> images = [
    "https://images.unsplash.com/photo-1545537619-3b5475acd977?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8SnBnNktpZGwtSGt8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1707779299307-56e2a7d973c1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDU2fEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D",
    "https://images.unsplash.com/photo-1539778019007-bbc2a18ab421?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDV8SnBnNktpZGwtSGt8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1707894867963-b6b5b44de895?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIxfEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D",
    "https://images.unsplash.com/photo-1709290823049-5987608828ec?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDI3fEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D",
    "https://images.unsplash.com/photo-1709247397603-186cb7d7f592?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDM5fEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D",
    "https://images.unsplash.com/photo-1596733430284-f7437764b1a9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDk1fEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D",
    "https://plus.unsplash.com/premium_photo-1708983589793-56673027592e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDc3fEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D",
    "https://images.unsplash.com/photo-1620576537654-089e6620b4ea?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDgyfEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D",
    "https://images.unsplash.com/photo-1633338234899-fdb513f4db2e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDQzfEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D",
    "https://images.unsplash.com/photo-1619911619712-444b8ec2e2dd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDUxfEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(top: 40.0, bottom: 22, left: 123, right: 123),
              child: CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1557296387-5358ad7997bb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZmFjZXxlbnwwfHwwfHx8MA%3D%3D"),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 42,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Melody",
                        style: TextStyle(fontSize: 36),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      height: 15,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Jaipur, Rajasthan, Bharat",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      child: Container(
                        height: 52,
                        width: 343,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                          child: Text(
                            "Follow Melody",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      child: Container(
                        height: 52,
                        width: 343,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                          child: Text(
                            "Message",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MasonryGridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemCount: (images.length * multipleImage),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return HomeImageView(
                                  imageUrl:
                                      images[index % ((images.length - 1))]);
                            }));
                          },
                          child: Image.network(
                              images[index % ((images.length - 1))]));
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        multipleImage++;
                      });
                    },
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: Text(
                          "See More",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: min(13, 20),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ])
          ],
        ),
      ),
    );
  }
}
