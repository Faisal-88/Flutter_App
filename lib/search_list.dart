import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  List<String> dataList = [
    "Iphone",
    "Samsung",
    "Realme",
    "Xiomi",
    "Vivo",
    "Opo",
    "Nexus",
    "Google Pixel",
    "Polytron",
    "Mito",
    "iPad",
    "Samsung Tab"
  ];
  List<String> filterList = [];
  TextEditingController cari = TextEditingController();
  bool isSearch = true;
  _SearchListState() {
    cari.addListener(() { 
      if (cari.text.isEmpty) {
        setState(
          () {
            isSearch = false;
        },
        );
      } else {
        setState(
          () {
            isSearch = false;
        },
        );
      }
    },
    );
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
        'Search List',
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: cari,
                decoration: InputDecoration(
                  hintText: "Cari",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.3)),
              ),
              const SizedBox(
                height: 8,
              ),
              isSearch
              ? Expanded(
                child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Card(
                    child: ListTile(
                      title: Text(dataList[index]),
                    ),
                    );
                  }),
            )
              : performSearch(),
            ],
          ),
          ),
    );

  }
  Widget performSearch() {
    filterList = [];
    for(int i = 0; i< dataList.length; i++) {
      var item = dataList[i];
      if (item.toLowerCase().contains(cari.text.toLowerCase())) {
        filterList.add(item);
      }
    }
    return result();
  }

  Widget result() {
    return Expanded(
      child: ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (contaxt, index) {
          return Card(
            child: ListTile(
          title: Text(filterList[index]),
          ),
        );
        },
        ),
    );
  }
}