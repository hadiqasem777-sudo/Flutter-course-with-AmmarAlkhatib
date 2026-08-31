// هاد الكلاس كان مشان التاب بار من فوق 
// import 'package:flutter/material.dart';
// import 'package:traveling_app/screen/categories_screen.dart';
// import 'package:traveling_app/screen/favorites_screen.dart';

// class TabsScreenUP extends StatelessWidget {
//   const TabsScreenUP({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue, 
//           centerTitle: true,
//           title: Text(
//             'دليل سياحي',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 24,
//               fontFamily: 'ElMessiri',
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           bottom: TabBar(
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.white70,
//             indicatorColor: Colors.white,
//             tabs: [
//               Tab(
//                 icon: Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Icon(Icons.dashboard),
//                 ),
//                 text: 'التصنيفات',
//               ),
//               Tab(
//                 icon: Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Icon(Icons.favorite),
//                 ),
//                 text: 'المفضلة',
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }


