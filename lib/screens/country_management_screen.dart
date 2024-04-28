import 'package:f03_lugares/providers/country.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryManagementScreen extends StatelessWidget {
  const CountryManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);

    return Scaffold(
      body: Container(),
    );
  }
}
