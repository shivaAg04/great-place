import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickeTitle, File pickedImage) {
    final newplace = Place(
        location: null,
        id: DateTime.now().toString(),
        image: pickedImage,
        title: pickeTitle);

    _items.add(newplace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newplace.id!,
      'title': newplace.title!,
      'image': newplace.image.path,
    });
  }

  Future<void> fetchandsetPlaces() async {
    final dataList = await DBHelper.getData('places');
    _items = dataList.map();
  }
}
