import 'package:flutter/material.dart';
import 'package:photogram/app_sizing.dart';
import 'package:photogram/modules/add_post/view/create.dart';
import 'package:photogram/modules/chat/view/chat.dart';
import 'package:photogram/modules/home/view/home.dart';
import 'package:photogram/modules/profile/view/profile.dart';
import 'package:photogram/modules/search/view/search.dart';

class Room extends StatefulWidget {
  const Room({super.key});

  @override
  State<Room> createState() => _RoomState();
}

enum RoomIcons { home, search, create, chat, profile }

class _RoomState extends State<Room> {
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
    RoomIcons.profile: Profile(),
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
          height: AppSizing.screenSizeonHeight(80),
        ),
        label: "");
  }

  BottomNavigationBarItem createIcon() {
    return BottomNavigationBarItem(
        icon: Padding(
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
        label: "Add");
  }
}
