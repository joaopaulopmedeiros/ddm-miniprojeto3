import 'package:f03_lugares/providers/favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/main_drawer.dart';
import 'countries_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(
      builder: (context, favoritesProvider, _) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('PlacesToGo'),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.category), text: 'Countries'),
                  Tab(icon: Icon(Icons.star), text: 'Favorites'),
                ],
              ),
            ),
            drawer: const MainDrawer(),
            body: TabBarView(
              children: [
                const CountriesScreen(),
                FavoriteScreen(favoritesProvider.favoritePlaces),
              ],
            ),
          ),
        );
      },
    );
  }
}
