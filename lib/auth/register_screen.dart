import 'package:flutter/material.dart';
import 'package:flutter_tes/auth/login_screen.dart';
import 'package:flutter_tes/response/res_register.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tes/api/api.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenStateState();
}

class _RegisterScreenStateState extends State<RegisterScreen> {
  TextEditingController fullname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

bool isRegister = false;
Future<ResRegister?>registerUser() async {
  try {
    setState(() {
      isRegister = true;
    });
    http.Response res =
        await http.post(Uri.parse("${Api.baseUrl}register.php"), body: {
        "username": username.text,
        "password": pass.text,
        "fullname": fullname.text,
        "email": email.text
      });
      ResRegister data = resRegisterFromJson(res.body);
      if (data.value == 1) {
        setState(() {
          isRegister = false;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false );
      });
    } else if (data.value == 2) {
      setState(() {
        isRegister = false;
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("${data.message}")));
      });
    } else {
      setState(() {
        isRegister = false;
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("${data.message}")));
      });
    }
  } catch (e, st) {
    setState(() {
      isRegister = false;
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(e.toString())));
      print("Errorst ${st.toString()}");
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "REGISTER" .toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,fontSize: 25),
            ),
            const SizedBox(
              height: 35,
            ),
            TextFormField(
              controller: fullname,
              validator: (val) {
                return val!.isEmpty ? "tidak boleh kosong": null;
              },
              decoration: InputDecoration(
                hintText: "FULLNAME",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none),
                  fillColor: Colors.green.withOpacity(0.2),
                  filled: true),
            ),
            const SizedBox(
              height: 8,
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
                  filled: true,
                  fillColor: Colors.green.withOpacity(0.2)),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: email,
              validator: (val) {
                return val!.isEmpty ? "tidak boleh kosong" :null;
              },
              decoration: InputDecoration(
                hintText: "EMAIL",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none),
                  fillColor: Colors.green.withOpacity(0.2),
                  filled: true),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: pass,
              validator: (val) {
                return val!.isEmpty ? "tidak boleh kosong" :null;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "PASSWORD",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6)),
                  filled: true,
                  fillColor: Colors.green.withOpacity(0.2)),
            ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)),
                height: 45,
                minWidth: 150,
                onPressed: () async {
                  if(key.currentState!.validate()) {
                    await registerUser();
                  }
                },
                color: Colors.green,
                textColor: Colors.white,
                child: const Text("REGISTER"),
            )
          ],
        ),
        ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false);
          },
          color: Colors.white,
          textColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: const BorderSide(width: 1, color: Colors.green)),
            child: const Text("Jika anda sudah punya akun ? silahkan login"),
            ),
        ),
      );
    }
}

