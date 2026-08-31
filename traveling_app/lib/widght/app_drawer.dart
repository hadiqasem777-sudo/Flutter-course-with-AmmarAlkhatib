import 'package:flutter/material.dart';
import 'package:traveling_app/screen/favorites_screen.dart';
import 'package:traveling_app/screen/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 90,
            width: double.infinity,
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            color: Theme.of(context).hintColor,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('الرحلات', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('الفلترة', Icons.filter_list, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);
          }),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, Function onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        '$title',
        style: TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        onTapLink();
      },
    );
  }
}
