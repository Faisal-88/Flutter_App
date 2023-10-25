// To parse this JSON data, do
//
//     final resProfile = resProfileFromJson(jsonString);

import 'dart:convert';

ResProfile resProfileFromJson(String str) => ResProfile.fromJson(json.decode(str));

String resProfileToJson(ResProfile data) => json.encode(data.toJson());

class ResProfile {
    bool? isSuccess;
    String? message;
    List<Profile>? data;

    ResProfile({
        this.isSuccess,
        this.message,
        this.data,
    });

    factory ResProfile.fromJson(Map<String, dynamic> json) => ResProfile(
        isSuccess: json["isSuccess"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Profile>.from(json["data"]!.map((x) => Profile.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Profile {
    String? id;
    String? username;
    String? email;
    String? password;
    String? fullname;
    DateTime? tglDaftar;

    Profile({
        this.id,
        this.username,
        this.email,
        this.password,
        this.fullname,
        this.tglDaftar,
    });

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        fullname: json["fullname"],
        tglDaftar: json["tgl_daftar"] == null ? null : DateTime.parse(json["tgl_daftar"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "fullname": fullname,
        "tgl_daftar": tglDaftar?.toIso8601String(),
    };
}