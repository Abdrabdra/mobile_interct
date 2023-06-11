// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';

// import '../../data/constants/colors.dart';
// import '../../screens/zapchasti/zapchastiFilterBody.dart';

// import '../../data/constants/textStyles.dart';
// import 'components/filterBody.dart';

// class FoundedAdvText extends StatefulWidget {
//   const FoundedAdvText({
//     Key? key,
//     required this.isCar,
//     required this.length,
//   }) : super(key: key);
//   final bool isCar;
//   final int length;

//   @override
//   State<FoundedAdvText> createState() => _FoundedAdvTextState();
// }

// class _FoundedAdvTextState extends State<FoundedAdvText> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(
//         // top: 24,
//         top: 12,
//         bottom: 0,
//       ),
//       height: 38,
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             '${widget.length} obyavlenia',
//             // style: TextStyle(
//             //   fontSize: 14,
//             //   fontWeight: FontWeight.w600,
//             //   // color: Color(0xFF878787),
//             //   color: grey87,
//             //   letterSpacing: 1,
//             // ),
//             style: ts87_14_600_1,
//           ),
//           InkWell(
//             onTap: () {
//               showModalBottomSheet(
//                 context: context,
//                 // backgroundColor: Colors.white,
//                 backgroundColor: whitef4,
//                 isScrollControlled: true,
//                 builder: (context) => SizedBox(
//                   height: MediaQuery.of(context).size.height - 50,
//                   // margin: const EdgeInsets.symmetric(horizontal: 0),
//                   child: widget.isCar
//                       ? const AvtoFilterBody(bannerRecall: false)
//                       : const ZapchastiFilterBody(),
//                   // ),
//                 ),
//               );
//             },
//             child: Container(
//               width: 114,
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//               decoration: BoxDecoration(
//                 // color: const Color(0xFF2DC36A),
//                 color: color_green,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Фильтры',
//                     // style: TextStyle(
//                     //   fontSize: 14,
//                     //   fontStyle: FontStyle.normal,
//                     //   fontWeight: FontWeight.w600,
//                     //   color: Colors.white,
//                     //   letterSpacing: 1,
//                     //   fontFamily: 'Gilroy',
//                     // ),
//                     style: tswh_14_600_1,
//                   ),
//                   // Icon(
//                   //   Icons.filter,
//                   //   size: 14,
//                   //   // color: Colors.white,
//                   //   color: whitef4,
//                   // )
//                   const SizedBox(
//                     width: 16,
//                     height: 16,
//                     child: Image(
//                       image: AssetImage('assets/images/filter_icon.png'),
//                       fit: BoxFit.contain,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
