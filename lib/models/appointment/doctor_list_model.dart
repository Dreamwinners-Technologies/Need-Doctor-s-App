// To parse this JSON data, do
//
//     final doctorListModel = doctorListModelFromJson(jsonString);

import 'dart:convert';

DoctorListModel doctorListModelFromJson(String str) => DoctorListModel.fromJson(json.decode(str));

String doctorListModelToJson(DoctorListModel data) => json.encode(data.toJson());

class DoctorListModel {
    DoctorListModel({
        this.data,
        this.message,
        this.statusCode,
    });

    DoctorResponse data;
    String message;
    int statusCode;

    factory DoctorListModel.fromJson(Map<String, dynamic> json) => DoctorListModel(
        data: DoctorResponse.fromJson(json["data"]),
        message: json["message"],
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "statusCode": statusCode,
    };
}

class DoctorResponse {
    DoctorResponse({
        this.data,
        this.itemCount,
        this.lastPage,
        this.pageNo,
        this.pageSize,
        this.totalItems,
        this.totalPages,
    });

    List<DoctorList> data;
    int itemCount;
    bool lastPage;
    int pageNo;
    int pageSize;
    int totalItems;
    int totalPages;

    factory DoctorResponse.fromJson(Map<String, dynamic> json) => DoctorResponse(
        data: List<DoctorList>.from(json["data"].map((x) => DoctorList.fromJson(x))),
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

class DoctorList {
    DoctorList({
        this.doctorName,
        this.doctorPrescription,
        this.id,
        this.phoneNo,
        this.specializations,
        this.userName,
    });

    String doctorName;
    DoctorPrescription doctorPrescription;
    String id;
    String phoneNo;
    String specializations;
    String userName;

    factory DoctorList.fromJson(Map<String, dynamic> json) => DoctorList(
        doctorName: json["doctorName"],
        doctorPrescription: DoctorPrescription.fromJson(json["doctorPrescription"]),
        id: json["id"],
        phoneNo: json["phoneNo"],
        specializations: json["specializations"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "doctorName": doctorName,
        "doctorPrescription": doctorPrescription.toJson(),
        "id": id,
        "phoneNo": phoneNo,
        "specializations": specializations,
        "userName": userName,
    };
}

class DoctorPrescription {
    DoctorPrescription({
        this.appointmentPerDay,
        this.createdAt,
        this.createdBy,
        this.doctorChamberAddress,
        this.fee,
        this.id,
        this.updatedAt,
        this.updatedBy,
    });

    int appointmentPerDay;
    int createdAt;
    String createdBy;
    String doctorChamberAddress;
    int fee;
    String id;
    int updatedAt;
    String updatedBy;

    factory DoctorPrescription.fromJson(Map<String, dynamic> json) => DoctorPrescription(
        appointmentPerDay: json["appointmentPerDay"],
        createdAt: json["createdAt"],
        createdBy: json["createdBy"],
        doctorChamberAddress: json["doctorChamberAddress"],
        fee: json["fee"],
        id: json["id"],
        updatedAt: json["updatedAt"],
        updatedBy: json["updatedBy"],
    );

    Map<String, dynamic> toJson() => {
        "appointmentPerDay": appointmentPerDay,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "doctorChamberAddress": doctorChamberAddress,
        "fee": fee,
        "id": id,
        "updatedAt": updatedAt,
        "updatedBy": updatedBy,
    };
}
