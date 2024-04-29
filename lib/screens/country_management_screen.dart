import 'package:f03_lugares/components/main_drawer.dart';
import 'package:f03_lugares/providers/country.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryManagementScreen extends StatelessWidget {
  const CountryManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Países'),
      ),
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        DataTable(
          columns: const [
            DataColumn(label: Text('Nome')),
            DataColumn(label: Text('Ações')),
          ],
          rows: provider.countries.map((country) {
            return DataRow(cells: [
              DataCell(Text(country.title)),
              DataCell(Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      provider.editCountry(country, context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      provider.removeCountry(country, context);
                    },
                  ),
                ],
              )),
            ]);
          }).toList(),
        ),
      ]),
      drawer: const MainDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}
