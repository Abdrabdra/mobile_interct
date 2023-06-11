import '../../data/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/constants/textStyles.dart';
import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';

bool isWritten = false;

class PriceCar extends StatefulWidget {
  const PriceCar({
    Key? key,
    required this.stt,
    required this.stButton,
  required this.paa,
  }) : super(key: key);
  final PodachaAvtoAdver paa;

  final Function stt;
  final Function stButton;

  @override
  State<PriceCar> createState() => _PriceCarState();
}

class _PriceCarState extends State<PriceCar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isWritten = false;
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
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
              price(maxWidth),
              SizedBox(
                width: maxWidth / 2,
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget price(double maxWidth) {
    return Container(
      width: double.infinity,
      // height: 40,
      decoration: BoxDecoration(
        // color: Colors.white,
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(top: 14, bottom: 14, left: 20, right: 15),
      child: TextField(
        controller: controller,
        // style: const TextStyle(
        //   fontSize: 18,
        //   fontWeight: FontWeight.w600,
        //   // color: Colors.black,
        //   color: black11,
        //   letterSpacing: 0.8,
        // ),
        style: ts11_18_600_08,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          print(controller.text);
          !isWritten
              ? controller.text.isNotEmpty
                  ? widget.stButton(widget.paa.copyWith(price: int.parse(controller.text)))
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
          suffixIcon: Container(
            width: 50,
            alignment: Alignment.centerRight,
            child: Text(
              'KZT   ',
              // style: TextStyle(
              //   fontSize: 18,
              //   fontWeight: FontWeight.w400,
              //   // color: Color(0xffB3B3B3),
              //   color: grey87,
              //   fontFamily: 'Gilroy',
              // ),
              style: ts87_18_400_0,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: whitef4),
          ),
          filled: true,
          // fillColor: Colors.white,
          fillColor: white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: whitef4),
          ),
        ),
      ),
    );
  }
}
