import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widght/trip_item.dart';

class CategoryTirpScreen extends StatefulWidget {
  const CategoryTirpScreen({super.key, required this.availableTrips});
  static const routeName = '/category-trips';
  final List<Trip> availableTrips;
  @override
  State<CategoryTirpScreen> createState() => _CategoryTirpScreenState();
}

class _CategoryTirpScreenState extends State<CategoryTirpScreen> {
  String categoryTitle = '';
  List<Trip> displayedTrips = [];
  bool _isInitLoaded = false;
  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
   if (!_isInitLoaded) {
      final routeArguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final String categoryId = routeArguments['id']!;
      categoryTitle = routeArguments['title']!;
      
      displayedTrips =widget. availableTrips.where((trip) {
        return trip.categories.contains(categoryId);
      }).toList();
      
      // 3. قم بتغيير القيمة إلى true حتى لا يتم تحميل البيانات مرة أخرى عند العودة
      _isInitLoaded = true;
    }
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayedTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          categoryTitle,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: displayedTrips[index].id,
            title: displayedTrips[index].title,
            imageUrl: displayedTrips[index].imageUrl,
            duration: displayedTrips[index].duration,
            tripType: displayedTrips[index].tripType,
            season: displayedTrips[index].season,
            // removeItem: _removeTrip,
          );
        },
        itemCount: displayedTrips.length,
      ),
    );
  }
}
