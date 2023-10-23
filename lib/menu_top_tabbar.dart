import 'package:flutter/material.dart';
import 'package:flutter_tes/nested_json.dart';
import 'package:flutter_tes/nested_withmodel.dart';
import 'package:flutter_tes/news_page.dart';
import 'package:flutter_tes/profile_page.dart';

class MenuTopTabBar extends StatefulWidget {
  const MenuTopTabBar({super.key});

  @override
  State<MenuTopTabBar> createState() => _MenuTopTabBarState();
}

class _MenuTopTabBarState extends State<MenuTopTabBar>
  with SingleTickerProviderStateMixin {
    TabController? tabController;

    @override
    void initState() {
      //TODO: implement initState
      super.initState();
      tabController = TabController(length: 3, vsync: this);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (_) => const NestedJsonModel()));
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
              child: Text(
                "Model",
                style: TextStyle(color: Colors.white),
              ),
              ),
            )
          ],
          title: const Text(
            "Web Service",
          style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          iconTheme: const IconThemeData(color: Colors.white),
          bottom: TabBar(controller: tabController, 
          tabs: const [
            Tab(
                text: "Nest Json",
                ),
              Tab(
                text: "News",
              ),
              Tab(text: "Profile",
              )
            ]),
          ),
          body: TabBarView(
            controller: tabController,
            children: const [NestedJson(), NewsPage(), ProfilePage()]),
      );
    }
  }