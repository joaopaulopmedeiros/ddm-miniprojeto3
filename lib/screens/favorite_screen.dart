import 'package:f03_lugares/components/place_item.dart';
import 'package:f03_lugares/models/place.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Place> favoritePlaces;

  const FavoriteScreen(this.favoritePlaces, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoritePlaces.isEmpty) {
      return const Center(
        child: Text('Nenhum Lugar Marcado como Favorito!', style: TextStyle(fontSize: 20),),
      );
    } else {
      return ListView.builder(
          itemCount: favoritePlaces.length,
          itemBuilder: (ctx, index) {
            return PlaceItem(favoritePlaces[index]);
          });
    }
  }
}
