import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.title,
				this.phone,
				this.email,
    this.number,
    this.currentPoint,
    this.dailyPoint,
    this.dailyPointSl,
    this.dailyPointRl,
    this.weeklyPoint,
    this.tiername,
    this.monthlyPoint,
    this.totalPoint,
  });
  String? id;
  String? title,phone,email;
  String? name;
  int? number;
  int? currentPoint;
  int? dailyPoint;
  int? dailyPointSl;
  int? dailyPointRl;
  int? weeklyPoint;
  String? tiername;
  int? monthlyPoint;
  int? totalPoint;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
								title: json['title'],
        name: json["name"],
        number: json["number"],
								phone:json['phone'],
								email:json['email'],
        currentPoint: json["currentPoint"],
        dailyPoint: json["dailyPoint"],
        dailyPointSl: json["dailyPointSL"],
        dailyPointRl: json["dailyPointRL"],
        weeklyPoint: json["weeklyPoint"],
        tiername: json["tiername"],
        monthlyPoint: json["monthlyPoint"],
        totalPoint: json["totalPoint"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
								'title':title,
        "number": number,
								'email':email,
								'tierName':tiername,
								"phone":phone,
        "currentPoint": currentPoint,
        "dailyPoint": dailyPoint,
        "dailyPointSL": dailyPointSl,
        "dailyPointRL": dailyPointRl,
        "weeklyPoint": weeklyPoint,
        "tiername": tiername,
        "monthlyPoint": monthlyPoint,
        "totalPoint": totalPoint,
      };
}
