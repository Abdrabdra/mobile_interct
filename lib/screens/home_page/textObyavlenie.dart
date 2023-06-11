import 'package:flutter/material.dart';

import '../../data/constants/textStyles.dart';

class TextObyavleniya extends StatelessWidget {
  const TextObyavleniya({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(top: 4),
      child: Text(
        'Объявления',
        // style: TextStyle(
        //   fontFamily: 'Gilroy',
        //   fontStyle: FontStyle.normal,
        //   fontWeight: FontWeight.w500,
        //   fontSize: 20,
        //   // height: 20,
        //   letterSpacing: 1,
        //   // color: Color(0xFF000000),
        //   color: black11,
        // ),
        style: ts11_20_500_1,
      ),
    );
  }
}
