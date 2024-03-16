import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photogram/app_sizing.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int multipleImage = 1;
  TextEditingController textEditingController = TextEditingController();
  static const List<Map> searchImages = [
    {
      "url":
          "https://images.unsplash.com/photo-1576201836106-db1758fd1c97?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGRvZ3xlbnwwfHwwfHx8MA%3D%3D",
      "category": "dog"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNwYWNlfGVufDB8fDB8fHww",
      "category": "space"
    },
    {
      "url":
          "https://plus.unsplash.com/premium_photo-1666298864117-ffc36b8e0cc4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGRvZ3xlbnwwfHwwfHx8MA%3D%3D",
      "category": "dog"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1610296669228-602fa827fc1f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c3BhY2V8ZW58MHx8MHx8fDA%3D",
      "category": "space"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c3RhZGl1bXxlbnwwfHwwfHx8MA%3D%3D ",
      "category": "Stadium"
    },
    {
      "url":
          "https://plus.unsplash.com/premium_photo-1677916317230-d9b78d675264?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHNwYWNlfGVufDB8fDB8fHww",
      "category": "space"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1556056504-5c7696c4c28d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3RhZGl1bXxlbnwwfHwwfHx8MA%3D%3D ",
      "category": "stadium"
    },
    {
      "url":
          "https://plus.unsplash.com/premium_photo-1674591172888-1184c4170a47?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW5kaWElMjBmbGFnfGVufDB8fDB8fHww",
      "category": "flag"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1484589065579-248aad0d8b13?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHNwYWNlfGVufDB8fDB8fHww",
      "category": "space"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1516118461620-03680a03bd27?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHN0YWRpdW18ZW58MHx8MHx8fDA%3D ",
      "category": "stadium"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1605478060354-fdd636ea3f5d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW5kaWElMjBmbGFnfGVufDB8fDB8fHww",
      "category": "flag"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1610173827043-9db50e0d8ef9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW5kaWFuJTIwYnJpZGV8ZW58MHx8MHx8fDA%3D",
      "category": "bride"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1561037404-61cd46aa615b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZG9nfGVufDB8fDB8fHww",
      "category": "dog",
    },
    {
      "url":
          "https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZG9nfGVufDB8fDB8fHww",
      "category": "dog"
    },
    {
      "url":
          "https://images.unsplash.com/flagged/photo-1551854716-8b811be39e7e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aW5kaWFuJTIwYnJpZGV8ZW58MHx8MHx8fDA%3D",
      "category": "bride"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1477884213360-7e9d7dcc1e48?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGRvZ3xlbnwwfHwwfHx8MA%3D%3D",
      "category": "dog"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1576201836106-db1758fd1c97?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGRvZ3xlbnwwfHwwfHx8MA%3D%3D",
      "category": "dog"
    },
    {
      "url":
          "https://plus.unsplash.com/premium_photo-1666298864117-ffc36b8e0cc4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGRvZ3xlbnwwfHwwfHx8MA%3D%3D",
      "category": "dog"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1543466835-00a7907e9de1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZG9nfGVufDB8fDB8fHww",
      "category": "dog"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FyfGVufDB8fDB8fHww",
      "category": "car"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1502877338535-766e1452684a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2FyfGVufDB8fDB8fHww",
      "category": "car"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Y2FyfGVufDB8fDB8fHww",
      "category": "car"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y2FyfGVufDB8fDB8fHww",
      "category": "car"
    },
  ];
  late List<Map> tempSearchlist;
  @override
  void initState() {
    tempSearchlist = searchImages;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SafeArea(
              child: TextField(
                controller: textEditingController,
                onChanged: (v) {
                  tempSearchlist = searchImages
                      .where((element) => element['category']
                          .toString()
                          .toLowerCase()
                          .contains(v.toLowerCase()))
                      .toList();
                  setState(() {});
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search Category Here"),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: tempSearchlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 1000
                      ? 8
                      : MediaQuery.of(context).size.width > 600
                          ? 4
                          : 2),
              itemBuilder: (context, index) {
                return Image.network(
                  tempSearchlist[index]["url"],
                  fit: BoxFit.fill,
                );
              },
            ),
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
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
