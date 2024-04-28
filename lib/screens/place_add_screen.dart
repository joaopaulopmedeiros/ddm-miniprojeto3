import 'package:f03_lugares/components/main_drawer.dart';
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatelessWidget {
  const AddPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Lugar'),
      ),
      body: const Center(
        child: Text('Formulário de Cadastro de Lugares'),
      ),
      drawer: const MainDrawer(),
    );
  }
}