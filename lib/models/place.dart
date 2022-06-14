import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlaceLocation {
  late final double? latitude;
  late final double? longitude;
  late final String? address;
  PlaceLocation(
      {@required this.latitude, @required this.longitude, this.address});
}

class Place {
  late final String? id;
  late final String? title;
  late final File image;
  late final PlaceLocation? location;

  Place({this.id, required this.image, required this.location, this.title});
}
