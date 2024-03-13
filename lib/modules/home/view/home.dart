import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  static List<String> crouselSliderImages = [
    "https://images.unsplash.com/photo-1622008288982-fb3b2cb6a3bc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHx8",
    "https://plus.unsplash.com/premium_photo-1661964026265-6d15b8d0f792?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE2fHx8ZW58MHx8fHx8",
    "https://images.unsplash.com/photo-1665215669280-d636f317f162?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE5fHx8ZW58MHx8fHx8",
    "https://images.unsplash.com/photo-1708464437205-ee5a2cc8edbc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHx8"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            titleSubTitle(),
            crouselSlider(),
            currentUserStatus(),
            SizedBox(
              height: AppSizing.screenSizeonHeight(24),
            ),
            Text(
              "Browse all",
              style: GoogleFonts.roboto(
                  fontSize: min(20, AppSizing.screenSizeonWidth(13)),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: AppSizing.screenSizeonHeight(12),
            ),
            MasonryGridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemCount: (images.length * multipleImage),
              itemBuilder: (context, index) {
                return Image.network(images[index % ((images.length - 1))]);
              },
            ),
            const SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  multipleImage++;
                });
              },
              child: Container(
                height: AppSizing.screenSizeonHeight(40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(6)),
                child: Center(
                  child: Text(
                    "See More",
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: min(13, AppSizing.screenSizeonWidth(20)),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget titleSubTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSizing.screenSizeonHeight(20),
        ),
        Text(
          "Discover",
          style: GoogleFonts.comfortaa(
              fontSize: min(45, AppSizing.screenSizeonWidth(36))),
        ),
        SizedBox(
          height: AppSizing.screenSizeonHeight(10),
        ),
        Text(
          "What’s new today".toUpperCase(),
          style: GoogleFonts.roboto(
              fontSize: min(
                20,
                AppSizing.screenSizeonWidth(13),
              ),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget currentUserStatus() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
        child: Row(
          children: [
            Container(
              height: AppSizing.screenSizeonHeight(30),
              width: AppSizing.screenSizeonWidth(30),
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/ram.jpg"), fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gajanand",
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "@gaj_K",
                    style: GoogleFonts.roboto(fontSize: 10),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget crouselSlider() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: AppSizing.screenSizeonHeight(343),
        width: double.infinity,
        child: CarouselSlider(
          items: crouselSliderImages
              .map(
                (e) => LayoutBuilder(
                  builder: (context, constraints) {
                    double screenWidth = constraints.maxWidth;
                    double screenHeight = AppSizing.screenSizeonHeight(343);

                    double imageWidth =
                        screenWidth < 394 ? screenWidth : double.infinity;
                    double imageHeight =
                        screenWidth < 394 ? screenHeight * 0.6 : screenHeight;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Image.network(
                              e,
                              fit: BoxFit.cover,
                              width: imageWidth,
                              height: imageHeight,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
              .toList(),
          options: CarouselOptions(viewportFraction: 1),
        ),
      ),
    );
  }
}
