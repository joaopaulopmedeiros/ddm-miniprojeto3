import 'package:flutter/material.dart';

import '../models/place.dart';

class FavoriteProvider extends ChangeNotifier
{
    final List<Place> favoritePlaces = [];
    
    void toggleFavorite(Place place) {
      favoritePlaces.contains(place)
          ? favoritePlaces.remove(place)
          : favoritePlaces.add(place);
  }

  bool isFavorite(Place place) {
    return favoritePlaces.contains(place);
  }
}