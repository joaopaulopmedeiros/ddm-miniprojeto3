import 'package:f03_lugares/components/main_drawer.dart';
import 'package:f03_lugares/models/country.dart';
import 'package:f03_lugares/providers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class CountryManagementScreen extends StatelessWidget {
  const CountryManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryProvider>(builder: ((context, countryProvider, _) {
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
            rows: countryProvider.countries.map((country) {
              return DataRow(cells: [
                DataCell(Text(country.title)),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        countryProvider.editCountry(country, context);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        countryProvider.removeCountry(country, context);
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
                builder: (context) => const CreateCountryModal(),
              );
              if (newCountry != null) {
                countryProvider.addCountry(newCountry);
              }
            },
            child: const Icon(Icons.add)),
      );
    }));
  }
}

class CreateCountryModal extends StatefulWidget {
  const CreateCountryModal({super.key});

  @override
  State<StatefulWidget> createState() => _CreateCountryModalState();
}

class _CreateCountryModalState extends State<CreateCountryModal> 
{
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  Color selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    void showColorPicker() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Selecione uma cor'),
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor: selectedColor,
                onColorChanged: (color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

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
            Row(
              children: <Widget>[
                const Text('Cor: '),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: () {
                    showColorPicker();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: selectedColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  Country(
                    id: idController.text,
                    title: titleController.text,
                    color: selectedColor
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
