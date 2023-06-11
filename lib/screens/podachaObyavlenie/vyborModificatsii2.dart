// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/cupertino.dart';
// import 'dart:convert';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';

List listMarki1 = ['2007-2011 поколение (А5)'];

List items = [false, false, false, false];
int selectedIndexNal = 1;
bool isWritten = false;

bool isRastomojen = false;
bool avariynaya = false;
bool naZakaz = false;

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
//   color: grey87,
// );
BoxDecoration bd = BoxDecoration(
  color: greyf0,
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

class VyborModification_2 extends StatefulWidget {
  const VyborModification_2({
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
  State<VyborModification_2> createState() => _VyborModification_2State();
}

class _VyborModification_2State extends State<VyborModification_2> {
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
    isWritten = false;
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

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // FocusScopeNode currentFocus = FocusScope.of(context).unfocus();
        // FocusScope.of(context).requestFocus(FocusNode());
        // FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 0),
          // color: const Color(0xffFAFAFA),
          color: whitef4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isNew(maxWidth),
              probeg(maxWidth),
              filterBody_2('Растоможен в Казахстане', 1),
              filterBody_2('Аварийная', 2),
              filterBody_2('На заказ', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget filterBody_2(String text, int i) {
    return Container(
      // height: 20,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(left: 20, right: 7),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              text,
              maxLines: 2,
              // style: const TextStyle(
              //   fontFamily: 'Gilroy',
              //   fontStyle: FontStyle.normal,
              //   fontWeight: FontWeight.w600,
              //   fontSize: 18,
              //   letterSpacing: 1,
              //   color: black11,
              //   overflow: TextOverflow.ellipsis,
              // ),
              style: ts11_18_600_1,
            ),
          ),
          Checkbox(
            // value: i == 1 ? isRastomojen : avariynaya,
            value: checker(i),
            activeColor: black33,
            checkColor: whitef4,
            splashRadius: 16,
            onChanged: ((value) {
              setState(() {
                if (i == 1) {
                  isRastomojen = !isRastomojen;
                  widget.stButton(widget.paa.copyWith(isRastomojenInKZ: value));
                } else if (i == 2) {
                  avariynaya = !avariynaya;
                  widget.stButton(widget.paa.copyWith(isAvariynaya: value));
                } else if (i == 3) {
                  naZakaz = !naZakaz;
                  widget.stButton(widget.paa.copyWith(isNaZakaz: value));
                }
              });
            }),
          )
        ],
      ),
    );
  }

  bool checker(i) {
    switch (i) {
      case 1:
        return isRastomojen;
      case 2:
        return avariynaya;
      case 3:
        return naZakaz;
      default:
        return false;
    }
  }

  Widget probeg(double maxWidth) {
    return Container(
      // width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(top: 14, bottom: 14, left: 20, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Пробег',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              // color: Color(0xff8D8D8D),
              color: grey87,
              fontFamily: 'Gilroy',
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 220,
                height: 40,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    // for below version 2 use this
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    // for version 2 and greater youcan also use this
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    print(controller.text);
                    !isWritten
                        ? controller.text.isNotEmpty
                            ? widget.stButton(widget.paa.copyWith(probeg: controller.text,isNew: selectedIndexNal==2))
                            : null
                        : null;
                    setState(() {
                      isWritten = true;
                      if (controller.text.isEmpty) {
                        // widget.stButton();
                        isWritten = false;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: greyc1),
                    ),
                    filled: true,
                    fillColor: white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: greyc1),
                    ),
                  ),
                ),
              ),
              Container(
                // width: 60,
                height: 40,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: greyc1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'км',
                      style:
                          TextStyle(color: black11, fontSize: 18, height: 1.1),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: black11,
                      size: 20,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container isNew(double maxWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      padding: EdgeInsets.only(top: 14, right: 15, bottom: 14, left: 20),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      // height: 67,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // height: 44,
            width: double.infinity,
            padding: const EdgeInsets.all(6),
            decoration: bd,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                nalichChoiceContainer(1, 'С пробегом', maxWidth),
                nalichChoiceContainer(2, 'Новая', maxWidth),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget nalichChoiceContainer(int i, String name, double maxWidth) {
    bool isSel = i == selectedIndexNal;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndexNal = i;
        });
        widget.stButton(widget.paa.copyWith(isNew: i==2));
      },
      child: Container(
        width: (maxWidth - 8 - 40 - 23) / 2,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          // color: isSel ? const Color(0xff333333) : null,
          color: isSel ? black33 : null,

          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontStyle: FontStyle.normal,
              fontWeight: isSel ? FontWeight.w600 : FontWeight.w400,
              fontSize: 14,
              letterSpacing: -0.16,
              // color: isSel ? Colors.white : const Color(0xff333333),
              color: isSel ? white : black33,
            ),
          ),
        ),
      ),
    );
  }
}
