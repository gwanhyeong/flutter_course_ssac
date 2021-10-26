import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mask_info/extension/unmodifiable_list.dart';
import 'package:mask_info/model/mask_store.dart';
import 'package:mask_info/repository/mask_store_repository.dart';

class MaskStoreViewModel with ChangeNotifier {
  final _maskStoreRepository = MaskStoreRepository();
  List<MaskStore> _storeList = [];
  UnmodifiableListView<MaskStore> get storeList =>
      _storeList.toUnmodifiableList();
  bool isLoading = false;

  MaskStoreViewModel() {
    fetch();
  }

  void fetch() {
    isLoading = true;
    _storeList = [];
    notifyListeners();

    _maskStoreRepository.fetch().then((data) {
      _storeList = data
          .where((store) =>
              store.remainStat != null &&
              store.remainStat != MaskStoreStock.none)
          .toList();
      isLoading = false;
      notifyListeners();
    });
  }
}
