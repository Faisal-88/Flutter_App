import 'package:flutter/material.dart';

class ListHorizontal extends StatelessWidget {
  const ListHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List Horizontal",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox(
        height: 200,
        width: 350,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(3, (index) {
            return SizedBox(
              height: 200,
              width: 350,
              child: Card(
                child: Center(
                  child: Text("Horizontal ${index + 1}"),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
