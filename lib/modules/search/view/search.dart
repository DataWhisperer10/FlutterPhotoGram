import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static const List<Map> searchImages = [
    {
      "url":
          "https://images.unsplash.com/photo-1540747913346-19e32dc3e97e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8c3RhZGl1bXxlbnwwfHwwfHx8MA%3D%3D ",
      "category": "Stadium"
    },
    {
      "url":
          " https://images.unsplash.com/photo-1512719994953-eabf50895df7?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3RhZGl1bXxlbnwwfHwwfHx8MA%3D%3D",
      "category": "stadium"
    },
    {
      "url":
          " https://images.unsplash.com/photo-1522778119026-d647f0596c20?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8c3RhZGl1bXxlbnwwfHwwfHx8MA%3D%3D",
      "category": "stadium"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1556056504-5c7696c4c28d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3RhZGl1bXxlbnwwfHwwfHx8MA%3D%3D ",
      "category": "stadium"
    },
    {
      "url":
          "https://images.unsplash.com/photo-1516118461620-03680a03bd27?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHN0YWRpdW18ZW58MHx8MHx8fDA%3D ",
      "category": "stadium"
    },
    {
      "url":
          " https://images.unsplash.com/photo-1563299796-b729d0af54a5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHN0YWRpdW18ZW58MHx8MHx8fDA%3D",
      "category": "stadium"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.count(
        shrinkWrap: true,
        crossAxisCount: MediaQuery.of(context).size.width > 1000
            ? 8
            : MediaQuery.of(context).size.width > 600
                ? 4
                : 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: searchImages.length,
        itemBuilder: (context, index) {
          return Image.network(
            searchImages[index]["url"],
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}
