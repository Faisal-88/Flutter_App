import 'package:flutter/material.dart';
import 'package:flutter_tes/auth/login_screen.dart';
// import 'package:flutter_tes/custome.grid.dart';
import 'package:flutter_tes/image_assets.dart';
import 'package:flutter_tes/menu_top_tabbar.dart';
// import 'package:flutter_tes/menu_top_tabbar.dart';
// import 'package:flutter_tes/menu_tab_bar.dart';
// import 'package:flutter_tes/register_form.dart';
import 'package:flutter_tes/row_column_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_tes/row_page.dart';
import 'package:flutter_tes/column_page.dart';
import 'package:flutter_tes/list_vertical.dart';
import 'package:flutter_tes/list_horizontal.dart';
import 'package:flutter_tes/image_network.dart';
import 'package:flutter_tes/gridview_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MenuTopTabBar());
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController nama = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "First App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      drawer:Drawer(child: Column(children: [ const UserAccountsDrawerHeader(
          accountName: Text("M. Faisal"),
          accountEmail: Text("faisal123@gmail.com"),
          currentAccountPicture: CircleAvatar(
            radius: 55,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 50,
              ),
          ),
        ),
          ListTile(
          title: const Text("Row Page"),
          onTap: () {
            Navigator.push(
              context,
            MaterialPageRoute(builder: (_) => const RowPage())); 
          },
        ),
        ListTile(
          title: const Text("Row & Column Page"),
          onTap: () {
            Navigator.push(
              context,
            MaterialPageRoute(builder: (_) => const RowColumnPage())); 
          },
        ),
          ListTile(
          title: const Text("Column Page"),
          onTap: () {
            Navigator.push(
              context,
            MaterialPageRoute(builder: (_) => const ColumnPage())); 
          },
        ),
         ListTile(
          title: const Text("List Vertical"),
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ListVertical()));
          },
        ),
         ListTile(
          title: const Text("List Horizontal"),
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ListHorizontal()));
          },
        ),
          ListTile(
          title: const Text("GridView"),
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (_) => const GridViewPage()));
          },
        ),
          ListTile(
          title: const Text("Image Network"),
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ImageNetwork()));
          },
        ),
        ListTile(
          title: const Text("Image Assets"),
          onTap: () {
            Navigator.push(
              context,
            MaterialPageRoute(builder: (_) => const ImageAssets())); 
          },
        )
        ],
        ),
        ),
        body:Center(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                controller: nama,
                decoration: const InputDecoration(hintText: "INPUT NAMA"),
              ),
              const SizedBox(
                height:25,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      height: 45,
                      textColor: Colors.white,
                      color: Colors.green,
                      shape: RoundedRectangleBorder (
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      showDialog(
                        context: context, 
                        builder: (context){
                        return AlertDialog(
                          title: const Text("Warning!"),
                          content: Text("Nama anda : ${nama.text}"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Dismiss"))
                          ],
                        );
                      });
                    },
                    child: const Text("Klik Alert"),
                  ),
                    MaterialButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      height: 45,
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: "ini adalah pesan toast",
                          textColor: Colors.white,
                          backgroundColor: Colors.green,
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_SHORT);
                      },
              
                          child: const Text("Klik Toast"),
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          height: 45,
                          // minWidth: 150,
                          textColor: Colors.black,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("ini adalah pesan snackbar"),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 3),
                              ),
                            );
                          },
                          child: const Text("Klik Snackbar"),
                        ),
                      ],
              ),
            ],
           ),
          ),
         )
      
     
          );  
  }
}