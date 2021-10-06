
// To parse this JSON data, do
//
//     final appointmentModel = appointmentModelFromJson(jsonString);

import 'dart:convert';

AppointmentModel appointmentModelFromJson(String str) => AppointmentModel.fromJson(json.decode(str));

String appointmentModelToJson(AppointmentModel data) => json.encode(data.toJson());

class AppointmentModel {
    AppointmentModel({
        this.appointmentDate,
        this.doctorId,
        this.gender,
        this.patientAddress,
        this.patientAge,
        this.patientName,
        this.patientPhoneNo,
        this.patientProblem,
        this.paymentMethod,
    });

    String appointmentDate;
    String doctorId;
    String gender;
    String patientAddress;
    String patientAge;
    String patientName;
    String patientPhoneNo;
    String patientProblem;
    String paymentMethod;

    factory AppointmentModel.fromJson(Map<String, dynamic> json) => AppointmentModel(
        appointmentDate: json["appointmentDate"],
        doctorId: json["doctorId"],
        gender: json["gender"],
        patientAddress: json["patientAddress"],
        patientAge: json["patientAge"],
        patientName: json["patientName"],
        patientPhoneNo: json["patientPhoneNo"],
        patientProblem: json["patientProblem"],
        paymentMethod: json["paymentMethod"],
    );

    Map<String, dynamic> toJson() => {
        "appointmentDate": appointmentDate,
        "doctorId": doctorId,
        "gender": gender,
        "patientAddress": patientAddress,
        "patientAge": patientAge,
        "patientName": patientName,
        "patientPhoneNo": patientPhoneNo,
        "patientProblem": patientProblem,
        "paymentMethod": paymentMethod,
    };
}
