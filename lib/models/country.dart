import 'package:flutter/material.dart';

class Country {
  String id;
  String title;
  Color color;

  Country({
    required this.id,
    required this.title,
    this.color = Colors.blue,
  });

  Country.copy(Country originalCountry)
      : id = originalCountry.id,
        title = originalCountry.title,
        color = originalCountry.color;

  void setTitle(String title) 
  {
    this.title = title;
  }
}
