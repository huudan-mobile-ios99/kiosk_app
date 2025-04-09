// To parse this JSON data, do
//
//     final statusShort = statusShortFromJson(jsonString);

import 'dart:convert';

StatusShort statusShortFromJson(String str) => StatusShort.fromJson(json.decode(str));

String statusShortToJson(StatusShort data) => json.encode(data.toJson());

class StatusShort {
    bool status;
    DataShort data;

    StatusShort({
        required this.status,
        required this.data,
    });

    factory StatusShort.fromJson(Map<String, dynamic> json) => StatusShort(
        status: json["status"],
        data: DataShort.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class DataShort {
    String preferredName;
    int number;
    String tierName;
    DateTime dateOfBirth;
    int loyaltyPoints;
    int loyaltyPointsCurrent;
    int loyaltyPointsToday;
    int loyaltyPointsWeek;
    int loyaltyPointsMonth;
    int loyaltyPointsTodaySlot;
    int loyaltyPointsTodayRltb;

    DataShort({
        required this.preferredName,
        required this.number,
        required this.tierName,
        required this.dateOfBirth,
        required this.loyaltyPoints,
        required this.loyaltyPointsCurrent,
        required this.loyaltyPointsToday,
        required this.loyaltyPointsWeek,
        required this.loyaltyPointsMonth,
        required this.loyaltyPointsTodaySlot,
        required this.loyaltyPointsTodayRltb,
    });

    factory DataShort.fromJson(Map<String, dynamic> json) => DataShort(
        preferredName: json["PreferredName"],
        number: json["Number"],
        tierName: json["TierName"],
        dateOfBirth: DateTime.parse(json["DateOfBirth"]),
        loyaltyPoints: json["LoyaltyPoints"],
        loyaltyPointsCurrent: json["LoyaltyPoints_Current"],
        loyaltyPointsToday: json["LoyaltyPoints_Today"],
        loyaltyPointsWeek: json["LoyaltyPoints_Week"],
        loyaltyPointsMonth: json["LoyaltyPoints_Month"],
        loyaltyPointsTodaySlot: json["LoyaltyPoints_Today_Slot"],
        loyaltyPointsTodayRltb: json["LoyaltyPoints_Today_RLTB"],
    );

    Map<String, dynamic> toJson() => {
        "PreferredName": preferredName,
        "Number": number,
        "TierName": tierName,
        "DateOfBirth": dateOfBirth.toIso8601String(),
        "LoyaltyPoints": loyaltyPoints,
        "LoyaltyPoints_Current": loyaltyPointsCurrent,
        "LoyaltyPoints_Today": loyaltyPointsToday,
        "LoyaltyPoints_Week": loyaltyPointsWeek,
        "LoyaltyPoints_Month": loyaltyPointsMonth,
        "LoyaltyPoints_Today_Slot": loyaltyPointsTodaySlot,
        "LoyaltyPoints_Today_RLTB": loyaltyPointsTodayRltb,
    };
}
