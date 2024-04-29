import 'package:f03_lugares/components/main_drawer.dart';
import 'package:f03_lugares/models/place.dart';
import 'package:f03_lugares/providers/country.dart';
import 'package:f03_lugares/providers/place.dart';
import 'package:f03_lugares/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPlaceScreen extends StatelessWidget {
  const AddPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Lugar'),
      ),
      body: const AddPlaceForm(),
      drawer: const MainDrawer(),
    );
  }
}

class AddPlaceForm extends StatefulWidget {
  const AddPlaceForm({super.key});

  @override
  State<StatefulWidget> createState() => _AddPlaceFormState();
}

class _AddPlaceFormState extends State<AddPlaceForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);
    final placeProvider = Provider.of<PlaceProvider>(context);
    String? selectedCountryId;
    String titulo = "";
    String imagemUrl = "";
    String recomendacao = "";
    double avaliacao = 0;
    double custoMedio = 0;

    const snackBar = SnackBar(
      content: Text('Sucesso!'),
    );

    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Título',
                  labelText: 'Título',
                ),
                onSaved: (String? value) {
                  titulo = value ?? "";
                },
                validator: (String? value) {
                  return (value == null || value == "")
                      ? 'Preencha o campo obrigatório.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '0.00',
                  labelText: 'Custo médio',
                ),
                onSaved: (String? value) {
                  String v = value != null && value != "" ? value.toString() : "0";
                  custoMedio = double.parse(v);
                },
                validator: (String? value) {
                  return (value == null || value == "")
                      ? 'Preencha o campo obrigatório.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'https://image.com',
                  labelText: 'URL da imagem',
                ),
                onSaved: (String? value) {
                  imagemUrl = value ?? "";
                },
                validator: (String? value) {
                  return (value == null || value == "")
                      ? 'Preencha o campo obrigatório.'
                      : null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Recomendação',
                  labelText: 'Recomendação',
                ),
                onSaved: (String? value) {
                  recomendacao = value ?? "";
                },
                validator: (String? value) {
                  return (value == null || value == "")
                      ? 'Preencha o campo obrigatório.'
                      : null;
                },
              ),              
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '1 a 5',
                  labelText: 'Avaliação',
                ),
                onSaved: (String? value) {
                  String v = value != null && value != "" ? value.toString() : "0";
                  avaliacao = double.parse(v);
                },
                validator: (String? value) {
                  return (value == null || value == "")
                      ? 'Preencha o campo obrigatório.'
                      : null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              DropdownButtonFormField<String>(
                hint: const Text("País"),
                value: selectedCountryId,
                items: countryProvider.countries.map((e) => e.id).toList()
                    .map((countryId) => DropdownMenuItem<String>(
                          value: countryId,
                          child: Text(countryId),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  selectedCountryId = value;
                },
                validator: (String? value) {
                  return (value == null || value == "")
                      ? 'Preencha o campo obrigatório.'
                      : null;                  
                },
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null && _formKey.currentState!.validate()) {    
                    _formKey.currentState!.save();                
                    var place = Place(
                      id: "p${placeProvider.places.length+1}", 
                      paises: [selectedCountryId ?? ""], 
                      titulo: titulo, 
                      imagemUrl: imagemUrl, 
                      recomendacoes: [recomendacao], 
                      avaliacao: avaliacao, 
                      custoMedio: custoMedio);
                    placeProvider.addPlace(place);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.of(context).pushNamed(AppRoutes.HOME);
                  }
                },
                child: const Text('Adicionar'),
              ),
            ],
          )),
    );
  }
}
