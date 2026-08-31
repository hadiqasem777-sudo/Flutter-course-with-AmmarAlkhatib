import 'package:flutter/material.dart';
class BuildSectionTitle extends StatelessWidget {
  final String title;
  const BuildSectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        '$title',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
