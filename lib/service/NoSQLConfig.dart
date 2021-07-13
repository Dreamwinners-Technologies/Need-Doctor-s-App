import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/service/DrugDetails.dart';
import 'package:path_provider/path_provider.dart';

class NoSQLConfig {
  NoSQLConfig();

  Future<void> saveDrugData() async {
    print("Entering Save Data");
    // var drugBox = await Hive.openBox("drugBox");
    // drugBox.close();
    var drugBox = await Hive.openBox<DrugDetails>("drugBox");

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

    List<DrugDetails> drug = drugBox.values.toList();
    print(drug.runtimeType);

    // a.forEach((element) {
    //   print(element);
    //   DrugDetails drugDetails = element.
    //   // drug.add(element.toString());
    // });

    print(drug.length);

    print(drug[0].name);

    print("Exiting Save Data");
  }

  List _inventoryList = <DrugDetails>[];

  List get inventoryList => _inventoryList;

  getItem() async {
    print("Entering read Data");
    var drugBox = await Hive.openBox("drugBox");

    _inventoryList = drugBox.values.toList();

    print("Exiting read Data");
  }

  Future<void> save50Data() async {
    print("Entering Save Data");
    var drugBox = await Hive.openBox<DrugDetails>("drugBoxTest2");

    if (drugBox.isEmpty) {
      print("Is Empty");
      DrugListResponse drugListResponse =
          await getDrugList(name: null, pageNo: 0, pageSize: 50);

      List<DrugDetails> drugDetailsList = [];
      for (DrugModelList drugModel in drugListResponse.drugModelList) {
        DrugDetails drugDetails = DrugDetails(
          administration: drugModel.administration, adultDose: drugModel.adultDose, brandName: drugModel.brandName, childDose: drugModel.childDose,
          contraindications: drugModel.contraindications, drugId: drugModel.drugId, generic: drugModel.generic, indications: drugModel.indications,
          interaction: drugModel.interaction, modeOfAction: drugModel.modeOfAction, name: drugModel.name, packSize: drugModel.packSize,
          packSizeAndPrice: drugModel.packSizeAndPrice, precautionsAndWarnings: drugModel.precautionsAndWarnings,
          pregnancyAndLactation: drugModel.pregnancyAndLactation, renalDose: drugModel.renalDose, sideEffects: drugModel.sideEffects,
          therapeuticClass: drugModel.therapeuticClass, type: drugModel.type
        );

        drugDetailsList.add(drugDetails);
      }

      drugBox.addAll(drugDetailsList);
      print("Data Saved");
    }
    else {
      print("Already Saved");
    }
  }
}
