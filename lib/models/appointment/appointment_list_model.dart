// To parse this JSON data, do
//
//     final appointmentListModel = appointmentListModelFromJson(jsonString);

import 'dart:convert';

AppointmentListModel appointmentListModelFromJson(String str) => AppointmentListModel.fromJson(json.decode(str));

String appointmentListModelToJson(AppointmentListModel data) => json.encode(data.toJson());

class AppointmentListModel {
    AppointmentListModel({
        this.data,
        this.message,
        this.statusCode,
    });

    Data data;
    String message;
    int statusCode;

    factory AppointmentListModel.fromJson(Map<String, dynamic> json) => AppointmentListModel(
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

    List<AppointmentList> data;
    int itemCount;
    bool lastPage;
    int pageNo;
    int pageSize;
    int totalItems;
    int totalPages;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<AppointmentList>.from(json["data"].map((x) => AppointmentList.fromJson(x))),
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

class AppointmentList {
    AppointmentList({
        this.appointmentDate,
        this.appointmentId,
        this.createdOn,
        this.doctorName,
    });

    String appointmentDate;
    String appointmentId;
    int createdOn;
    String doctorName;

    factory AppointmentList.fromJson(Map<String, dynamic> json) => AppointmentList(
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
