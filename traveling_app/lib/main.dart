import 'package:flutter/material.dart';
// import 'package:traveling_app/screen/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/screen/category_tirp_screen.dart';
// import 'package:traveling_app/screen/favorites_screen.dart';
import 'package:traveling_app/screen/filters_screen.dart';
import 'package:traveling_app/screen/tabs_screen.dart';
// import 'package:traveling_app/widght/app_drawer.dart';
// import 'package:traveling_app/screen/tabs_screen_up.dart';
import 'package:traveling_app/screen/trip_detail_screen.dart';
import 'package:traveling_app/app_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availableTrips = Trips_data;
  List<Trip> _favoriteTrips = [];

  void _changeItemsScreenByFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableTrips = Trips_data.where((tirp) {
        if (_filters['summer'] == true && tirp.isInSummer == false) {
          return false;
        }
        if (_filters['winter'] == true && tirp.isInWinter == false) {
          return false;
        }
        if (_filters['family'] == true && tirp.isForFamilies == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
     var existingIndex = _favoriteTrips.indexWhere(
      (trip) => trip.id == tripId,
    );

    if (existingIndex >= 0) {
      setState(
        () => _favoriteTrips.removeAt(existingIndex),
      );
    } else {
      setState(
        () => _favoriteTrips.add(
          Trips_data.firstWhere((trip) => trip.id == tripId),
        ),
      );
    }
  }

  bool _isFavorite(String tripId) {
    return _favoriteTrips.any((trip) => trip.id == tripId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'),
      ],
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.amber,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
          headlineSmall: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favoriteTrips: _favoriteTrips),
        CategoryTirpScreen.routeName: (ctx) =>
            CategoryTirpScreen(availableTrips: _availableTrips),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(manageFavorite :_manageFavorite , isFavorite: _isFavorite),
        FiltersScreen.screenRoute: (ctx) => FiltersScreen(
          currentFilters: _filters,
          saveFilters: _changeItemsScreenByFilters,
        ),
      },
    );
  }
}
