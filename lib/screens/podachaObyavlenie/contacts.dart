import '../../data/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/constants/textStyles.dart';
import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';

bool isWritten = false;
// TextStyle tsN = const TextStyle(
//   fontFamily: 'Gilroy',
//   fontStyle: FontStyle.normal,
//   fontWeight: FontWeight.w400,
//   fontSize: 16,
//   letterSpacing: 1,
//   // color: Color(0xFF333333),
//   color: black33,
// );
// TextStyle tsTextField = const TextStyle(
//   fontSize: 18,
//   fontWeight: FontWeight.w600,
//   // color: Colors.black,
//   color: black11,
//   letterSpacing: 0.8,
// );
InputDecoration inDecor = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide.none,
  ),
  filled: true,
  // fillColor: Colors.white,
  fillColor: white,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    // borderSide: const BorderSide(color: Color(0xffF0F0F0)),
    borderSide: BorderSide.none,
  ),
);
BoxDecoration boxDecor = BoxDecoration(
  // color: Colors.white,
  color: white,
  borderRadius: BorderRadius.circular(10),
);
int countPhone = 1;

TextEditingController nameController =
    TextEditingController(text: 'Инсар Еркимбеков');
TextEditingController phoneController =
    TextEditingController(text: '+7 (707)-777-77-77');

class Contacts extends StatefulWidget {
  const Contacts({
    Key? key,
    required this.stt,
    required this.stButton,
 required this.paa,
  }) : super(key: key);
  final PodachaAvtoAdver paa;

  final Function stt;
  final Function stButton;

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isWritten = false;
    countPhone = 1;
    // widget.stButton();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          // margin: const EdgeInsets.symmetric(vertical: 0),
          // color: const Color(0xffFAFAFA),
          color: whitef4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              name(maxWidth),
              const SizedBox(height: 20),
              Text('Телефон', style: ts33_16_400_1),
              const SizedBox(height: 12),
              Column(
                children: List.generate(
                  countPhone,
                  (index) => Column(
                    children: [
                      phone(maxWidth),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    countPhone++;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // color: const Color(0xff333333),
                    color: black33,
                  ),
                  child: Text(
                    'Добавить еще телефон',
                    // style: TextStyle(
                    //   fontSize: 14,
                    //   fontWeight: FontWeight.w400,
                    //   // color: Colors.white,
                    //   color: whitef4,
                    //   letterSpacing: 0.8,
                    // ),
                    style: tsf4_14_400_08,
                  ),
                ),
              ),
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

  Widget name(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Имя', style: ts33_16_400_1),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          // height: 40,
          decoration: boxDecor,
          // padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            controller: nameController,
            style: ts11_18_600_08,
            keyboardType: TextInputType.name,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            onChanged: (value) {
              print(nameController.text);
              // !isWritten
              //     ? nameController.text.isNotEmpty
              //         ? widget.stButton()
              //         : null
                  // : null;
              setState(() {
                isWritten = true;
                if (nameController.text.isEmpty &&
                    phoneController.text.isEmpty) {
                  widget.stButton(widget.paa.copyWith(nameOfAuthor: nameController.text, phoneOfAuthor: phoneController.text));
                  isWritten = false;
                }
              });
            },
            decoration: inDecor,
          ),
        ),
      ],
    );
  }

  Widget phone(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          // height: 40,
          decoration: boxDecor,
          // padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            controller: phoneController,
            style: ts11_18_600_08,
            // keyboardType: const TextInputType.numberWithOptions(signed: true),
            keyboardType: TextInputType.phone,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            onChanged: (value) {
              print(phoneController.text);
              // !isWritten
              //     ? phoneController.text.isNotEmpty
              //         ? widget.stButton()
              //         : null
              //     : null;
              setState(() {
                isWritten = true;
                if (nameController.text.isEmpty &&
                    phoneController.text.isEmpty) {
                  // widget.stButton();
                  widget.stButton(widget.paa.copyWith(nameOfAuthor: nameController.text, phoneOfAuthor: phoneController.text));
                  isWritten = false;
                }
              });
            },
            decoration: inDecor,
          ),
        ),
      ],
    );
  }
}
