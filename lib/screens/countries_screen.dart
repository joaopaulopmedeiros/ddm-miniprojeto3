import 'package:f03_lugares/components/country_item.dart';
import 'package:f03_lugares/providers/country.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/my_data.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);

    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              200, 
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: provider.countries.map((country) {
          return CountryItem(country);
        }).toList(),
      ),
    );
  }
}
