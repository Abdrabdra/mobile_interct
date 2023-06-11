import '../../data/constants/textStyles.dart';

import '../../data/constants/colors.dart';
import 'package:flutter/material.dart';

TextStyle ts = const TextStyle(
  // color: Colors.white,
  color: whitef4,
  fontSize: 16,
  fontWeight: FontWeight.w600,
  fontFamily: 'Gilroy',
);
AppBar chatAppBar(BuildContext context, String text) {
  return AppBar(
    toolbarHeight: 60,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
    ),
    automaticallyImplyLeading: false,
    leading: InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        // height: 16,
        margin: const EdgeInsets.only(left: 12, bottom: 12, right: 0, top: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          // color: whitef4,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_left,
          // size: 24,
          // color: Color(0xFF2DC36A),
          color: color_green,
        ),
      ),
    ),
    // actions: [
    //   Container(
    //     margin: const EdgeInsets.only(right: 12, bottom: 12, top: 16),
    //     child: const SizedBox(
    //       width: 32,
    //       height: 32,
    //       child: Icon(
    //         Icons.share,
    //         size: 18,
    //         color: Color(0xff2DC36A),
    //       ),
    //     ),
    //   )
    // ],
    // backgroundColor: const Color(0xFF111111),
    backgroundColor: black11,
    title: Container(
      margin: const EdgeInsets.only(top: 24.5, bottom: 20.5),
      child: Row(
        children: [
          Text(
            'Назад',
            // style: ts,
            style: tsf4_16_600_0,
          ),
          Container(
            height: 26,
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: 14),
            // color: Color(0xff878787),
            color: grey87,
          ),
          // Container(
          //   width: 32,
          //   height: 32,
          //   margin: EdgeInsets.only(right: 16),
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/avatarka.png'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Text(
            text,
            // style: ts,
            style: tsf4_16_600_0,
          ),
        ],
      ),
    ),
  );
}
