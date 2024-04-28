import 'package:f03_lugares/components/place_item.dart';
import 'package:f03_lugares/models/country.dart';
import 'package:f03_lugares/providers/place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryPlacesScreen extends StatelessWidget {
  const CountryPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlaceProvider>(context);
    final country = ModalRoute.of(context)!.settings.arguments as Country;

    final countryPlaces = provider.places.where((places) {
      return places.paises.contains(country.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(country.title),
      ),
      body: ListView.builder(
          itemCount: countryPlaces.length,
          itemBuilder: (ctx, index) {
            return PlaceItem(countryPlaces[index]);
          }),
    );
  }
}
