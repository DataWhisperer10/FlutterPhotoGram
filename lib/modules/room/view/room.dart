import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photogram/app_sizing.dart';
import 'package:photogram/modules/add_post/view/create.dart';
import 'package:photogram/modules/chat/view/chat.dart';
import 'package:photogram/modules/home/view/home.dart';
import 'package:photogram/modules/profile/view/profile_update.dart';
import 'package:photogram/modules/search/view/search.dart';

class Room extends StatefulWidget {
  const Room({super.key});

  @override
  State<Room> createState() => _RoomState();
}

enum RoomIcons { home, search, create, chat, profile }

class _RoomState extends State<Room> {
  File? image;
  ImagePicker imagePicker = ImagePicker();
  RoomIcons currentSelection = RoomIcons.home;

  static Map indexToEnum = {
    0: RoomIcons.home,
    1: RoomIcons.search,
    2: RoomIcons.create,
    3: RoomIcons.chat,
    4: RoomIcons.profile,
  };
  static const Map enumToIcon = {
    RoomIcons.home: "assets/app_icons/home.png",
    RoomIcons.search: "assets/app_icons/search.png",
    RoomIcons.chat: "assets/app_icons/chat.png",
    RoomIcons.profile: "assets/app_icons/profile.png",
  };
  static const Map enumToPage = {
    RoomIcons.home: Home(),
    RoomIcons.search: Search(),
    RoomIcons.create: Create(),
    RoomIcons.chat: Chat(),
    RoomIcons.profile: ProfileUpdate(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(),
      body: enumToPage[currentSelection],
    );
  }

  Widget bottomNav() {
    return BottomNavigationBar(
        onTap: (i) {
          currentSelection = indexToEnum[i];
          setState(() {});
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          commonIcon(RoomIcons.home),
          commonIcon(RoomIcons.search),
          createIcon(),
          commonIcon(RoomIcons.chat),
          commonIcon(RoomIcons.profile),
        ]);
  }

  BottomNavigationBarItem commonIcon(RoomIcons roomIcons) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          enumToIcon[roomIcons],
          color: currentSelection == roomIcons ? Colors.blueAccent : null,
          height: AppSizing.screenSizeonHeight(50),
        ),
        label: "");
  }

  BottomNavigationBarItem createIcon() {
    return BottomNavigationBarItem(
        icon: InkWell(
          onTap: () {
            getPhotoFromGallery().then((value) async {
              //Uint8List? unit8list= await value?.readAsBytes ();
              if (value != null) {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              value.path,
                              height: 250,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration:
                                  BoxDecoration(color: Colors.lightBlue),
                              child: Center(
                                child: Text(
                                  "Upload Image",
                                  style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    });
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: AppSizing.screenSizeonHeight(40),
              width: AppSizing.screenSizeonWidth(70),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      // ignore: use_full_hex_values_for_flutter_colors
                      colors: [Color(0xffFF00D6), Color(0xfffff4d00)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
        label: "Add");
  }

  Future<File?> getPhotoFromGallery() async {
    XFile? xfile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      image = File(xfile.path);
      return image;
    } else {
      return null;
    }
  }

  getPhotoFromCamera() {
    imagePicker.pickImage(source: ImageSource.camera);
  }
}
