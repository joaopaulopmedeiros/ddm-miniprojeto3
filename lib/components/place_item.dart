import 'package:f03_lugares/models/place.dart';
import 'package:f03_lugares/utils/app_routes.dart';
import 'package:flutter/material.dart';

class PlaceItem extends StatelessWidget {
  final Place place;

  const PlaceItem(this.place, {super.key});

  void _selectPlace(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          AppRoutes.PLACES_DETAIL,
          arguments:
              place, 
        )
        .then((value) => {
              if (value == null) {} else {print(value)}
            });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectPlace(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  place.imagemUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 20,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Text(
                    place.titulo,
                    style: const TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true, //quebra de lina
                    overflow: TextOverflow.fade, //case de overflow
                  ),
                ),
              )
            ]),
            //Text(place.titulo),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.star),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${place.avaliacao}/5')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('custo: R\$${place.custoMedio}')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
