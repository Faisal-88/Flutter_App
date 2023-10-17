import 'package:flutter/material.dart';

class RowPage extends StatelessWidget {
  const RowPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Row Page", 
          style: TextStyle(
            color: Colors.white,
            ),
            ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home,
              size: 50,
              color: Colors.brown,
            ),
            Icon(
              Icons.apps,
              size: 50,
              color: Colors.deepPurple,
            ),
            Icon(
              Icons.person,
              size: 50,
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
