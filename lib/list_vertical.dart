import 'package:flutter/material.dart';

class ListVertical extends StatelessWidget {
  const ListVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List Vertical"
          ),
          backgroundColor: Colors.green,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
      body: ListView(
        children: List.generate(
          20,
          (index) => ListTile(
            title: Text("List $index"),
          ),
        ),
      ),
      );
  }
}
