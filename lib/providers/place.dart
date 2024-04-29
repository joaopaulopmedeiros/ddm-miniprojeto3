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

void removePlace(Place placeToRemove, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Remoção'),
          content: Text('Tem certeza de que deseja remover ${placeToRemove.titulo}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _places.remove(placeToRemove);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${placeToRemove.titulo} removido')),
                );
                Navigator.of(context).pop();
                notifyListeners();
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
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