import 'package:flutter/material.dart';

import 'package:flutter_tes/deatail_grid.dart';

class CustomeGrid extends StatefulWidget {
  const CustomeGrid({super.key});

@override
State<CustomeGrid> createState() => _CustomeGridState();
}
  
class _CustomeGridState extends State<CustomeGrid> {
  List<Map<String, dynamic>> ListMovie = [
    {"judul" : "Ciao Alberto", "gambar": "movie-1.jpg", "harga":50000},
    {"judul" : "Ciao Alberto", "gambar": "movie-2.jpg", "harga":35000},
    {"judul" : "Ciao Alberto", "gambar": "movie-3.jpg", "harga":45000},
    {"judul" : "Ciao Alberto", "gambar": "movie-4.jpg", "harga":30000},
    {"judul" : "Ciao Alberto", "gambar": "movie-5.jpg", "harga":40000},
    {"judul" : "Ciao Alberto", "gambar": "movie-6.jpg", "harga":50000},
    {"judul" : "Ciao Alberto", "gambar": "movie-7.jpg", "harga":45000},
    {"judul" : "Ciao Alberto", "gambar": "movie-8.jpg", "harga":60000},
    {"judul" : "Ciao Alberto", "gambar": "movie-9.jpg", "harga":55000},
    {"judul" : "Ciao Alberto", "gambar": "movie-10.jpg", "harga":60000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Custome Grid",
          style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: GridView.builder(
            itemCount: ListMovie.length,
          
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => DetailGrid(ListMovie[index])));
                },
                child: GridTile(
                  footer: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${ListMovie[index]["judul"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text("Rp. ${ListMovie[index]["harga"]}")
                        ],
                      ),
                    ),
                    child: Image.asset("images/movie/${ListMovie[index]["gambar"]}"),
                    ),
                  ),
            );
          },
          ),
          );
  }
}