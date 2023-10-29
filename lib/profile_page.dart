import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tes/edit_profile_page.dart';
import 'package:flutter_tes/session/session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tes/response/res_profile.dart';
import 'package:flutter_tes/api/api.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Profile> listProfile = [];
  bool isLoading = true;
  String? idUser;
  String? fullnameUser;
  String? usernameUser;

  Future<void> getProfile() async {
    try {
      http.Response res = await http.post(Uri.parse("${Api.baseUrl}getUser.php"),
      body: {"id" : sessionManager.id});
      if (res.statusCode == 200) {
        ResProfile data = resProfileFromJson(res.body);

        setState(() {
          isLoading = false;
          listProfile = data.data!;
        });
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e, st) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        if (kDebugMode) {
          print("Error ${st.toString()}");
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getProfile();
    sessionManager.loadSession().then((value) {
      setState(() {
        idUser = sessionManager.id;
      });
    });
  }

  void updateUser(String id, String fullname, String username) async {
    final response = await http.post(
      Uri.parse("${Api.baseUrl}updateUser.php"),
      body: {
        'id': id,
        'fullname': fullname,
        'username': username,
      },
    );

    if (response.statusCode == 200) {
      print('Data berhasil diperbarui!');
    } else {
      print('Gagal memperbarui data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading 
      ? const Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        )
      : ListView.builder(
          itemCount: listProfile.length,
          itemBuilder: (context, index) {
            var data = listProfile[index];
            return ListTile(
              title: const Text("Data Profile"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username : ${data.username}"),
                  Text("Email : ${data.email}"),
                  Text("Fullname : ${data.fullname}"),
                  MaterialButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    height: 45,
                    minWidth: 200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                    onPressed: () async {
                      Map<String, String> updatedData = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(
                            fullname: data.fullname.toString(),
                            username: data.username.toString(),
                          ),
                        ),
                      );
                      
                      if (updatedData != null) {
                        String? newFullname = updatedData['fullname'];
                        String? newUsername = updatedData['username'];                       
                        updateUser(sessionManager.id!, newFullname!, newUsername!);

                        setState(() {
                          data.fullname = newFullname;
                          data.username = newUsername;
                        });
                      }
                    },
                    child: const Text("EDIT"),
                  ),
                ],
              ),
            );
          },
        );
  }
}