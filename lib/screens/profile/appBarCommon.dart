import '../../data/constants/textStyles.dart';

import '../../data/constants/colors.dart';
import 'package:flutter/material.dart';

AppBar profileAppBar(BuildContext context) {
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
          color: whitef4,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_left,
          // size: 24,
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
    backgroundColor: black11,
    title: Container(
      margin: const EdgeInsets.only(top: 24.5, bottom: 20.5),
      child: Text(
        'Назад',
        // style: TextStyle(
        //   color: whitef4,
        //   fontSize: 16,
        //   fontWeight: FontWeight.w600,
        //   fontFamily: 'Gilroy',
        // ),
        style: tsf4_16_600_0,
      ),
    ),
  );
}
