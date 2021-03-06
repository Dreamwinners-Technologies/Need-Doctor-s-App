import 'dart:io';

import 'package:need_doctors/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class BoxStore {
  static final BoxStore _boxStore = BoxStore._internal();

  factory BoxStore() {
    return _boxStore;
  }

  BoxStore._internal();

  // ignore: avoid_init_to_null
  Store _store = null;

  Future<Store> getStore() async {
    /// Returns an instance of the Store
    Directory dir = await getApplicationDocumentsDirectory();

    if (_store == null) {
      _store = Store(getObjectBoxModel(), directory: dir.path + '/objectbox');
    }

    return _store;
  }
}
