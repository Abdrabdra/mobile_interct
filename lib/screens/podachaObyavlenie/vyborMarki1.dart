import 'package:interct_2/data/models/marka_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/sized_boxes.dart';
import '../../data/constants/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';
import '../home_page/blocs/get_marka_models_bloc/get_marka_models_bloc.dart';

List<MarkaModel> listMarki1 = [];

class VyborMarka extends StatefulWidget {
  const VyborMarka({
    Key? key,
    // required this.optionsListt,
    required this.stt,
    required this.paa,
  }) : super(key: key);
  final PodachaAvtoAdver paa;

  // final List optionsListt;
  final Function stt;

  @override
  State<VyborMarka> createState() => _VyborMark1State();
}

class _VyborMark1State extends State<VyborMarka> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetMarkasModelsBloc>().add(GetMarkas());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMarkasModelsBloc, GetMarkasModelsState>(
      builder: (context, state) {
        return Container(
          // margin: const EdgeInsets.only(bottom: 8),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // poisk(),
              // SizedBox(height: 8),
              state is GetMarkasModelsLoading
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        sb_h16(),
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                        sb_h16(),
                      ],
                    )
                  : state is GetMarkasModelsSuccess
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            // widget.optionsListt.length,
                            // listMarki1.length,
                            state.listMarkas.length,
                            (index) => GestureDetector(
                              onTap: () {
                                // widget.paa.copyWith(marka: listMarki1[index].id);
                                widget.paa.copyWith(
                                    marka: state.listMarkas[index].id);
                              },
                              child: opW(
                                // optionName: widget.optionsListt[index] as String,
                                // optionName: listMarki1[index].name as String,
                                optionName:
                                    state.listMarkas[index].name as String,
                                stt: () {
                                  // widget.paa.copyWith(marka:id );
                                },
                              ),
                            ),
                          ),
                        )
                      : state is GetMarkasModelsFailure
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                sb_h16(),
                                Center(
                                  child: Text(
                                    'ERROR',
                                    style: tsgr_12_600_08,
                                  ),
                                ),
                                sb_h16(),
                              ],
                            )
                          : const SizedBox(),
            ],
          ),
        );
      },
    );
  }

  // Container poisk() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 7),
  //     child: TextField(
  //       textCapitalization: TextCapitalization.words,
  //       textAlignVertical: TextAlignVertical.bottom,
  //       decoration: InputDecoration(
  //         focusedBorder:
  //             OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
  //         filled: true,
  //         fillColor: podacha_contact_textfield_color,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //           borderSide: BorderSide.none,
  //         ),
  //         contentPadding: const EdgeInsets.symmetric(
  //           vertical: 13,
  //           horizontal: 15,
  //         ),
  //         hintText: 'Поиск',
  //         hintStyle: const TextStyle(
  //           color: podacha_hinttext_color,
  //           fontSize: 16,
  //         ),
  //         prefixIcon: Container(
  //           width: 20,
  //           height: 20,
  //           alignment: Alignment.center,
  //           margin: const EdgeInsets.all(8),
  //           child: const Icon(
  //             CupertinoIcons.search,
  //             color: podacha_hinttext_color,
  //             size: 18,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class opW extends StatelessWidget {
  const opW({
    Key? key,
    required this.optionName,
    required this.stt,
  }) : super(key: key);

  final String optionName;
  final Function stt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          stt();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  optionName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  // style: const TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.w600,
                  //   letterSpacing: 0.8,
                  //   color: black11,
                  //   fontFamily: 'Gilroy',
                  // ),
                  style: ts11_18_600_08,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 24,
              color: black11,
            )
          ],
        ),
      ),
    );
  }
}















// import '../../screens/podachaObyavlenie/appBar.dart';
// import '../../screens/zapchasti/homeZapchastiPage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class PodachaObyavlenie extends StatefulWidget {
//   PodachaObyavlenie({super.key, required this.selectedCh});
//   int selectedCh;
//   @override
//   State<PodachaObyavlenie> createState() => _PodachaObyavlenieState();
// }

// Map<int, List> optionsList = {
//   0: List.generate(33, (index) => 'Acura'),
//   1: List.generate(8, (index) => 'A1'),
//   2: List.generate(33, (index) => '2022'),
//   3: List.generate(4, (index) => 'Лифтбек'),
//   4: List.generate(1, (index) => '2007-2011 поколение (А5)'),
// };

// Map<int, dynamic> optionsListBody = {
//   0: HomeZapchastiPage,
//   1: List.generate(8, (index) => 'A1'),
//   2: List.generate(33, (index) => '2022'),
//   3: List.generate(4, (index) => 'Лифтбек'),
//   4: List.generate(1, (index) => '2007-2011 поколение (А5)'),
// };

// class _PodachaObyavlenieState extends State<PodachaObyavlenie> {
//   late int selectedChast = widget.selectedCh;

//   void st() {
//     print('st method');
//     setState(() {
//       selectedChast = selectedChast++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double chastWidth = (MediaQuery.of(context).size.width - 24 - 28) / 5;
//     return Scaffold(
//       appBar: PodachaObyavlenieAppBar(context),
//       extendBody: true,
//       backgroundColor: const Color(0xFFFAFAFA),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         child: SingleChildScrollView(
//           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ListOptions(options: optionsList[selectedChast] as List<String>),
//               // ListOptions(options: optionsList),
//               indexChecker(chastWidth),
//               poisk(),
//               listOptions(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Container listOptions() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(
//           optionsList[selectedChast]!.length,
//           (index) => optionTile(optionsList[selectedChast]![index] as String),
//         ),
//       ),
//     );
//   }

//   Widget optionTile(String optionName) {
//     // return opW(selectedChast: selectedChast, optionName: optionName, stt: st);
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: InkWell(
//         onTap: () {
//           // print('object');
//           // selectedChast != optionsList.length - 1 ? selectedChast++ : null;
//           // setState(() {
//           //   selectedChast = selectedChast++;
//           // });
//           st();
//           print(selectedChast.toString());
//           // selectedChast++;
//           // print(selectedChast.toString());
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute<void>(
//           //     builder: (BuildContext context) =>
//           //         PodachaObyavlenie(selectedCh: selectedChast++),
//           //   ),
//           // );
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//               child: Container(
//                 margin: const EdgeInsets.only(left: 5),
//                 child: Text(
//                   optionName,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     letterSpacing: 0.8,
//                     color: Colors.black,
//                     fontFamily: 'Gilroy',
//                   ),
//                 ),
//               ),
//             ),
//             const Icon(
//               Icons.chevron_right,
//               size: 24,
//               color: Colors.black,
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
//           fillColor: Colors.white,
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
//             color: Color(0xFF474747),
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
//               color: Color(0xFF474747),
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
//           optionsList.length,
//           (index) => Container(
//             width: chastWidth,
//             height: 3,
//             decoration: BoxDecoration(
//               color: selectedChast >= index
//                   ? const Color(0xFF2DC36A)
//                   : const Color(0xFFE5E7EB),
//               borderRadius: BorderRadius.circular(1),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class opW extends StatelessWidget {
//   const opW({
//     Key? key,
//     required this.selectedChast,
//     required this.optionName,
//     required this.stt,
//   }) : super(key: key);

//   final int selectedChast;
//   final String optionName;
//   final Function stt;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: InkWell(
//         onTap: () {
//           // print('object');
//           // selectedChast != optionsList.length - 1 ? selectedChast++ : null;
//           // setState(() {
//           //   selectedChast = selectedChast++;
//           // });
//           stt();
//           print(selectedChast.toString());
//           // selectedChast++;
//           // print(selectedChast.toString());
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute<void>(
//           //     builder: (BuildContext context) =>
//           //         PodachaObyavlenie(selectedCh: selectedChast++),
//           //   ),
//           // );
//         },
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Flexible(
//               child: Container(
//                 margin: const EdgeInsets.only(left: 5),
//                 child: Text(
//                   optionName,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     letterSpacing: 0.8,
//                     color: Colors.black,
//                     fontFamily: 'Gilroy',
//                   ),
//                 ),
//               ),
//             ),
//             const Icon(
//               Icons.chevron_right,
//               size: 24,
//               color: Colors.black,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
