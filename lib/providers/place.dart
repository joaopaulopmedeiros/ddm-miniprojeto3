import 'dart:collection';

import 'package:f03_lugares/data/my_data.dart';
import 'package:f03_lugares/models/place.dart';
import 'package:flutter/material.dart';

class PlaceProvider extends ChangeNotifier
{
  final List<Place> _places = dummyPlaces;

  UnmodifiableListView<Place> get places => UnmodifiableListView(_places);

  void addPlace(Place place) 
  {
    _places.add(place);
    notifyListeners();
  }
}