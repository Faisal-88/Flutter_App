import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
                ],
              ),
            );
          },
        );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_tes/session/session_manager.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String? idUser;

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     sessionManager.loadSession().then((value) {
//       setState(() {
//         idUser = sessionManager.id;
//       });
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Ini adalah id profile : $idUser",
//       style: const TextStyle(color: Colors.purple),
//       )
//     );
//   }
// }