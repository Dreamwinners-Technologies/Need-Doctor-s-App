import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/objectbox.g.dart';
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

  Future<void> saveData(bool isNew) async {
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

    if(isNew){
      box.removeAll();
    }


    storage.write(key: "isNewApp", value: "true");

    // if (box.isEmpty()) {
    print("Is Empty");

    NotificationService notificationService = NotificationService();

    notificationService.sendNotification("Data Sync Started", "Medicine Data is starts downloading from internet");

    String previousPage = await storage.read(key: "pageFetched");

    int pageNo;
    if(previousPage == null){
      pageNo = 0;
    }
    else {
      print(previousPage);
      pageNo = int.parse(previousPage);
    }



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
            generic: drugModel.generic.toUpperCase(),
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

      await storage.write(key: "pageFetched", value: pageNo.toString());
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
    await storage.delete(key: "pageFetched");

    notificationService.sendNotification("Data Syncing Finished", "Medicine Data downloaded from internet");
  }

  Future<List<String>> getGenerics(String generic) async {

    BoxStore boxStore = BoxStore();
    print(0);
    var store = await boxStore.getStore();
    print(1);

    // var store = openStore();

    // await noSQLConfig.save50Data(store);
    var box = store.box<DrugDetails>();

    final query = (box.query(DrugDetails_.generic.contains(generic.toUpperCase()))
      ..order(DrugDetails_.generic, flags: Order.caseSensitive))
        .build();
    //
    //
    // count = query.count();
    //
    // query
    //   ..limit = 10
    //   ..offset = (pageKey * 10);
    //
    // List<DrugDetails> drugDetailsList = query.find();

    // final query = box.query().build();

    PropertyQuery<String> pq = query.property(DrugDetails_.generic);
    pq.distinct = true;

    List<String> generics = pq.find();

    // print("hi");
    // print(generics.length);
    // print(generics[0]);

    query.close();

    generics.sort();

    return generics;
  }

}
