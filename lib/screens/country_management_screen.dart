import 'package:f03_lugares/components/main_drawer.dart';
import 'package:f03_lugares/models/country.dart';
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
        onPressed: () async {
          final newCountry = await showModalBottomSheet<Country>(
            context: context,
            builder: (context) => CreateCountryModal(),
          );

          if (newCountry != null) {
            provider.addCountry(newCountry);
          }
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}

class CreateCountryModal extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Adicionar País',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  Country(
                    id: idController.text,
                    title: titleController.text,
                  ),
                );
              },
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ),
    );
  }
}
