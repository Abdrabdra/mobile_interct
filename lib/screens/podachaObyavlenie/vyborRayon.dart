import 'package:interct_2/data/models/region_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/sized_boxes.dart';
import '../../data/constants/textStyles.dart';
import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';
import '../home_page/blocs/get_regions_cities_bloc/get_regions_cities_bloc.dart';

List listMarki2 = List.generate(42, (index) => '${2022 - (index)}');

// Map<int, String> rayony = {
//   0: 'Диски',
//   1: 'Стекло',
//   2: 'Мотор',
//   3: 'Генератор',
//   4: 'Бампер',
//   5: 'Глушитель',
//   6: 'Аккумулятор',
//   7: 'Аккумулятор',
//   8: 'Аккумулятор',
//   9: 'Аккумулятор',
//   10: 'Аккумулятор',
//   11: 'Аккумулятор',
//   12: 'Аккумулятор',
// };

List<RegionModel> regions = [];
bool isChoosed = false;

int selectedRadioTileRayon = -1;

class VyborRayona extends StatefulWidget {
  const VyborRayona({
    Key? key,
    required this.stt,
    required this.stButton,
    required this.paa,
  }) : super(key: key);
  final PodachaAvtoAdver paa;

  final Function stt;
  final Function stButton;

  @override
  State<VyborRayona> createState() => _VyborRayonaState();
}

class _VyborRayonaState extends State<VyborRayona> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadioTileRayon = -1;
    context.read<GetRegionsCitiesBloc>().add(GetRegions());
  }

  setSelectedRadioTileRayony(int val) {
    setState(() {
      // selectedRadioTileAvto = -1;
      selectedRadioTileRayon = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRegionsCitiesBloc, GetRegionsCitiesState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // poisk(),
              // SizedBox(height: 8),
              state is GetRegionsCitiesLoading
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
                  : state is GetRegionsCitiesSuccess
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            // regions.length,
                            state.listRegions.length,
                            (index) => Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: RadioListTile(
                                value: index,
                                groupValue: selectedRadioTileRayon,
                                toggleable: true,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                // title: Text(rayony[index] as String),
                                // title: Text(regions[index].nameRegion as String),
                                title:
                                    Text(state.listRegions[index].nameRegion),
                                onChanged: (val) {
                                  if (selectedRadioTileRayon != index) {
                                    // print("Current User ${rayony[index]} ");
                                    print(
                                        "Current User ${regions[index].nameRegion} ");
                                    setSelectedRadioTileRayony(val!);
                                    // !isChoosed ? widget.stButton(widget.paa.copyWith(idOfRegion: regions[index].idRegion)) : null;
                                    !isChoosed
                                        ? widget.stButton(widget.paa.copyWith(
                                            idOfRegion: state
                                                .listRegions[index].idRegion,
                                            regions: state.listRegions))
                                        : null;
                                    setState(() {
                                      isChoosed = true;
                                    });
                                  }
                                },
                                selected: selectedRadioTileRayon == index,
                                activeColor: color_green,
                              ),
                            ),
                          ),
                          //   ),
                          // ),
                        )
                      : state is GetRegionsCitiesFailure
                          ? Center(
                              child: Text(
                                'ERROR',
                                style: tsgr_12_600_08,
                              ),
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

// class opW extends StatelessWidget {
//   const opW({
//     Key? key,
//     required this.optionName,
//     required this.stt,
//     required this.setSelect,
//   }) : super(key: key);

//   final String optionName;
//   final Function stt;
//   final Function setSelect;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: List.generate(
//           rayony.length,
//           (index) => RadioListTile(
//             value: index,
//             groupValue: selectedRadioTileZapchast,
//             toggleable: true,
//             controlAffinity: ListTileControlAffinity.trailing,
//             title: Text(rayony[index] as String),
//             onChanged: (val) {
//               if (selectedRadioTileZapchast != index) {
//                 print("Current User ${rayony[index]} ");
//                 setSelect(val!);
//                 !isChoosed ? widget.stButton() : null;
//                 setState(() {
//                   isChoosed = true;
//                 });
//               }
//             },
//             selected: selectedRadioTileZapchast == index,
//             activeColor: Colors.green,
//           ),
//         ),
//       ),
//     );
//   }
// }
