import 'package:flutter_tes/response/res_users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NestedJsonModel extends StatefulWidget {
  const NestedJsonModel ({super.key});

@override
State<NestedJsonModel> createState() => _NestedJsonModelState();
}

class _NestedJsonModelState extends State<NestedJsonModel> {
  List<ResUsers> listUSers = [];
  bool isLoading = false;

  Future<List<ResUsers>?> getDataUsers() async {
    try {
      setState(() {
        isLoading = true;
      });

      http.Response res =await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
        List<ResUsers> data = resUsersFromJson(res.body);
        setState(() {
          isLoading = false;
          listUSers = data;
          print("with model $listUSers");
        });
    } catch (e, st) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
          print("Error ${st.toString()}");
        });
    }
  }

  @override
  void initState() {
  //TODO: implement initState
  super.initState();
  getDataUsers();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nest Json With Model",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: isLoading
          ? const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )
          : ListView.builder(
            itemCount: listUSers.length,
            itemBuilder: (context, index) {
              ResUsers data = listUSers[index];
              return ListTile(
                title: Text("${data.name}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email : ${data.email}"),
                    Text("Alamat  : ${data.address?.street}"),
                    Text("Company : ${data.company?.name}")
                  ],
                ),
              );
            },
          )
    );
  }

}