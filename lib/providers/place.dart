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

  void removePlace(Place place)
  {
    _places.remove(place);
    notifyListeners();
  }

  void editPlace(Place editedPlace) 
  {
    int index = places.indexWhere((place) => place.id == editedPlace.id);
    if (index != -1) 
    {
      _places[index] = editedPlace;
      notifyListeners();
    }
  }
}