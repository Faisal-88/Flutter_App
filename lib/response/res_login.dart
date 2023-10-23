// To parse this JSON data, do
//
//     final resLogin = resLoginFromJson(jsonString);

import 'dart:convert';

ResLogin resLoginFromJson(String str) => ResLogin.fromJson(json.decode(str));

String resLoginToJson(ResLogin data) => json.encode(data.toJson());

class ResLogin {
    int? value;
    String? message;
    String? username;
    String? fullname;
    String? id;

    ResLogin({
        this.value,
        this.message,
        this.username,
        this.fullname,
        this.id,
    });

    factory ResLogin.fromJson(Map<String, dynamic> json) => ResLogin(
        value: json["value"],
        message: json["message"],
        username: json["username"],
        fullname: json["fullname"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "message": message,
        "username": username,
        "fullname": fullname,
        "id": id,
    };
}
