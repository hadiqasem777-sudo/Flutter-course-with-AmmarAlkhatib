import 'package:flutter/material.dart';

import '../app_data.dart';
import '../widght/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: Categories_data.map(
        (categoryData) => CatehoryItem(
          id: categoryData.id,
          title: categoryData.title,
          imageUrl: categoryData.imageUrl,
        ),
      ).toList(),
    );
  }
}
