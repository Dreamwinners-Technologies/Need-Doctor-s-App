import 'dart:io';

import 'package:need_doctors/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class BoxStoreDrug {
  static final BoxStoreDrug _boxStore = BoxStoreDrug._internal();

  factory BoxStoreDrug() {
    return _boxStore;
  }

  BoxStoreDrug._internal();

  // ignore: avoid_init_to_null
  Store _store = null;

  Future<Store> getDrugStore() async {
    /// Returns an instance of the Store
    Directory dir = await getApplicationDocumentsDirectory();

    if (_store == null) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/drugobjectbox');
    }

    return _store;
  }
}

class BoxStoreAmbulance {
  static final BoxStoreAmbulance _boxStore = BoxStoreAmbulance._internal();

  factory BoxStoreAmbulance() {
    return _boxStore;
  }

  BoxStoreAmbulance._internal();

  // ignore: avoid_init_to_null
  Store _store = null;

  Future<Store> getAmbulanceStore() async {
    /// Returns an instance of the Store
    Directory dir = await getApplicationDocumentsDirectory();

    if (_store == null) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/ambulanceobjectbox');
    }

    return _store;
  }
}

class BoxStoreVisitingCard {
  static final BoxStoreVisitingCard _boxStore = BoxStoreVisitingCard._internal();

  factory BoxStoreVisitingCard() {
    return _boxStore;
  }

  BoxStoreVisitingCard._internal();

  // ignore: avoid_init_to_null
  Store _store = null;

  Future<Store> getVisitingCardStore() async {
    /// Returns an instance of the Store
    Directory dir = await getApplicationDocumentsDirectory();

    if (_store == null) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/visitingcardobjectbox');
    }

    return _store;
  }
}

/*class BoxStoreMedicine {
  static final BoxStoreMedicine _boxStore = BoxStoreMedicine._internal();

  factory BoxStoreMedicine() {
    return _boxStore;
  }

  BoxStoreMedicine._internal();

  // ignore: avoid_init_to_null
  Store _store = null;

  Future<Store> getMedicineStore() async {
    /// Returns an instance of the Store
    Directory dir = await getApplicationDocumentsDirectory();

    if (_store == null) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/medicine-object-box');
    }

    return _store;
  }
}*/

class BoxStoreGeneric {
  static final BoxStoreGeneric _boxStore = BoxStoreGeneric._internal();

  factory BoxStoreGeneric() {
    return _boxStore;
  }

  BoxStoreGeneric._internal();

  // ignore: avoid_init_to_null
  Store _store = null;

  Future<Store> getGenericStore() async {
    /// Returns an instance of the Store
    Directory dir = await getApplicationDocumentsDirectory();

    if (_store == null) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/generic-object-box');
    }

    return _store;
  }
}

class BoxStoreMedicine {
  static final BoxStoreMedicine _boxStore = BoxStoreMedicine._internal();

  factory BoxStoreMedicine() {
    return _boxStore;
  }

  BoxStoreMedicine._internal();

  // ignore: avoid_init_to_null
  Store _store = null;

  Future<Store> getMedicineStore() async {
    /// Returns an instance of the Store
    Directory dir = await getApplicationDocumentsDirectory();

    if (_store == null) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/medicines-object-box');
    }

    return _store;
  }
}