import 'package:get/get.dart';
import 'package:need_doctors/service/visiting_card_list.dart';

class StateController extends GetxController {
  //for payment
  var selectedPaymentType = 'nothing'.obs;
  var doctorName = "doctor".obs;
  var doctorID = "id".obs;
  Rx<CardInfoResponseList> doctorinfo = CardInfoResponseList().obs;
}
