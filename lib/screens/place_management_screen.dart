import 'package:f03_lugares/components/main_drawer.dart';
import 'package:flutter/material.dart';

class PlaceManagementScreen extends StatelessWidget {
  const PlaceManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Lugares'),
      ),
      body: Container(),
      drawer: const MainDrawer(),
    );
  }
}