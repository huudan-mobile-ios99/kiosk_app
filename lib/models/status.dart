import 'dart:convert';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));

String statusToJson(Status data) => json.encode(data.toJson());

class Status {
  Status({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data(
      {required this.preferredName,
						required this.phone,required this.title,required this.email,required this.tiername,
      required this.number,
      required this.loyaltyPoints,
      required this.loyaltyPointsCurrent,
      required this.loyaltyPointsToday,
      required this.loyaltyPointsWeek,
      required this.loyaltyPointsMonth,
      required this.loyaltyPointTodaySlot,
      required this.loyaltyPointTodayRLTB});

  String preferredName;
  String phone, email, title, tiername;
  int number;
  int loyaltyPoints;
  int loyaltyPointsCurrent;
  int loyaltyPointsToday;
  int loyaltyPointsWeek;
  int loyaltyPointsMonth;
  int loyaltyPointTodaySlot;
  int loyaltyPointTodayRLTB;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        preferredName: json["PreferredName"],
        number: json["Number"],
								email: json['Email']??"",
								phone:json['Phone']??"",
								title:json['Title']??"",
								tiername:json['TierName']??"",
        loyaltyPoints: json["LoyaltyPoints"],
        loyaltyPointsCurrent: json["LoyaltyPoints_Current"],
        loyaltyPointsToday: json["LoyaltyPoints_Today"],
        loyaltyPointTodaySlot: json["LoyaltyPoints_Today_Slot"],
        loyaltyPointTodayRLTB: json["LoyaltyPoints_Today_RLTB"],
        loyaltyPointsWeek: json["LoyaltyPoints_Week"],
        loyaltyPointsMonth: json["LoyaltyPoints_Month"],
      );

  Map<String, dynamic> toJson() => {
        "PreferredName": preferredName,
        "Number": number,
								"Title":title,
								"Email":email,
								"Phone":phone,
								"TierName":tiername,
        "LoyaltyPoints": loyaltyPoints,
        "LoyaltyPoints_Current": loyaltyPointsCurrent,
        "LoyaltyPoints_Today": loyaltyPointsToday,
        "LoyaltyPoints_Today_Slot": loyaltyPointTodaySlot,
        "LoyaltyPoints_Today_RLTB": loyaltyPointTodayRLTB,
        "LoyaltyPoints_Week": loyaltyPointsWeek,
        "LoyaltyPoints_Month": loyaltyPointsMonth,
      };
}
