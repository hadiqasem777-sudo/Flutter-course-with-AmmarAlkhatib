import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screen/categories_screen.dart';
import 'package:traveling_app/screen/favorites_screen.dart';
import 'package:traveling_app/widght/app_drawer.dart';

class TabsScreen({super.key, required this.favoriteTrips})
    extends StatefulWidget {
  final List<Trip> favoriteTrips;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  late List<Map<String, Object>> _screens;

  // @override
  // void initState() {
    // super.initState();
  // }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    _screens =
        [
          {
            'Screen': CategoriesScreen(),
            'Title': 'تصنيفات الرحلات',
          },
          {
            'Screen': FavoritesScreen(favoriteTrips: widget.favoriteTrips),
            'Title': 'الرحلات المفضلة',
          },
        ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          _screens[_selectedScreenIndex]['Title'] as String,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: _screens[_selectedScreenIndex]['Screen'] as Widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(148, 222, 216, 216),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'التفضيلات',
          ),
        ],
      ),
    );
  }
}
