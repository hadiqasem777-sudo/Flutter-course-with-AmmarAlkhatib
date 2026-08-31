import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';
import 'package:traveling_app/widght/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.favoriteTrips});
  final List<Trip> favoriteTrips;

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isEmpty) {
      return const Center(
        child: Text('Favorites Screen'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteTrips.length,
        itemBuilder: (ctx, index) {
          final tripFav = favoriteTrips[index];
          return TripItem(
            id: tripFav.id,
            title: tripFav.title,
            imageUrl: tripFav.imageUrl,
            duration: tripFav.duration,
            tripType: tripFav.tripType,
            season: tripFav.season,
          );
        },
      );
    }
  }
}
