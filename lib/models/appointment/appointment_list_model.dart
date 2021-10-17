// To parse this JSON data, do
//
//     final myAppointmentListModel = myAppointmentListModelFromJson(jsonString);

import 'dart:convert';

MyAppointmentListModel myAppointmentListModelFromJson(String str) =>
    MyAppointmentListModel.fromJson(json.decode(str));

String myAppointmentListModelToJson(MyAppointmentListModel data) =>
    json.encode(data.toJson());

class MyAppointmentListModel {
  MyAppointmentListModel({
    this.data,
    this.message,
    this.statusCode,
  });

  AppointmentResponse data;
  String message;
  int statusCode;

  factory MyAppointmentListModel.fromJson(Map<String, dynamic> json) =>
      MyAppointmentListModel(
        data: AppointmentResponse.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "statusCode": statusCode,
      };
}

class AppointmentResponse {
  AppointmentResponse({
    this.data,
    this.itemCount,
    this.lastPage,
    this.pageNo,
    this.pageSize,
    this.totalItems,
    this.totalPages,
  });

  List<AppointmentList> data;
  int itemCount;
  bool lastPage;
  int pageNo;
  int pageSize;
  int totalItems;
  int totalPages;

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      AppointmentResponse(
        data: List<AppointmentList>.from(
            json["data"].map((x) => AppointmentList.fromJson(x))),
        itemCount: json["itemCount"],
        lastPage: json["lastPage"],
        pageNo: json["pageNo"],
        pageSize: json["pageSize"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<AppointmentList>.from(data.map((x) => x.toJson())),
        "itemCount": itemCount,
        "lastPage": lastPage,
        "pageNo": pageNo,
        "pageSize": pageSize,
        "totalItems": totalItems,
        "totalPages": totalPages,
      };
}

class AppointmentList {
  AppointmentList({
    this.appointmentDate,
    this.createdAt,
    this.createdBy,
    this.doctorsFee,
    this.gender,
    this.id,
    this.isCompleted,
    this.isExpired,
    this.isPaid,
    this.patientAddress,
    this.patientAge,
    this.patientName,
    this.patientPhoneNo,
    this.patientProblem,
    this.paymentMethod,
    this.prescription,
    this.totalFee,
    this.updatedAt,
    this.updatedBy,
  });

  String appointmentDate;
  int createdAt;
  String createdBy;
  int doctorsFee;
  String gender;
  String id;
  bool isCompleted;
  bool isExpired;
  bool isPaid;
  int otherFees;
  String patientAddress;
  String patientAge;
  String patientName;
  String patientPhoneNo;
  String patientProblem;
  String paymentMethod;
  Prescription prescription;
  int totalFee;
  int updatedAt;
  String updatedBy;

  factory AppointmentList.fromJson(Map<String, dynamic> json) =>
      AppointmentList(
        appointmentDate: json["appointmentDate"],
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        doctorsFee: json["doctorsFee"],
        gender: json["gender"],
        id: json["id"],
        isCompleted: json["isCompleted"],
        isExpired: json["isExpired"],
        isPaid: json["isPaid"],
        patientAddress: json["patientAddress"],
        patientAge: json["patientAge"],
        patientName: json["patientName"],
        patientPhoneNo: json["patientPhoneNo"],
        patientProblem: json["patientProblem"],
        paymentMethod: json["paymentMethod"],
        prescription: Prescription.fromJson(json["prescription"]),
        totalFee: json["totalFee"],
        updatedAt: json["updatedAt"],
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "appointmentDate": appointmentDate,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "doctorsFee": doctorsFee,
        "gender": gender,
        "id": id,
        "isCompleted": isCompleted,
        "isExpired": isExpired,
        "isPaid": isPaid,
        "patientAddress": patientAddress,
        "patientAge": patientAge,
        "patientName": patientName,
        "patientPhoneNo": patientPhoneNo,
        "patientProblem": patientProblem,
        "paymentMethod": paymentMethod,
        "prescription": prescription.toJson(),
        "totalFee": totalFee,
        "updatedAt": updatedAt,
        "updatedBy": updatedBy,
      };
}

class Prescription {
  Prescription({
    this.advice,
    this.bloodPressure,
    this.chiefComplaints,
    this.diagnosis,
    this.id,
    this.investigationAdvice,
    this.medicines,
    this.onExamination,
    this.pulse,
    this.temperature,
  });

  List<String> advice;
  int bloodPressure;
  List<String> chiefComplaints;
  List<String> diagnosis;
  String id;
  List<String> investigationAdvice;
  List<Medicine> medicines;
  List<String> onExamination;
  int pulse;
  int temperature;

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        advice: List<String>.from(json["advice"].map((x) => x)),
        bloodPressure: json["bloodPressure"],
        chiefComplaints:
            List<String>.from(json["chiefComplaints"].map((x) => x)),
        diagnosis: List<String>.from(json["diagnosis"].map((x) => x)),
        id: json["id"],
        investigationAdvice:
            List<String>.from(json["investigationAdvice"].map((x) => x)),
        medicines: List<Medicine>.from(
            json["medicines"].map((x) => Medicine.fromJson(x))),
        onExamination: List<String>.from(json["onExamination"].map((x) => x)),
        pulse: json["pulse"],
        temperature: json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "advice": List<dynamic>.from(advice.map((x) => x)),
        "bloodPressure": bloodPressure,
        "chiefComplaints": List<dynamic>.from(chiefComplaints.map((x) => x)),
        "diagnosis": List<dynamic>.from(diagnosis.map((x) => x)),
        "id": id,
        "investigationAdvice":
            List<dynamic>.from(investigationAdvice.map((x) => x)),
        "medicines": List<dynamic>.from(medicines.map((x) => x.toJson())),
        "onExamination": List<dynamic>.from(onExamination.map((x) => x)),
        "pulse": pulse,
        "temperature": temperature,
      };
}

class Medicine {
  Medicine({
    this.brand,
    this.dose,
    this.duration,
    this.id,
    this.instruction,
    this.note,
  });

  String brand;
  String dose;
  String duration;
  int id;
  String instruction;
  String note;

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        brand: json["brand"],
        dose: json["dose"],
        duration: json["duration"],
        id: json["id"],
        instruction: json["instruction"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "brand": brand,
        "dose": dose,
        "duration": duration,
        "id": id,
        "instruction": instruction,
        "note": note,
      };
}
