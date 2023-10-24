// To parse this JSON data, do
//
//     final resRegister = resRegisterFromJson(jsonString);

import 'dart:convert';

ResRegister resRegisterFromJson(String str) => ResRegister.fromJson(json.decode(str));

String resRegisterToJson(ResRegister data) => json.encode(data.toJson());

class ResRegister {
    int? value;
    String? message;
    String? username;
    String? fullname;
    String? id;

    ResRegister({
        this.value,
        this.message,
        this.username,
        this.fullname,
        this.id,
    });

    factory ResRegister.fromJson(Map<String, dynamic> json) => ResRegister(
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
