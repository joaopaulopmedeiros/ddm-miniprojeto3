import 'package:f03_lugares/components/main_drawer.dart';
import 'package:f03_lugares/providers/place.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlaceManagementScreen extends StatelessWidget {
  const PlaceManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlaceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Lugares'),
      ),
      body: Container(
        child:  DataTable(
        columns: const [
          DataColumn(label: Text('Nome')),
          DataColumn(label: Text('Ações')),
        ],
        rows: provider.places.map((place) {
          return DataRow(cells: [
            DataCell(Text(place.titulo)),
            DataCell(Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    provider.editPlace(place);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    provider.removePlace(place);
                  },
                ),
              ],
            )),
          ]);
        }).toList(),
      ),
      ),
      drawer: const MainDrawer(),
    );
  }
}