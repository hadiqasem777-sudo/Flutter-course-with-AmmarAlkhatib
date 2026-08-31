import 'package:flutter/material.dart';
import 'package:traveling_app/widght/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.saveFilters,
    required this.currentFilters,
  });
  static const screenRoute = '/filters';
  final void Function(Map<String, bool> filterData) saveFilters;
  final Map<String, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var summer = false;
  var winter = false;
  var forFamilies = false;
  @override
  void initState() {
    summer = widget.currentFilters['summer']!;
    winter = widget.currentFilters['winter']!;
    forFamilies = widget.currentFilters['family']!;
    super.initState();
  }

  Widget buildSwitchListTile(
    // this is method
    String title,
    String subtitle,
    bool currentValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          'الفلترة',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters({
                'summer': summer,
                'winter': winter,
                'family': forFamilies,
              });
              // print('همينابيمسنبايمبايبا  Saved Filters: $summer, $winter, $forFamilies');
            },
          ),
        ],
      ),

      drawer: AppDrawer(),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'الرحلات الصيفية',
                  'اظهار الرحلات الصيفية فقط',
                  summer,
                  (newValue) {
                    setState(() {
                      summer = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'الرحلات الشتوية',
                  'اظهار الرحلات الشتوية فقط',
                  winter,
                  (newValue) {
                    setState(() {
                      winter = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'رحلات العائلة',
                  'اظهار رحلات العائلة فقط',
                  forFamilies,
                  (newValue) {
                    setState(() {
                      forFamilies = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
