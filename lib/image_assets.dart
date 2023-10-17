import 'package:flutter/material.dart';

class ImageAssets extends StatefulWidget {
  const ImageAssets({super.key});
  @override

  State<ImageAssets> createState() => _ImageAssetsState();
}

  class _ImageAssetsState extends State<ImageAssets> {
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Asset",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Image.asset("images/ruang.jpg"),
      ),
      ); 
    }
  }
  