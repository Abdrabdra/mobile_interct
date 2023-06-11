// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/cupertino.dart';
// import 'dart:convert';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import 'package:flutter/material.dart';

import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';

List listMarki1 = ['2007-2011 поколение (А5)'];

List items = [false, false, false, false];
int selectedIndexNal = 1;
bool isChoosedModif = false;

Map<int, String> radioButtonsDvigatel = {
  0: 'Бензиновый',
  1: 'Дизельный',
  // 2: 'Водный транспорт',
};
// TextStyle ts = const TextStyle(
//   fontFamily: 'Gilroy',
//   fontStyle: FontStyle.normal,
//   fontWeight: FontWeight.w400,
//   fontSize: 14,
//   letterSpacing: 1,
//   color: Color(0xFF878787),
// );
BoxDecoration bd = BoxDecoration(
  color: const Color(0xffF0F0F0),
  borderRadius: BorderRadius.circular(8),
);

Map<int, String> radioButtonsZapchasti = {
  0: 'Диски',
  1: 'Стекло',
  2: 'Мотор',
  3: 'Генератор',
  4: 'Бампер',
  5: 'Глушитель',
  6: 'Аккумулятор',
  7: 'Аккумулятор',
  8: 'Аккумулятор',
  9: 'Аккумулятор',
  10: 'Аккумулятор',
  11: 'Аккумулятор',
  12: 'Аккумулятор',
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
  color: greyf0,
);

class VyborModification extends StatefulWidget {
  const VyborModification({
    Key? key,
    // required this.optionsListt,
    required this.stt,
    required this.stButton,
  required this.paa,
  }) : super(key: key);
  final PodachaAvtoAdver paa;

  // final List optionsListt;
  final Function stt;
  final Function stButton;

  @override
  State<VyborModification> createState() => _VyborModificationState();
}

class _VyborModificationState extends State<VyborModification> {
  bool isExp1 = false, isExpRule = true;
  void st(int i, bool exp) {
    setState(() {
      i == 0 ? isExp1 = exp : isExpRule = exp;
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
    isChoosedModif = false;
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

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            // height: MediaQuery.of(context).size.height,
            // color: const Color(0xffFAFAFA),
            color: whitef4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Dvigatel(),
                // Zapchasti(),
                // Dvigatel(), //privod
                // Dvigatel(), //korobka peredach
                // Dvigatel(), //modificatsya
                Rule(maxWidth), //
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container rule(double maxWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 67,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(
          //   'Наличие',
          //   style: ts,
          // ),
          Container(
            height: 44,
            width: double.infinity,
            padding: const EdgeInsets.all(4),
            decoration: bd,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ruleChoiceContainer(1, 'Левый', maxWidth),
                ruleChoiceContainer(2, 'Правый', maxWidth),
                // nalichChoiceContainer(3, 'На заказ', maxWidth),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ruleChoiceContainer(int i, String name, double maxWidth) {
    bool isSel = i == selectedIndexNal;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndexNal = i;
        });
        widget.stButton(widget.paa.copyWith(rule: i==1?'left':'right'));
      },
      child: Container(
        // height: 36,
        // width: 110,
        width: (maxWidth - 8 - 40) / 2,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          // color: isSel ? const Color(0xff333333) : null,
          color: isSel ? black33 : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            name,
            // style: TextStyle(
            //   fontFamily: 'Gilroy',
            //   fontStyle: FontStyle.normal,
            //   fontWeight: isSel ? FontWeight.w600 : FontWeight.w400,
            //   fontSize: 14,
            //   // height: 20,
            //   letterSpacing: -0.16,
            //   // color: isSel ? Colors.white : const Color(0xff333333),
            //   color: isSel ? whitef4 : black33,
            // ),
            style: isSel ? tsf4_14_600_01 : ts33_14_400_01,
          ),
        ),
      ),
    );
  }

  Widget Dvigatel() {
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
                  'Машины',
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
                    padding: const EdgeInsets.only(left: 17, top: 20),
                    child: Column(
                      children: List.generate(
                        radioButtonsDvigatel.length,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioListTile(
                              value: index,
                              groupValue: selectedRadioTileAvto,
                              toggleable: true,
                              controlAffinity: ListTileControlAffinity.trailing,
                              title:
                                  Text(radioButtonsDvigatel[index] as String),
                              // subtitle: Text(user.lastName),
                              onChanged: (val) {
                                if (selectedRadioTileAvto != index) {
                                  print(
                                      "Current User ${radioButtonsDvigatel[index]} ");
                                  setSelectedRadioTileAvto(val!);
                                  // !isChoosedModif ? widget.stButton() : null;
                                  setState(() {
                                    isChoosedModif = true;
                                  });
                                }
                              },
                              selected: selectedRadioTileAvto == index,
                              // activeColor: Colors.black,
                              activeColor: color_green,
                              // selectedTileColor: Color(0xff2DC36A),
                            ),
                            // const SizedBox(height: 15),
                            radioButtonsDvigatel.length - 1 != index
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
            // isExpanded: items[index],
            isExpanded: isExp1,
          ),
        ],
        expansionCallback: (int item, bool status) {
          setState(() {
            // items[index] = !items[index];
            isExp1 = !isExp1;
            isExpRule = false;
          });
        },
      ),
    );
  }

  Widget Rule(double maxWidth) {
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
                  'Руль',
                  // style: TextStyle(
                  //   // color: itemData[index].colorsItem,
                  //   color: black11,
                  //   fontSize: 18,
                  // ),
                  style: ts11_18_500_0,
                ),
              );
            },
            body: rule(maxWidth),
            // Container(
            //     padding: const EdgeInsets.only(left: 20, right: 15, bottom: 20),
            //     child: Container(
            //       width: 250,
            //       height: 70,
            //       color: Colors.yellow,
            //     )

            isExpanded: isExpRule,
          ),
          // isExpanded: items[index],
          // ),
        ],
        expansionCallback: (int item, bool status) {
          setState(() {
            // items[index] = !items[index];
            isExpRule = !isExpRule;
            isExp1 = false;
          });
        },
      ),
    );
  }
}
