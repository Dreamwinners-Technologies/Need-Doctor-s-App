// To parse this JSON data, do
//
//     final prescriptionModel = prescriptionModelFromJson(jsonString);

import 'dart:convert';

PrescriptionModel prescriptionModelFromJson(String str) => PrescriptionModel.fromJson(json.decode(str));

String prescriptionModelToJson(PrescriptionModel data) => json.encode(data.toJson());

class PrescriptionModel {
    PrescriptionModel({
        this.data,
        this.message,
        this.statusCode,
    });

    Data data;
    String message;
    int statusCode;

    factory PrescriptionModel.fromJson(Map<String, dynamic> json) => PrescriptionModel(
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

    List<Datum> data;
    int itemCount;
    bool lastPage;
    int pageNo;
    int pageSize;
    int totalItems;
    int totalPages;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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

class Datum {
    Datum({
        this.appointmentDate,
        this.appointmentId,
        this.createdOn,
        this.doctorName,
    });

    String appointmentDate;
    String appointmentId;
    int createdOn;
    String doctorName;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        appointmentDate: json["appointmentDate"],
        appointmentId: json["appointmentId"],
        createdOn: json["createdOn"],
        doctorName: json["doctorName"],
    );

    Map<String, dynamic> toJson() => {
        "appointmentDate": appointmentDate,
        "appointmentId": appointmentId,
        "createdOn": createdOn,
        "doctorName": doctorName,
    };
}
