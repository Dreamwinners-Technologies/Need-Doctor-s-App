import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/service/DrugDetails.dart';
import 'package:need_doctors/service/NotificationService.dart';
import 'package:need_doctors/service/store_init.dart';

final storage = FlutterSecureStorage();

class NoSQLConfig {
  NoSQLConfig();

  Future<void> saveDrugData() async {
    print("Entering Save Data");

    // print(0);
    // DrugDetails drugDetails = DrugDetails(name: "Ace 2", generic: "Peracitamol", packSizeAndPrice: "120Tk");
    //
    // print(0);
    // drugBox.add(drugDetails);
    //
    // drugDetails = DrugDetails(name: "Napa", generic: "Peracitamol", packSizeAndPrice: "120Tk");

    // drugBox.add(drugDetails);
    // print(0);
    // drugDetails.save();
    //
    // print(0);
    // print(drugDetails.name);

    // List<DrugDetails> drug = drugBox.values.toList();
    // print(drug.runtimeType);

    // a.forEach((element) {
    //   print(element);
    //   DrugDetails drugDetails = element.
    //   // drug.add(element.toString());
    // });

    // print(drug.length);
    //
    // print(drug[0].name);

    print("Exiting Save Data");
  }

  Future<void> save50Data() async {
    print("Entering Save Data");
    BoxStore boxStore = BoxStore();
    var store = await boxStore.getStore();
    var box = store.box<DrugDetails>();

    if (box.isEmpty()) {
      print("Is Empty");

      DrugListResponse drugListResponse =
          await getDrugList(name: null, pageNo: 0, pageSize: 50);

      List<DrugDetails> drugDetailsList = [];
      for (DrugModelList drugModel in drugListResponse.drugModelList) {
        DrugDetails drugDetails = DrugDetails(
            administration: drugModel.administration,
            adultDose: drugModel.adultDose,
            brandName: drugModel.brandName,
            childDose: drugModel.childDose,
            contraindications: drugModel.contraindications,
            drugId: drugModel.drugId,
            generic: drugModel.generic,
            indications: drugModel.indications,
            interaction: drugModel.interaction,
            modeOfAction: drugModel.modeOfAction,
            name: drugModel.name.toUpperCase(),
            packSize: drugModel.packSize,
            packSizeAndPrice: drugModel.packSizeAndPrice,
            precautionsAndWarnings: drugModel.precautionsAndWarnings,
            pregnancyAndLactation: drugModel.pregnancyAndLactation,
            renalDose: drugModel.renalDose,
            sideEffects: drugModel.sideEffects,
            therapeuticClass: drugModel.therapeuticClass,
            type: drugModel.type);

        drugDetailsList.add(drugDetails);
      }

      box.putMany(drugDetailsList);
      print("Data Saved");
    } else {
      print("Already Saved");
    }

    // store.close();
  }

  Future<void> saveData() async {
    print("Entering Save Data");

    DrugListResponse drugListResponse;

    try{
      drugListResponse =
      await getDrugList(name: null, pageNo: 0, pageSize: 5);
    }
    on SocketException catch (_) {
      sendToast("No Internet Connection. Please connect Internet first.");
      print('not connected');
      throw new SocketException('not connected');
    }

    BoxStore boxStore = BoxStore();
    var store = await boxStore.getStore();
    var box = store.box<DrugDetails>();

    box.removeAll();
    storage.write(key: "isNewApp", value: "true");

    // if (box.isEmpty()) {
    print("Is Empty");

    NotificationService notificationService = NotificationService();

    notificationService.sendNotification("Data Sync Started", "Medicine Data is starts downloading from internet");

    int pageNo = 0;

    do {
      List<DrugDetails> drugDetailsList = [];

      print(pageNo);

      try{
        drugListResponse =
        await getDrugList(name: null, pageNo: pageNo, pageSize: 250);
      }
      on SocketException catch (_) {
        // store.close();
        sendToast("No Internet Connection. Please connect Internet first.");
        print('not connected');

        throw new SocketException('not connected');
      }
      catch (error) {
        // store.close();
        sendToast("No Internet Connection. Please connect Internet first.");
        print('not connected');

        throw new SocketException('not connected');
      }


      for (DrugModelList drugModel in drugListResponse.drugModelList) {
        DrugDetails drugDetails = DrugDetails(
            administration: drugModel.administration,
            adultDose: drugModel.adultDose,
            brandName: drugModel.brandName,
            childDose: drugModel.childDose,
            contraindications: drugModel.contraindications,
            drugId: drugModel.drugId,
            generic: drugModel.generic,
            indications: drugModel.indications,
            interaction: drugModel.interaction,
            modeOfAction: drugModel.modeOfAction,
            name: drugModel.name.toUpperCase(),
            packSize: drugModel.packSize,
            packSizeAndPrice: drugModel.packSizeAndPrice,
            precautionsAndWarnings: drugModel.precautionsAndWarnings,
            pregnancyAndLactation: drugModel.pregnancyAndLactation,
            renalDose: drugModel.renalDose,
            sideEffects: drugModel.sideEffects,
            therapeuticClass: drugModel.therapeuticClass,
            type: drugModel.type);

        drugDetailsList.add(drugDetails);
      }

      box.putMany(drugDetailsList);

      pageNo++;

      print(drugListResponse.lastPage);
      print(drugListResponse.pageNo);
      print(drugListResponse.totalItem);
    } while (!drugListResponse.lastPage);

    print("Data Saved");
    // } else {
    //   print("Already Saved");
    // }

    // store.close();

    storage.write(key: "isNewApp", value: "false");

    notificationService.sendNotification("Data Syncing Finished", "Medicine Data downloaded from internet");
  }
}
