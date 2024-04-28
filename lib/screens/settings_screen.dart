import 'package:f03_lugares/components/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: const Center(
        child: Text('Configurações'),
      ),
      drawer: const MainDrawer(),
    );
  }
}
