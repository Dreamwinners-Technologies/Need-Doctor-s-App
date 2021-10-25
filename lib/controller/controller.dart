import 'package:get/get.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';

class StateController extends GetxController {
  //for payment
  var selectedPaymentType = 'nothing'.obs;
  var doctorName = "doctor".obs;
  var doctorID = "id".obs;
  Rx<CardInfoResponse> doctorinfo =CardInfoResponse().obs ;
}
