import 'package:flutter/material.dart';

class DetailGrid extends StatelessWidget {
  final Map<String, dynamic>? ListMovie;
  const DetailGrid(this.ListMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${ListMovie?["judul"]}",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color:Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.asset(
              "images/movie/${ListMovie?["gambar"]}",
              height: 250,
              ),
              const SizedBox(
                height: 8,
              ),
              Text("${ListMovie?["judul"]}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
                ),
                Text(
                  "Rp. ${ListMovie?["harga"]}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Lorem ipsum",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ),
                  textAlign: TextAlign.justify,
                )
              ]),
        ),
    );
  }
}