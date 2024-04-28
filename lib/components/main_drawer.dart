import 'package:f03_lugares/utils/app_routes.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(40),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos viajar?',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          _createItem(Icons.home, 'Home',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
          _createItem(Icons.table_rows, 'Gerenciar Lugares',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.PLACES_MANAGEMENT)),              
          _createItem(Icons.create, 'Cadastrar Lugares',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.PLACES_ADD)),              
          _createItem(
              Icons.settings,
              'Configurações',
              () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.SETTINGS))
        ],
      ),
    );
  }
}
