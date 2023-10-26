import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tes/api/api.dart';
import 'package:flutter_tes/response/res_berita.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Berita> listBerita = [];

  Future<List<Berita>?> getBerita() async {
    try {
      http.Response res =
          await http.post(Uri.parse("${Api.baseUrl}getBerita.php"));
      return resBeritaFromJson(res.body).data;
    } catch (e, st) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      if (kDebugMode) {
        print("Error ${st.toString()}");
      }
      return null;
    }
  }

  List<Berita> filterList = [];
  TextEditingController cari = TextEditingController();
  bool isSearch = true;

  _NewsPageState() {
    cari.addListener(() {
      setState(() {
        isSearch = cari.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBerita(),
      builder: (BuildContext context, AsyncSnapshot<List<Berita>?> snapshot) {
        if (snapshot.hasData) {
          filterList = snapshot.data!;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cari,
                  decoration: InputDecoration(
                    hintText: "Cari",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              isSearch
                  ? result() // Show search results
                  : Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          Berita? data = snapshot.data?[index];
                          return Column(
                            children: [
                              Image.network(
                                "${Api.imageUrl}${data?.gambarBerita}",
                                height: 250,
                                fit: BoxFit.fitWidth,
                              ),
                              ListTile(
                                title: Text("${data?.judul}"),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }
      },
    );
  }

  Widget result() {
    return Expanded(
      child: ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (context, index) {
          Berita? data = filterList[index];
          return Card(
            child: ListTile(
              title: Text(data.judul ?? ''),
            ),
          );
        },
      ),
    );
  }
}
