import 'package:flutter/material.dart';

class HomeImageView extends StatefulWidget {
  final String imageUrl;
  const HomeImageView({super.key, required this.imageUrl});

  @override
  State<HomeImageView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.imageUrl), fit: BoxFit.fill)),
      ),
    );
  }
}
