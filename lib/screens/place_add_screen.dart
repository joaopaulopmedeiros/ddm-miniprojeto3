import 'package:f03_lugares/components/main_drawer.dart';
import 'package:f03_lugares/providers/country.dart';
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
    final provider = Provider.of<CountryProvider>(context);
    final List<String> _categories = provider.countries.map((e) =>  e.id).toList();
    String? _selectedCategory;

    return Form(key: _formKey, child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,      
      children: [
        DropdownButtonFormField<String>(
          value: _selectedCategory,
          items: _categories.map((category) => 
             DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              )
          ).toList(), 
          onChanged: (String? value) {  },
        ),
      ],
    ));
  }
}