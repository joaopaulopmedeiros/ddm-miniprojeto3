import 'package:f03_lugares/data/my_data.dart';
import 'package:flutter/material.dart';

import '../models/country.dart';

class CountryProvider extends ChangeNotifier
{
  final List<Country> countries = DUMMY_COUNTRIES;
}