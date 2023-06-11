import 'package:interct_2/data/models/userme_model.dart';

import '../../data/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../data/constants/textStyles.dart';

bool isWritten = false;
// TextStyle ts = const TextStyle(
//   fontFamily: 'Gilroy',
//   fontStyle: FontStyle.normal,
//   fontWeight: FontWeight.w600,
//   fontSize: 16,
//   letterSpacing: 1,
//   color: black33,
// );
int countPhone = 1;

// TextEditingController nameController = TextEditingController(text: 'Акжол');
// TextEditingController phoneController =
//     TextEditingController(text: '+ 7 707 188 1834');
late TextEditingController nameController;
late TextEditingController phoneController;
// Color color_green = const Color(0xff2DC36A);

class LichnyeBody extends StatefulWidget {
  const LichnyeBody({super.key, required this.umm});
  final UserMeModel umm;

  @override
  State<LichnyeBody> createState() => _LichnyeBodyState();
}

class _LichnyeBodyState extends State<LichnyeBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: widget.umm.name);
    phoneController = TextEditingController(text: widget.umm.phone);
  }

  @override
  Widget build(BuildContext context) {
    double maxW = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            photo(maxW),
            name_phone_data(maxW),
          ],
        ),
      ),
    );
  }

  Container name_phone_data(double maxW) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name(maxW),
          const SizedBox(height: 18),
          phone(maxW),
          // const SizedBox(height: 12),
          podtverjden(),
          // den_rojdenie(maxW),
          // SizedBox(
          //   width: (maxW - 50) / 2,
          //   height: 150,
          // )
        ],
      ),
    );
  }

  Container den_rojdenie(double maxW) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Дата рождения',
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            //   color: black33,
            // ),
            style: ts33_16_600_1,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bithDataTile(maxW, false, '27'),
              bithDataTile(maxW, true, 'Марта'),
              bithDataTile(maxW, true, '1994'),
            ],
          )
        ],
      ),
    );
  }

  Widget bithDataTile(double maxW, bool hasI, String txt) {
    return Container(
      width: (maxW - 24 - 24) / 3,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt,
            // style: const TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w500,
            //   color: black33,
            // ),
            style: ts33_16_500_0,
          ),
          hasI
              ? Icon(
                  Icons.keyboard_arrow_down,
                  size: 12,
                  color: color_green,
                )
              : const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Container podtverjden() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: greyc1,
              borderRadius: BorderRadius.circular(9),
              image: const DecorationImage(
                image: AssetImage('assets/images/podtverjden.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Телефон подтвержден',
            // style: TextStyle(
            //   fontSize: 14,
            //   fontWeight: FontWeight.w400,
            //   fontFamily: 'Gilroy',
            //   // color: Color(0xff878787),
            //   color: grey87,
            // ),
            style: ts87_14_400_0,
          )
        ],
      ),
    );
  }

  Widget name(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Имя', style: ts33_16_600_1),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          // height: 40,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(5),
          ),
          // padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            controller: nameController,
            style: ts33_16_600_1,
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
              //     : null;
              // setState(() {
              //   isWritten = true;
              //   if (nameController.text.isEmpty &&
              //       phoneController.text.isEmpty) {
              //     widget.stButton();
              //     isWritten = false;
              //   }
              // });
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
        ),
      ],
    );
  }

  Widget phone(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Телефон', style: ts33_16_600_1),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          // height: 40,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(5),
          ),
          // padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            controller: phoneController,
            style: ts33_16_600_1,
            keyboardType: TextInputType.phone,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            onChanged: (value) {
              print(phoneController.text);
              // !isWritten
              //     ? nameController.text.isNotEmpty
              //         ? widget.stButton()
              //         : null
              //     : null;
              // setState(() {
              //   isWritten = true;
              //   if (nameController.text.isEmpty &&
              //       phoneController.text.isEmpty) {
              //     widget.stButton();
              //     isWritten = false;
              //   }
              // });
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
        ),
      ],
    );
  }

  Column photo(double maxW) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            'Личные данные',
            // style: TextStyle(
            //   fontSize: 20,
            //   fontWeight: FontWeight.w600,
            //   letterSpacing: 0.5,
            //   color: black11,
            // ),
            style: ts11_20_600_05,
          ),
        ),
        Container(
          width: 120,
          height: 120,
          margin: EdgeInsets.symmetric(horizontal: (maxW - 120 - 24) / 2),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(24),
            // image: const DecorationImage(
            //   image: AssetImage('assets/images/avatarka.png'),
            //   fit: BoxFit.cover,
            // ),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.person,
            size: 90,
            color: black11,
          ),
        ),
      ],
    );
  }
}
