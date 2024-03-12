import 'package:flutter/material.dart';
import 'package:photogram/app_sizing.dart';

class Room extends StatefulWidget {
  const Room({super.key});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/app_icons/home.png",
              height: AppSizing.screenSizeonHeight(80),
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/app_icons/search.png",
              height: AppSizing.screenSizeonHeight(80),
            ),
            label: "Search"),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/app_icons/chat.png",
              height: AppSizing.screenSizeonHeight(80),
            ),
            label: "Chat"),
        BottomNavigationBarItem(
            icon: Image.asset(
              "assets/app_icons/profile.png",
              height: AppSizing.screenSizeonHeight(80),
            ),
            label: "Profile")
      ]),
    );
  }
}
