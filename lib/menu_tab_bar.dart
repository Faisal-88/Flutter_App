import 'package:flutter/material.dart';
import 'package:flutter_tes/custome.grid.dart';
import 'package:flutter_tes/register_form.dart';
import 'package:flutter_tes/search_list.dart';

class MenuTabBar extends StatefulWidget {
  const MenuTabBar({super.key});

  @override
  State<MenuTabBar> createState() => _MenuTabBarState();
}

class _MenuTabBarState extends State<MenuTabBar>
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
        body: TabBarView(controller: tabController, children: const[
          CustomeGrid(),
          RegisterForm(),
          SearchList(),
        ]),
        bottomNavigationBar: BottomAppBar(
          child: TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            controller: tabController, tabs: const [
              Tab(
                text: "Custome Grid",
                icon: Icon(Icons.grid_on),
                ),
              Tab(
                text: "Register Form",
              icon: Icon(Icons.format_align_center),
              ),
              Tab(text: "Search List",
              icon: Icon(Icons.search),
              )
            ]),
          ),
      );
    }
  }