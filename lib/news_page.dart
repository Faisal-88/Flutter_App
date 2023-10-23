import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tes/api/api.dart';
import 'package:flutter_tes/response/res_berita.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  List<Berita> listBerita = [];

  Future<List<Berita>?> getBerita() async {
    try {
      http.Response res =
        await http.get(Uri.parse("${Api.baseUrl}getBerita.php"));
        return resBeritaFromJson(res.body).data;
    } catch (e, st) {
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(e.toString())));
      if (kDebugMode) {
        print("Error ${st.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: getBerita(),
    builder: (BuildContext context, AsyncSnapshot<List<Berita>?> snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            Berita? data = snapshot.data?[index];
            return Column (
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
          });
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
}