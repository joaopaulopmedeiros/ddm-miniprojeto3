import 'package:f03_lugares/data/my_data.dart';
import 'package:f03_lugares/models/place.dart';
import 'package:flutter/material.dart';

class PlaceProvider extends ChangeNotifier
{
  final List<Place> places = DUMMY_PLACES;
}