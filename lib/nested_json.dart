import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as htpp;

class NestedJson extends StatefulWidget {
  const NestedJson ({super.key});

@override
State<NestedJson> createState() => _NestedJsonState();
}

class _NestedJsonState extends State<NestedJson> {
  List listUser = [];
  bool isLoading =false;

  Future<List?> getUsers() async {
    try {
      setState(() {
        isLoading = false;
      });
      htpp.Response res = await htpp
      .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      var data = jsonDecode(res.body);
      setState(() {
        isLoading = false;
        listUser = data;
        if (kDebugMode) {
          print(listUser);
        }
      });
    } catch (e, st) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
        if (kDebugMode) {
          print("Error ${st.toString()}");
        }
      });
    }
  }

@override
void initState() {
  //TODO: implement initState
  super.initState();
  getUsers();
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

  @override
  Widget build(BuildContext context) {
    return isLoading 
            ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
            : ListView.builder(
              itemCount: listUser.length,
              itemBuilder: (context, index) {
                var data = listUser[index];
                return ListTile(
                  title: Text("${data["name"]}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${data["email"]}"),
                      Text("Alamat : ${data["address"]["street"]}"),
                      Text("Company : ${data["company"]["name"]}"),
                    ],
                  ),
                );
              });
    }
}