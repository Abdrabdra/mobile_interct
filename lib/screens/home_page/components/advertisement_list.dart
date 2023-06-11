// import 'package:flutter/material.dart';

// import 'advertisement_tile.dart';

// class AdvertisementBody extends StatelessWidget {
//   const AdvertisementBody({super.key, required this.isCar});
//   final bool isCar;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           buildListView(isCar),
//         ],
//       ),
//     );
//   }

//   Widget buildListView(bool isCar) {
//     return ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         // physics: BouncingScrollPhysics(),
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return AdvertisementTile(isCar: isCar);
//         });
//   }
// }
