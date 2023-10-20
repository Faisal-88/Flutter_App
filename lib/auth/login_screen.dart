import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tes/menu_top_tabbar.dart';
import 'package:flutter_tes/response/res_login.dart';
import 'package:flutter_tes/api/api.dart';
import 'package:http/http.dart' as http;



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>  _LoginScreenState();
}

class  _LoginScreenState extends State <LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  bool isLogin = false;
  Future<ResLogin?> loginUser() async {
    try {
      setState(() {
        isLogin = true;
      });
      http.Response res = await http.post(Uri.parse("${Api.baseUrl}login.php"),
        body: {"username" : username.text, "password" : password.text});
        ResLogin data = resLoginFromJson(res.body);
        if(data.value == 1) {
        setState(() {
        isLogin = false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const MenuTopTabBar()),
           (route) => false);
      });
    } else if (data.value == 0) {
      setState(() {
        isLogin = false;
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("${data.message}")));
      });
    }else {
      setState(() {
        isLogin = false;
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("${data.message}")));
      });
    }
  } catch (e, st) {
    setState(() {
      isLogin = false;
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(e.toString())));
      if (kDebugMode) {
        print("Error ${st.toString()}");
      }
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "LOGIN",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormField(
                controller: username,
                validator: (val) {
                  return val!.isEmpty ? "tidak boleh kosong" : null;
                },
                decoration: InputDecoration(
                  hintText: "USERNAME",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(6)),
                    fillColor: Colors.green.withOpacity(0.2),
                    filled: true),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                obscureText: true,
                controller: password,
                validator: (val) {
                  return val!.isEmpty ? "tidak boleh kosong" : null;
                },
                decoration: InputDecoration(
                  hintText: "PASSWORD",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.green.withOpacity(0.2)),
            ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)),
                onPressed: () {
                  if (key.currentState!.validate()) {
                    loginUser();
                  }
                },
                color: Colors.green,
                textColor: Colors.white,
                minWidth: 150,
                height: 45,
                child: const Text("LOGIN"),
            )
            ],
          )
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          color: Colors.white,
          height: 45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: const BorderSide(width: 1,color: Colors.green)),
            onPressed: () {},
              child: const Text(
                "Anda belum punya akun ? silahkan register",
                style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green),  
              ),
          ) ,
        ),
      );
  }
}