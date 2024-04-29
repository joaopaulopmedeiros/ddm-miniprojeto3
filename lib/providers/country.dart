import 'dart:collection';

import 'package:f03_lugares/data/my_data.dart';
import 'package:flutter/material.dart';

import '../models/country.dart';

class CountryProvider extends ChangeNotifier
{
  final List<Country> _countries = dummyCountries;

  UnmodifiableListView<Country> get countries => UnmodifiableListView(_countries);

  void removeCountry(Country countryToRemove, BuildContext context) 
  {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Remoção'),
          content: Text(
              'Tem certeza de que deseja remover ${countryToRemove.title}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _countries.remove(countryToRemove);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${countryToRemove.title} removido')),
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

  void editCountry(Country country, BuildContext context) {}
}