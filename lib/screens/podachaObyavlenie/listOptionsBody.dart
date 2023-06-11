// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../constants.dart/constants.dart';

// class ListOptions extends StatefulWidget {
//   ListOptions({super.key, required this.options});
//   late Map<int, List> options;
//   // late Map<bool, String> options;
//   // late bool isCategoryPage = false;
//   @override
//   State<ListOptions> createState() => _ListOptionsState();
// }

// class _ListOptionsState extends State<ListOptions> {
//   final isCategoryPage = ValueNotifier(false);
//   bool isCatPage = false;
//   int selectedChast = 0;
//   late List optionList = widget.options[selectedChast] as List;
//   @override
//   Widget build(BuildContext context) {
//     double chastWidth = (MediaQuery.of(context).size.width - 24 - 28) / 5;

//     return SingleChildScrollView(
//       keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//       child: Column(
//         children: [
//           indexChecker(chastWidth),
//           selectedChast < 2
//               ? Column(
//                   children: [
//                     poisk(),
//                   ],
//                 )
//               : SizedBox(),
//           listOptions(),
//         ],
//       ),
//     );
//   }

//   Container listOptions() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(
//           optionList[selectedChast].length,
//           (index) => optionTile(optionList[0][index] as String),
//         ),
//       ),
//     );
//   }

//   Widget optionTile(String optionName) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
//       decoration: BoxDecoration(
//         // color: Colors.white,
//         color: podacha_listoption_tile_color,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: InkWell(
//         onTap: () {
//           print('object');
//           setState(() {
//             selectedChast = selectedChast++;
//           });
//           print(selectedChast.toString());
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//               child: Container(
//                 margin: const EdgeInsets.only(left: 5),
//                 child: const Text(
//                   'Acura',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     letterSpacing: 0.8,
//                     // color: Colors.black,
//                     color: podacha_listoption_tile_text_color,
//                     fontFamily: 'Gilroy',
//                   ),
//                 ),
//               ),
//             ),
//             const Icon(
//               Icons.chevron_right,
//               size: 24,
//               // color: Colors.black,
//               color: podacha_listoption_tile_text_color,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Container poisk() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 7),
//       child: TextField(
//         textCapitalization: TextCapitalization.words,
//         textAlignVertical: TextAlignVertical.bottom,
//         decoration: InputDecoration(
//           focusedBorder:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//           filled: true,
//           // fillColor: Colors.white,
//           fillColor: podacha_contact_textfield_color,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none,
//           ),
//           contentPadding: const EdgeInsets.symmetric(
//             vertical: 13,
//             horizontal: 15,
//           ),
//           hintText: 'Поиск',
//           hintStyle: const TextStyle(
//             // color: Color(0xFF474747),
//             color: podacha_listOptions_hinttext_color,
//             fontSize: 16,
//           ),
//           prefixIcon: Container(
//             width: 20,
//             height: 20,
//             alignment: Alignment.center,
//             // padding: EdgeInsets.all(12),
//             margin: const EdgeInsets.all(8),
//             child: const Icon(
//               CupertinoIcons.search,
//               // color: Color(0xFF474747),
//               color: podacha_listOptions_hinttext_color,
//               size: 18,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget indexChecker(double chastWidth) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(
//           widget.options.length,
//           (index) => Container(
//             width: chastWidth,
//             height: 3,
//             decoration: BoxDecoration(
//               color: selectedChast >= index
//                   // ? const Color(0xFF2DC36A)
//                   ? podacha_index_sel_color
//                   // : const Color(0xFFE5E7EB),
//                   : podacha_index_not_sel_color,
//               borderRadius: BorderRadius.circular(1),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
