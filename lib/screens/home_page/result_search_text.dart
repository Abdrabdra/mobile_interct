// import '../../data/constants/colors.dart';
// import 'package:flutter/material.dart';

// import '../../data/constants/textStyles.dart';

// class ResultSearchText extends StatefulWidget {
//   const ResultSearchText({super.key});

//   @override
//   State<ResultSearchText> createState() => _ResultSearchTextState();
// }

// List<String> list = [
//   'BMW M5',
//   'Tesla Model - S',
//   'Mercedes Benz S-class',
//   'Lexus L500 F600',
//   'BMW M5',
//   'Mercedes Benz E-class',
//   'Volkswagen Polo',
//   'Audi A8',
// ];

// class _ResultSearchTextState extends State<ResultSearchText> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 16),
//       child:
//           //
//           // GridView.builder(
//           //   shrinkWrap: true,
//           //   itemCount: 10,

//           //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           //     crossAxisCount: 2,
//           //     crossAxisSpacing: 10,
//           //     mainAxisSpacing: 10,

//           //   ),
//           //   itemBuilder: (context, index) {
//           //     return Container(
//           //       // height: 200,
//           //       // width: 200,
//           //       height: 23,
//           //       // width: 200,
//           //       padding: const EdgeInsets.symmetric(
//           //         vertical: 4,
//           //         horizontal: 8,
//           //       ),
//           //       decoration: BoxDecoration(
//           //         color: Colors.green,
//           //         borderRadius: BorderRadius.circular(10),
//           //       ),
//           //       child:
//           //   //
//           //   Padding(
//           // padding: const EdgeInsets.all(10),
//           // child: Column(
//           //   crossAxisAlignment: CrossAxisAlignment.start,
//           //   children: [
//           //     // const Text(
//           //     //   'name njds cndsj',
//           //     //   style: TextStyle(
//           //     //       fontWeight: FontWeight.bold,
//           //     //       fontSize: 24,
//           //     //       color: Colors.white),
//           //     // ),
//           //     // const SizedBox(height: 10),
//           Wrap(
//         alignment: WrapAlignment.center,
//         crossAxisAlignment: WrapCrossAlignment.center,
//         spacing: 8,
//         runSpacing: 8,
//         // textDirection: TextDirection.,
//         children: List.generate(
//           list.length,
//           (i) {
//             return Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 4,
//                   horizontal: 8,
//                 ),
//                 // margin: EdgeInsets.only(right: 0, bottom: 8),
//                 decoration: BoxDecoration(
//                   // color: Colors.white,
//                   color: white,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child:
//                     //
//                     // i % 2 == 0
//                     //     ?
//                     //
//                     Text(
//                   list[i],
//                   // style: const TextStyle(
//                   //   fontSize: 12,
//                   //   fontWeight: FontWeight.w600,
//                   //   letterSpacing: 0.8,
//                   //   color: black33,
//                   //   fontFamily: 'Gilroy',
//                   // ),
//                   style: ts33_12_600_08,
//                 )
//                 // : const Text(
//                 //     'name nj',
//                 //     style: TextStyle(
//                 //       fontSize: 12,
//                 //       fontWeight: FontWeight.w600,
//                 //       letterSpacing: 0.8,
//                 //       fontFamily: 'Gilroy',
//                 //     ),
//                 //   ),
//                 );
//           },
//           // growable: false,
//         ),
//       ),
//       // ],
//       // ),
//       // ),
//     );
//     //   },
//     // ),
//     // );
//   }
// }
