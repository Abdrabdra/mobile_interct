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
//   // color: Color(0xFF333333),
//   color: black33,
// );
int countPhone = 1;

TextEditingController staryiParolController =
    TextEditingController(text: '123');
TextEditingController novyiController = TextEditingController();
TextEditingController novyiPodtverjController = TextEditingController();
// Color color_green = const Color(0xff2DC36A);

class IzmenenieParolBody extends StatefulWidget {
  const IzmenenieParolBody({super.key});

  @override
  State<IzmenenieParolBody> createState() => _IzmenenieParolBodyState();
}

class _IzmenenieParolBodyState extends State<IzmenenieParolBody> {
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
            txtParol(),
            izmenenieParolinputs(maxW),
          ],
        ),
      ),
    );
  }

  Container txtParol() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        'Изменить пароль',
        // style: TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.w600,
        //   letterSpacing: 0.5,
        //   color: black11,
        // ),
        style: ts11_20_600_05,
      ),
    );
  }

  Container izmenenieParolinputs(double maxW) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          staryiParol(maxW),
          const SizedBox(height: 18),
          novyiParol(maxW),
          const SizedBox(height: 18),
          podtverjdenieParol(maxW),
          // SizedBox(
          //   width: (maxW - 50) / 2,
          //   height: 150,
          // )
        ],
      ),
    );
  }

  Widget podtverjdenieParol(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Подтвердить пароль', style: ts33_16_600_1),
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
            controller: novyiPodtverjController,
            style: ts33_16_600_1,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            onChanged: (value) {
              print(novyiPodtverjController.text);
              // !isWritten
              //     ? staryiParolController.text.isNotEmpty
              //         ? widget.stButton()
              //         : null
              //     : null;
              // setState(() {
              //   isWritten = true;
              //   if (staryiParolController.text.isEmpty &&
              //       novyiController.text.isEmpty) {
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

  Widget staryiParol(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ваш пароль', style: ts33_16_600_1),
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
            controller: staryiParolController,
            style: ts33_16_600_1,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            onChanged: (value) {
              print(staryiParolController.text);
              // !isWritten
              //     ? staryiParolController.text.isNotEmpty
              //         ? widget.stButton()
              //         : null
              //     : null;
              // setState(() {
              //   isWritten = true;
              //   if (staryiParolController.text.isEmpty &&
              //       novyiController.text.isEmpty) {
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

  Widget novyiParol(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Новый пароль', style: ts33_16_600_1),
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
            controller: novyiController,
            style: ts33_16_600_1,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            //   FilteringTextInputFormatter.digitsOnly
            // ],
            onChanged: (value) {
              print(novyiController.text);
              // !isWritten
              //     ? staryiParolController.text.isNotEmpty
              //         ? widget.stButton()
              //         : null
              //     : null;
              // setState(() {
              //   isWritten = true;
              //   if (staryiParolController.text.isEmpty &&
              //       novyiController.text.isEmpty) {
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
}
