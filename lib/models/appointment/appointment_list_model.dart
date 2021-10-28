// To parse this JSON data, do
//
//     final myAppointmentListModel = myAppointmentListModelFromJson(jsonString);

import 'dart:convert';

MyAppointmentListModel myAppointmentListModelFromJson(String str) => MyAppointmentListModel.fromJson(json.decode(str));

String myAppointmentListModelToJson(MyAppointmentListModel data) => json.encode(data.toJson());

class MyAppointmentListModel {
  MyAppointmentListModel({
    this.data,
    this.message,
    this.statusCode,
  });

  Data data;
  String message;
  int statusCode;

  factory MyAppointmentListModel.fromJson(Map<String, dynamic> json) => MyAppointmentListModel(
    data: Data.fromJson(json["data"]),
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "statusCode": statusCode,
  };
}

class Data {
  Data({
    this.data,
    this.itemCount,
    this.lastPage,
    this.pageNo,
    this.pageSize,
    this.totalItems,
    this.totalPages,
  });

  List<AppointmentModel> data;
  int itemCount;
  bool lastPage;
  int pageNo;
  int pageSize;
  int totalItems;
  int totalPages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    data: List<AppointmentModel>.from(json["data"].map((x) => AppointmentModel.fromJson(x))),
    itemCount: json["itemCount"],
    lastPage: json["lastPage"],
    pageNo: json["pageNo"],
    pageSize: json["pageSize"],
    totalItems: json["totalItems"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "itemCount": itemCount,
    "lastPage": lastPage,
    "pageNo": pageNo,
    "pageSize": pageSize,
    "totalItems": totalItems,
    "totalPages": totalPages,
  };
}

class AppointmentModel {
  AppointmentModel({
    this.appointmentDate,
    this.doctorName,
    this.gender,
    this.isCompleted,
    this.isExpired,
    this.isPaid,
    this.patientAge,
    this.patientName,
    this.patientPhoneNo,
    this.patientProblem,
    this.paymentMethod,
    this.totalFee,
  });

  String appointmentDate;
  String doctorName;
  String gender;
  bool isCompleted;
  bool isExpired;
  bool isPaid;
  String patientAge;
  String patientName;
  String patientPhoneNo;
  String patientProblem;
  String paymentMethod;
  int totalFee;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => AppointmentModel(
    appointmentDate: json["appointmentDate"],
    doctorName: json["doctorName"],
    gender: json["gender"],
    isCompleted: json["isCompleted"],
    isExpired: json["isExpired"],
    isPaid: json["isPaid"],
    patientAge: json["patientAge"],
    patientName: json["patientName"],
    patientPhoneNo: json["patientPhoneNo"],
    patientProblem: json["patientProblem"],
    paymentMethod: json["paymentMethod"],
    totalFee: json["totalFee"],
  );

  Map<String, dynamic> toJson() => {
    "appointmentDate": appointmentDate,
    "doctorName": doctorName,
    "gender": gender,
    "isCompleted": isCompleted,
    "isExpired": isExpired,
    "isPaid": isPaid,
    "patientAge": patientAge,
    "patientName": patientName,
    "patientPhoneNo": patientPhoneNo,
    "patientProblem": patientProblem,
    "paymentMethod": paymentMethod,
    "totalFee": totalFee,
  };
}
