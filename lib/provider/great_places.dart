import 'dart:io';

import 'package:flutter/material.dart';

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
  }
}
