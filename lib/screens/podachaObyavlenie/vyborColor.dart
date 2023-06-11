// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';

List listMarki1 = ['2007-2011 поколение (А5)'];

List items = [false, false, false, false];

Map<int, String> radioButtonsAvto = {
  0: 'Автомобиль',
  1: 'Мотоциклы',
  2: 'Водный транспорт',
};

Map<int, String> colors = {
  0: 'Черный',
  1: 'Белый',
  2: 'Синий',
  3: 'Красный',
  4: 'Желтый',
  5: 'Зеленый',
  6: 'Голубой',
  7: 'Серый',
  8: 'Оранжевый',
  // 9: 'Черный',
  // 10: 'Белый',
  // 11: 'Синий',
  // 12: 'Синий',
};

Divider dv = const Divider(
  height: 1,
  // color: Color(0xffB9B9B9),
  color: greyc1,
);
Container dv2 = Container(
  margin: EdgeInsets.only(left: 17),
  height: 1,
  width: 170,
  // color: Color(0xffDEDEDE),
  color: greyc1,
);

class VyborColor extends StatefulWidget {
  const VyborColor({
    Key? key,
    required this.stt,
    required this.stButton,
  required this.paa,
  }) : super(key: key);
  final PodachaAvtoAdver paa;

  final Function stt;
  final Function stButton;

  @override
  State<VyborColor> createState() => _VyborColorState();
}

class _VyborColorState extends State<VyborColor> {
  bool isExp1 = false, isExp2 = false;
  bool isChoosed = false;
  void st(int i, bool exp) {
    setState(() {
      i == 0 ? isExp1 = exp : isExp2 = exp;
    });
  }

  int selectedRadioTileAvto = -1;
  int selectedRadioTileZapchast = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadioTileAvto = -1;
    selectedRadioTileZapchast = -1;
  }

  setSelectedRadioTileAvto(int val) {
    setState(() {
      selectedRadioTileAvto = val;
      selectedRadioTileZapchast = -1;
    });
  }

  setSelectedRadioTileZapchast(int val) {
    setState(() {
      selectedRadioTileAvto = -1;
      selectedRadioTileZapchast = val;
    });
  }

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xffFAFAFA),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColorChoose(),
                // Avtomobile(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget Avtomobile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 200),
        expandedHeaderPadding: const EdgeInsets.only(bottom: 0.0),
        elevation: 0,
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                child: Text(
                  'Машины',
                  // style: TextStyle(
                  //   // color: itemData[index].colorsItem,
                  //   color: Colors.black,
                  //   fontSize: 18,
                  // ),
                  style: ts11_18_500_0,
                ),
              );
            },
            body: Container(
              padding: const EdgeInsets.only(left: 20, right: 15, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dv,
                  Container(
                    padding: const EdgeInsets.only(left: 17, top: 20),
                    child: Column(
                      children: List.generate(
                        radioButtonsAvto.length,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioListTile(
                              value: index,
                              groupValue: selectedRadioTileAvto,
                              toggleable: true,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(radioButtonsAvto[index] as String),
                              onChanged: (val) {
                                if (selectedRadioTileAvto != index) {
                                  print(
                                      "Current User ${radioButtonsAvto[index]} ");
                                  setSelectedRadioTileAvto(val!);
                                  !isChoosed ? widget.stButton() : null;
                                  setState(() {
                                    isChoosed = true;
                                  });
                                }
                              },
                              selected: selectedRadioTileAvto == index,
                              // activeColor: Colors.black,
                              activeColor: color_green,
                              // selectedTileColor: Color(0xff2DC36A),
                            ),
                            radioButtonsAvto.length - 1 != index
                                ? dv2
                                : SizedBox()
                          ],
                        ),
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
            isExpanded: isExp1,
          ),
        ],
        expansionCallback: (int item, bool status) {
          setState(() {
            isExp1 = !isExp1;
            isExp2 = false;
          });
        },
      ),
    );
  }

  Widget ColorChoose() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whitef4,
      ),
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 200),
        expandedHeaderPadding: const EdgeInsets.only(bottom: 0.0),
        elevation: 0,
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                child: Text(
                  'Цвет',
                  // style: TextStyle(
                  //   // color: itemData[index].colorsItem,
                  //   color: black11,
                  //   fontSize: 18,
                  // ),
                  style: ts11_18_500_0,
                ),
              );
            },
            body: Container(
              padding: const EdgeInsets.only(left: 20, right: 15, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dv,
                  Container(
                    padding: const EdgeInsets.only(left: 17, top: 0),
                    height: 160,
                    child: Scrollbar(
                      thickness: 10,
                      thumbVisibility: true,
                      controller: scrollController,
                      radius: const Radius.circular(10),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        controller: scrollController,
                        itemCount: colors.length,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioListTile(
                              value: index,
                              groupValue: selectedRadioTileZapchast,
                              toggleable: true,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(colors[index] as String),
                              onChanged: (val) {
                                if (selectedRadioTileZapchast != index) {
                                  print("Current User ${colors[index]} ");
                                  setSelectedRadioTileZapchast(val!);
                                  !isChoosed ? widget.stButton(widget.paa.copyWith(color:colors[index] )) : null;
                                  setState(() {
                                    isChoosed = true;
                                  });
                                }
                              },
                              selected: selectedRadioTileZapchast == index,
                              activeColor: color_green,
                            ),
                            // const SizedBox(height: 15),
                            colors.length - 1 != index ? dv2 : SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // isExpanded: items[index],
            isExpanded: isExp2,
          ),
        ],
        expansionCallback: (int item, bool status) {
          setState(() {
            // items[index] = !items[index];
            isExp1 = false;
            isExp2 = !isExp2;
          });
        },
      ),
    );
  }
}


//  Scrollbar(
//         // I use a big thickness to make the thumb is easy to be seen
//         // You should chose another number that makes more sense
//         thickness: 10,
//         isAlwaysShown: true,
//         radius: const Radius.circular(10), // give the thumb rounded corners
//         child: ListView.builder(
//           itemCount: _myList.length, // Don't forget this line
//           itemBuilder: (context, index) => Card(
//             key: ValueKey(_myList[index]),
//             margin: const EdgeInsets.all(15),
//             elevation: 5,
//             color: Colors.accents[Random().nextInt(Colors.accents.length)],
//             child: ListTile(
//               title: Text(
//                 _myList[index],
//                 style: const TextStyle(fontSize: 24),
//               ),
//             ),
//           ),
//         ),
//       ),