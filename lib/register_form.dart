import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  List<String> listAgama = [
    "Islam",
    "Kristen Protestan",
    "Kristen Katolik",
    "Budha",
    "Hindu",
    "Konghucu"
  ];
  String? valueAgama, jk;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register Form",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: keyForm,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: fullname,
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong" : null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "FULLNAME",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: email,
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosng" : null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "EMAIL",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2)),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButton(
                    hint: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Pilih Agama"),
                    ),
                    underline: Container(),
                    isExpanded: true,
                    value: valueAgama,
                    items: listAgama.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valueAgama = val;
                      });
                    }),
                const SizedBox(
                  height: 8,
                ),
                RadioListTile(
                  value: "Laki-laki",
                  groupValue: jk,
                  onChanged: (val) {
                    setState(() {
                      jk = val;
                    });
                  },
                  activeColor: Colors.blue,
                  title: const Text("Laki-laki"),
                ),
                RadioListTile(
                  value: "Perempuan",
                  groupValue: jk,
                  onChanged: (val) {
                    setState(() {
                      jk = val;
                    });
                  },
                  activeColor: Colors.deepPurple,
                  title: const Text("Perempuan"),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: password,
                  validator: (val) {
                    return val!.isEmpty ? "tidak boleh kosong" : null;
                  },
                  decoration: InputDecoration(
                      hintText: "PASSWORD",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true),
                ),
                const SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  height: 45,
                  minWidth: 200,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      showDialog(
                          context: (context),
                          builder: (context) {
                            return AlertDialog(
                              scrollable: true,
                              title: const Center(child: Text("Data Register")),
                              content: Column(
                                children: [
                                  Text("Fullname : ${fullname.text}"),
                                  Text("Email : ${email.text}"),
                                  Text("Password : ${password.text}"),
                                  Text("Agama : $valueAgama"),
                                  Text("Jenis Kelamin : $jk"),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Dismiss")),
                              ],
                            );
                          });
                    }
                  },
                  child: const Text("REGISTER"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
