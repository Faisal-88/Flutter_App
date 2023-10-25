import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tes/auth/login_screen.dart';
import 'package:flutter_tes/menu_top_tabbar.dart';
import 'package:flutter_tes/session/session_manager.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
 Future cekSession() async  {
    await Future.delayed(const Duration(seconds: 4), (){
      sessionManager.loadSession().then((value) {
        if (kDebugMode) {
          print("value $value");
        }
        if (value != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const MenuTopTabBar()),
            (route) => false);
        }else{
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false);
        }
      });
  }); 
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    cekSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("WELCOME NEWS APPS",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.green[700]),
          ),
      ),
    );
  }
}
 