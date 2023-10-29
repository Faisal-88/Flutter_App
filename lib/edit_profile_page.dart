import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final String fullname;
  final String username;

  const EditProfilePage({
    Key? key,
    required this.fullname,
    required this.username,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void handleEditButton() {
    // Ambil data yang diperbarui
    String newFullname = fullnameController.text;
    String newUsername = usernameController.text;

    // Kirim data yang diperbarui kembali ke ProfilePage
    Navigator.pop(context, {'fullname': newFullname, 'username': newUsername});
  }

  @override
  void initState() {
    super.initState();
    fullnameController.text = widget.fullname;
    usernameController.text = widget.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Form Edit Profile',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: fullnameController,
              decoration: InputDecoration(
                hintText: "FULLNAME",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.green.withOpacity(0.2),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "USERNAME",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.green.withOpacity(0.2),
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                handleEditButton();
              },
              color: Colors.green,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)),
              height: 45,
              minWidth: 150,
              child: const Text('EDIT'),
            ),
          ],
        ),
      ),
    );
  }
}
