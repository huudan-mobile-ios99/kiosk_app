// import 'dart:io';
// import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:kiosk_new/models/dateframe.dart';
import 'package:kiosk_new/models/status.dart';
import 'package:kiosk_new/models/status.range.dart';
import 'package:kiosk_new/models/status_short.dart';
import 'package:kiosk_new/utils/mystrings.api.dart';

class ServiceAPIs {
  Dio dio = Dio();
  Future postPointCardTrack(
      {id, today, today2, startWeek, endWeek, startMonth, endMonth,bool? isFullInfor}) async {
    Map<String, dynamic> body = {
      "id": id,
      "dateToday": today,
      "dateToday2": today2,
      "startDateWeek": startWeek,
      "endDateWeek": endWeek,
      "startDateMonth": startMonth,
      "endDateMonth": endMonth
    };
    final response = await dio.post(
     isFullInfor==true? StringUrlAPIs.point_cardtrack_fullinfor:StringUrlAPIs.point_cardtrack,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: const Duration(seconds: 10000),
        sendTimeout: const Duration(seconds: 10000),
        followRedirects: false, 
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    // print('response data from request: ${response.data}');
    return isFullInfor==true ? Status.fromJson(response.data) : StatusShort.fromJson(response.data);
  }




  Future postPointCardTrackRange({id, startDate, endDate}) async {
    Map<String, dynamic> body = {
      "id": id,
      "startDate": startDate,
      "endDate": endDate,
    };
    final response = await dio.post(
      StringUrlAPIs.point_cardtrack_range,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: const Duration(seconds: 10000),
        sendTimeout: const Duration(seconds: 10000),
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    // print('frame point where $id: ${response.data}');
    return StatusRange.fromJson(response.data);
  }

  Future createFeedBack({type, name, number, date, phone, email, note,type_name}) async {
    Map<String, dynamic> body = {
      "name": name,
      "date": date,
      "number": number,
      "note": note,
      "phone": phone,
      "email": email,
      "type": type,
						"type_name":type_name,
    };
    final response = await dio.post(
      StringUrlAPIs.create_feedBack,
      data: body,
      options: Options(
        contentType: Headers.jsonContentType,
        receiveTimeout: const Duration(seconds: 10000),
        sendTimeout: const Duration(seconds: 10000),
        followRedirects: false,
        validateStatus: (status) {
          return true;
        },
        headers: {
          'Content-type': 'application/json; charset=UTF-8',
        },
      ),
    );
    return response.data;
  }

  Future postPrint(
      // {url, cusName, cusNumber, cPoint, dPoint, wPoint, mPoint, fPoint,slPoint,rlPoint}
      {url,
      cusName,
      cusNumber,
      cPoint,
      dPoint,
      wPoint,
      mPoint,
      fPoint,
      slPoint,
      rlPoint,
      xPoint}) async {
    Map<String, dynamic> body = {
      "cusname": "$cusName",
      "cusnumber": "$cusNumber",
      "cpoint": "$cPoint",
      "dpoint": "$dPoint",
      "wpoint": "$wPoint",
      "mpoint": "$mPoint",
      "fpoint": "$fPoint",
      "slpoint": "$slPoint",
      "rlpoint": "$rlPoint",
      "xpoint": "$xPoint",
    };
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          contentType: Headers.jsonContentType,
          receiveTimeout: const Duration(seconds: 10000),
          sendTimeout: const Duration(seconds: 10000),
          followRedirects: false,
          validateStatus: (status) {
            return true;
          },
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },
        ),
      );
      // print('print data: ${response.data}');
      return response.data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        // print(e.response?.statusCode);
      } else {
        // print(e.message);
      }
    }
  }



    Future<DateFrameDataList> findDateFrameByNumber(number) async {
    final response = await dio.post(
      StringUrlAPIs.findDateFrame,
      data: {"number": number},
    );
    // print(response.data);
    return DateFrameDataList.fromJson(response.data);
    
  }
}


