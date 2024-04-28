import 'dart:ui';

import 'package:f03_lugares/providers/favorite.dart';
import 'package:f03_lugares/screens/countries_places_screen.dart';
import 'package:f03_lugares/screens/place_add_screen.dart';
import 'package:f03_lugares/screens/place_detail_screen.dart';
import 'package:f03_lugares/screens/settings_screen.dart';
import 'package:f03_lugares/screens/tabs_screen.dart';
import 'package:f03_lugares/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        title: 'PlacesToGo',
        theme: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.purple,
                secondary: Colors.amber,
              ),
          fontFamily: 'Raleway',
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        initialRoute: '/',
        routes: {
          AppRoutes.HOME: (ctx) => TabsScreen(),
          AppRoutes.COUNTRY_PLACES: (ctx) => CountryPlacesScreen(),
          AppRoutes.PLACES_DETAIL: (ctx) => const PlaceDetailScreen(),
          AppRoutes.PLACES_ADD: (ctx) => const AddPlaceScreen(),
          AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
        },
      ),
    );
  }
}
