import '../../../data/models/bank_karta_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';

bool isWritten = false;
// TextStyle ts = const TextStyle(
//   fontFamily: 'Gilroy',
//   fontStyle: FontStyle.normal,
//   fontWeight: FontWeight.w600,
//   fontSize: 16,
//   letterSpacing: 1,
//   color: Color(0xFF333333),
// );
// TextStyle tsHint = const TextStyle(
//   fontFamily: 'Gilroy',
//   fontStyle: FontStyle.normal,
//   fontWeight: FontWeight.w600,
//   fontSize: 16,
//   letterSpacing: 1,
//   color: Color(0xFFC3C3C3),
// );
int? id;
String? type; // visa ili mastercard
String? numberKarta; // 4400 5500 00044 7788
String? name_surname;
int? month;
int? year;
int? cvc;
TextEditingController nomerKartyController =
    TextEditingController(text: '4400 - 4568 - 455|');
TextEditingController imyaController = TextEditingController();
TextEditingController timeController = TextEditingController();
TextEditingController cvcController = TextEditingController();

BoxDecoration bd = BoxDecoration(
  color: white,
  borderRadius: BorderRadius.circular(5),
);
// Color color_green = const Color(0xff2DC36A);
// Color color_grey = const Color(0xff999999);

class AlertDialogBody extends StatefulWidget {
  const AlertDialogBody({super.key, required this.dobavitKartu});
  // final BuildContext contextt;
  final Function dobavitKartu;

  @override
  State<AlertDialogBody> createState() => _AlertDialogBodyState();
}

class _AlertDialogBodyState extends State<AlertDialogBody> {
  @override
  Widget build(BuildContext contextt) {
    double maxwidthAlert = MediaQuery.of(contextt).size.width;

    return AlertDialog(
      // backgroundColor: const Color(0xffF1F2F2),
      backgroundColor: whitef4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide.none,
      ),
      insetPadding: const EdgeInsets.all(8),
      titlePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      // contentPadding: EdgeInsets.all(20),
      title: Stack(
        children: [
          closeIcon(contextt),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            width: maxwidthAlert - 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                Text(
                  'Добавление карты',
                  // style: TextStyle(
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.w600,
                  //   letterSpacing: 0.5,
                  //   color: black11,
                  // ),
                  style: ts11_20_600_05,
                ),
                inputsBody(maxwidthAlert),
                button(maxwidthAlert, contextt),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell button(double maxW, BuildContext contextt) {
    return InkWell(
      onTap: () {
        widget.dobavitKartu(
          BankKarta(
            id: 3,
            type: 'visa',
            numberKarta: '1234568798451673',
            name_surname: 'name_surname',
            month: 7,
            year: 2025,
            cvc: 123,
          ),
        );
        Navigator.of(contextt).pop();
        // setState(() {
        // countKarta++;
        // alertDialog();
        // });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: maxW - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color_green,
        ),
        alignment: Alignment.center,
        child: Text(
          'Добавить карту',
          // style: TextStyle(
          //   fontSize: 18,
          //   fontWeight: FontWeight.w700,
          //   color: whitef4,
          // ),
          style: tsf4_18_700_0,
        ),
      ),
    );
  }

  Positioned closeIcon(BuildContext contextt) {
    return Positioned(
      top: 0,
      right: 0,
      child: IconButton(
        onPressed: () {
          Navigator.of(contextt).pop();
        },
        icon: Icon(
          Icons.clear,
          color: greyc1,
          size: 24,
        ),
      ),
    );
  }

  Container inputsBody(double maxW) {
    double inputSize = (maxW - 12 - 16 - 48) / 2;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          inputNomer(),
          inputImya(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              inputTime(inputSize),
              inputCvc(inputSize),
            ],
          ),
        ],
      ),
    );
  }

  Container inputCvc(double size) {
    return Container(
      // margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        // width: double.infinity,
        width: size,
        // height: 40,
        decoration: bd,
        // padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextField(
          controller: cvcController,
          style: ts33_16_600_1,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: (value) {
            print(cvcController.text);
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              // borderSide: const BorderSide(color: Color(0xffF0F0F0)),
              borderSide: BorderSide.none,
            ),
            hintText: 'CVC',
            hintStyle: tsc1_16_600_1,
          ),
        ),
      ),
    );
  }

  Container inputTime(double size) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      // width: double.infinity,
      width: size,
      // height: 40,
      decoration: bd,
      // padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: timeController,
        style: ts33_16_600_1,
        // keyboardType: TextInputType.datetime,
        inputFormatters: [
          LengthLimitingTextInputFormatter(5),
        ],
        onChanged: (value) {
          print(timeController.text);
          print(value);
          // int month;
          if (timeController.text.length == 2) {
            month = int.parse(timeController.text);
            setState(() {
              // timeController.text = value + '/';
            });
          }
          if (timeController.text == 5) {
            // timeController.text = timeController.t;
          }
          setState(() {
            month = int.parse(timeController.text);
          });
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            // borderSide: const BorderSide(color: Color(0xffF0F0F0)),
            borderSide: BorderSide.none,
          ),
          hintText: 'ММ/ГГ',
          hintStyle: tsc1_16_600_1,
        ),
      ),
    );
  }

  Container inputImya() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      // height: 40,
      decoration: bd,
      // padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: imyaController,
        style: ts33_16_600_1,
        keyboardType: TextInputType.name,
        onChanged: (value) {
          print(imyaController.text);
          setState(() {
            name_surname = imyaController.text;
          });
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            // borderSide: const BorderSide(color: Color(0xffF0F0F0)),
            borderSide: BorderSide.none,
          ),
          hintText: 'Имя на карте',
          hintStyle: tsc1_16_600_1,
        ),
      ),
    );
  }

  Container inputNomer() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      // height: 40,
      decoration: bd,
      // padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: nomerKartyController,
        style: ts33_16_600_1,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          print(nomerKartyController.text);
          setState(() {
            numberKarta = nomerKartyController.text;
          });
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            // borderSide: const BorderSide(color: Color(0xffF0F0F0)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
