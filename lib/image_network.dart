import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({super.key});
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Network",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Image.network("https://media.istockphoto.com/id/166144434/id/foto/kipas-lipat-jepang.jpg?s=1024x1024&w=is&k=20&c=5E2ropzvcz5c5dv6FRV8bE5C5qB-8j8xz9rpvhtwn3M="),
      ),
      ); 
    }
  }
  