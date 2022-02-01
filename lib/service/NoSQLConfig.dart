import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:need_doctors/Constant/string/app_info.dart';
import 'package:need_doctors/Widgets/ToastNotification.dart';
import 'package:need_doctors/models/Card/CardListResponse.dart';
import 'package:need_doctors/models/Drug/DrugListResponse.dart';
import 'package:need_doctors/models/ambulance/get_ambulance_model.dart';
import 'package:need_doctors/networking/CardNetwork.dart';
import 'package:need_doctors/networking/DrugNetwork.dart';
import 'package:need_doctors/networking/ambulance_service/ambulance_service.dart';
import 'package:need_doctors/objectbox.g.dart';
import 'package:need_doctors/service/DrugDetails.dart';
import 'package:need_doctors/service/NotificationService.dart';
import 'package:need_doctors/service/list_of_ambulance.dart';
import 'package:need_doctors/service/store_init.dart';
import 'package:need_doctors/service/visiting_card_list.dart';

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
    BoxStoreDrug boxStore = BoxStoreDrug();
    var store = await boxStore.getDrugStore();
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

  //drug data save
  Future<void> saveData(bool isNew) async {
    print("Entering Save Data");

    DrugListResponse drugListResponse;

    try {
      drugListResponse = await getDrugList(name: null, pageNo: 0, pageSize: 5);
    } on SocketException catch (_) {
      sendToast("No Internet Connection. Please connect Internet first.");
      print('not connected');
      throw new SocketException('not connected');
    }

    BoxStoreDrug boxStore = BoxStoreDrug();
    var store = await boxStore.getDrugStore();
    var box = store.box<DrugDetails>();

    if (isNew) {
      box.removeAll();
    }

    storage.write(key: "isNewApp", value: "true");

    // if (box.isEmpty()) {
    print("Is Empty");

    NotificationService notificationService = NotificationService();

    String previousPage = await storage.read(key: "pageFetched");

    String vData = await storage.read(key: ISDoctorCardDATASAVE);
    String mData = await storage.read(key: 'isNewApp');

    if (mData != 'false' && vData != 'false') {
      notificationService.sendNotification(
          "Data Sync Continue", "App Data continue downloading from internet");
    } else if (mData != 'false' && vData == 'false') {
      notificationService.sendNotification("Data Sync Continue",
          "Doctor cards are continue downloading from internet");
    }

    int pageNo;
    if (previousPage == null) {
      pageNo = 0;
      notificationService.sendNotification("Data Sync Started",
          "Medicine Data is started downloading from internet");
    } else {
      print(previousPage);
      pageNo = int.parse(previousPage) + 1;
      notificationService.sendNotification("Data Sync Continued",
          "Medicine Data is resumed downloading from internet");
    }

    do {
      List<DrugDetails> drugDetailsList = [];

      print(pageNo);

      try {
        drugListResponse =
            await getDrugList(name: null, pageNo: pageNo, pageSize: 250);
      } on SocketException catch (_) {
        // store.close();
        sendToast("No Internet Connection. Please connect Internet first.");
        print('not connected');

        throw new SocketException('not connected');
      } catch (error) {
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

    String medicineData = await storage.read(key: 'isNewApp');
    String visitingcardData = await storage.read(key: ISDoctorCardDATASAVE);

    if (medicineData == 'false' && visitingcardData == 'false') {
      notificationService.sendNotification("Data Syncing Finished",
          "Congress all data successfully downloaded from Internet");
    }
  }

  //ambulance data save
  Future<void> saveAmbulanceData(bool isNew) async {
    print("Entering  Save ambulance Data");

    GetAmbulanceModel getAmbulanceResponse;

    try {
      getAmbulanceResponse = await getAmbulanceList(pageNo: 0, pageSize: 5);
    } on SocketException catch (_) {
      sendToast("No Internet Connection. Please connect Internet first.");
      print('not connected');
      throw new SocketException('not connected');
    }

    BoxStoreAmbulance boxStore = BoxStoreAmbulance();
    var store = await boxStore.getAmbulanceStore();
    var box = store.box<ListOfAmbulance>();

    if (isNew) {
      box.removeAll();
    }

    storage.write(key: ISAMBULANCEDATASAVE, value: "true");

    // if (box.isEmpty()) {
    print("Is Empty");

    NotificationService notificationService = NotificationService();

    String previousPage = await storage.read(key: fetrchPrevAmbulancePage);
    if (previousPage != '0' || previousPage != null) {
      notificationService.sendNotification("Data Sync Continue",
          "Ambulance Data  continue downloading from internet");
    } else {
      notificationService.sendNotification(
          "Data Sync Started", "All Data is starts downloading from internet");
    }

    int pageNo;
    if (previousPage == null) {
      pageNo = 0;
    } else {
      print(previousPage);
      pageNo = int.parse(previousPage) + 1;
    }

    do {
      List<ListOfAmbulance> listOfAmbulance = [];

      print(pageNo);

      try {
        getAmbulanceResponse =
            await getAmbulanceList(pageNo: pageNo, pageSize: 250);
      } on SocketException catch (_) {
        // store.close();
        sendToast("No Internet Connection. Please connect Internet first.");
        print('not connected');

        throw new SocketException('not connected');
      } catch (error) {
        // store.close();
        sendToast("No Internet Connection. Please connect Internet first.");
        print('not connected');

        throw new SocketException('not connected');
      }

      for (AmbulanceList item in getAmbulanceResponse.data) {
        ListOfAmbulance ambulanceItem = ListOfAmbulance(
            uuid: item.uuid,
            createdBy: item.createdBy,
            createdAt: item.createdAt,
            updatedBy: item.updatedBy,
            updatedAt: item.updatedAt,
            driverName: item.driverName,
            phoneNo: item.phoneNo,
            title: item.title,
            division: item.division,
            district: item.district,
            upazila: item.upazila,
            address: item.address?.toUpperCase(),
            isApproved: item.isApproved);

/*          BoxStoreAmbulance boxStored = BoxStoreAmbulance();
          // print(1);
          var stored = await boxStored.getAmbulanceStore();

          var boxd = stored.box<ListOfAmbulance>();
          List<ListOfAmbulance> listd = boxd.getAll();

          if (listd.length == getAmbulanceResponse.data.length) {
            print('All ambulance data saved');
          } else {
            print('new data found');

            for (var item in getAmbulanceResponse.data) {
              listd.where((element) {
                if (item.uuid != element.uuid) {
                  listOfAmbulance.add(ambulanceItem);
                } else {
                  print(item.address + ' Already available in list');
                }
                return true;
              });
            }
          }
        }*/
        listOfAmbulance.add(ambulanceItem);
        box.putMany(listOfAmbulance);

        await storage.write(
            key: fetrchPrevAmbulancePage, value: pageNo.toString());
        pageNo++;

        print(getAmbulanceResponse.lastPage);
        print(getAmbulanceResponse.pageNo);
        print(getAmbulanceResponse.totalItems);
      }
    } while (!getAmbulanceResponse.lastPage);

    print("Ambulance Data Saved");
    // } else {
    //   print("Already Saved");
    // }

    // store.close();

    notificationService.sendNotification("Data Syncing Finished",
        "Congress all ambulance data successfully downloaded from Internet");

    storage.write(key: ISAMBULANCEDATASAVE, value: "false");
    await storage.delete(key: fetrchPrevAmbulancePage);

    // notificationService.sendNotification(
    //     "Data Syncing Finished", "Medicine Data downloaded from internet");
    //saveData(false);
  }

  //visiting card save
  Future<void> saveVisitingCardData(bool isNew) async {
    print("Entering Save visiting card Data");

    CardListResponse visitingCardResponse;

    try {
      visitingCardResponse = await getCardList(
          name: null, district: null, thana: null, pageNo: 0, pageSize: 5);
    } on SocketException catch (_) {
      sendToast("No Internet Connection. Please connect Internet first.");
      print('not connected');
      throw new SocketException('not connected');
    }

    BoxStoreVisitingCard boxStore = BoxStoreVisitingCard();
    var store = await boxStore.getVisitingCardStore();
    var box = store.box<CardInfoResponseList>();

    if (isNew) {
      box.removeAll();
    }

    storage.write(key: ISDoctorCardDATASAVE, value: "true");

    // if (box.isEmpty()) {
    print("Is Empty");

    NotificationService notificationService = NotificationService();

    String previousPage = await storage.read(key: fetrchPrevDoctorcardPage);
    String vData = await storage.read(key: ISDoctorCardDATASAVE);
    String mData = await storage.read(key: 'isNewApp');

    if (vData != 'false' && mData != 'false') {
      notificationService.sendNotification(
          "Data Sync Continue", "App Data continue downloading from internet");
    } else if (vData != 'false' && mData == 'false') {
      notificationService.sendNotification("Data Sync Continue",
          "Visiting cards are continue downloading from internet");
    }

    int pageNo;
    if (previousPage == null) {
      pageNo = 0;
    } else {
      print(previousPage);
      pageNo = int.parse(previousPage);
    }

    do {
      List<CardInfoResponseList> visitingcardDetailsList = [];

      print(pageNo);

      try {
        visitingCardResponse = await getCardList(
            name: null,
            district: null,
            thana: null,
            pageNo: pageNo,
            pageSize: 250);
      } on SocketException catch (_) {
        // store.close();
        sendToast("No Internet Connection. Please connect Internet first.");
        print('not connected');

        throw new SocketException('not connected');
      } catch (error) {
        // store.close();
        sendToast("No Internet Connection. Please connect Internet first.");
        print('not connected');

        throw new SocketException('not connected');
      }

      for (CardInfoResponse visitingCardModel
          in visitingCardResponse.cardInfoResponseList) {
        CardInfoResponseList visitingcardDetails = CardInfoResponseList(
            addedBy: visitingCardModel.addedBy,
            appointmentNo: visitingCardModel.appointmentNo,
            cardImageUrl: visitingCardModel.cardImageUrl,
            cardid: visitingCardModel.id,
            cardOcrData: visitingCardModel.cardOcrData,
            district: visitingCardModel.district,
            name: visitingCardModel.name,
            nameSearch: visitingCardModel.name.toLowerCase(),
            thana: visitingCardModel.thana,
            specialization: visitingCardModel.specialization,
            specializationString:
                visitingCardModel.specialization.toString().toLowerCase());

        visitingcardDetailsList.add(visitingcardDetails);
      }

      box.putMany(visitingcardDetailsList);

      await storage.write(
          key: fetrchPrevDoctorcardPage, value: pageNo.toString());
      pageNo++;

      print(visitingCardResponse.lastPage);
      print(visitingCardResponse.pageNo);
      print(visitingCardResponse.totalItem);
    } while (!visitingCardResponse.lastPage);

    print("Visiting card Data Saved");
    // } else {
    //   print("Already Saved");
    // }

    // store.close();

    storage.write(key: ISDoctorCardDATASAVE, value: "false");
    await storage.delete(key: fetrchPrevDoctorcardPage);

    String medicineData = await storage.read(key: 'isNewApp');
    String visitingcardData = await storage.read(key: ISDoctorCardDATASAVE);

    if (medicineData == 'false' && visitingcardData == 'false') {
      notificationService.sendNotification("Data Syncing Finished",
          "Congress all data successfully downloaded from Internet");
    }
  }

  Future<List<String>> getGenerics(String generic) async {
    BoxStoreDrug boxStore = BoxStoreDrug();
    print(0);
    var store = await boxStore.getDrugStore();
    print(1);

    // var store = openStore();

    // await noSQLConfig.save50Data(store);
    var box = store.box<DrugDetails>();

    final query =
        (box.query(DrugDetails_.generic.startsWith(generic.toUpperCase()))
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
