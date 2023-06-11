import '../../data/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../data/constants/textStyles.dart';

AppBar PodachaObyavlenieAppBar(BuildContext context, String name) {
  return AppBar(
    toolbarHeight: 60,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
    ),
    automaticallyImplyLeading: false,
    leading: InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
      child: Container(
        // height: 16,
        margin: const EdgeInsets.only(left: 12, bottom: 12, right: 0, top: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
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
    backgroundColor: const Color(0xFF111111),
    title: Container(
      margin: const EdgeInsets.only(top: 24.5, bottom: 20.5),
      child: Text(
        // 'Выберите марку',
        name,
        // style: TextStyle(
        //   color: Colors.white,
        //   fontSize: 16,
        //   fontWeight: FontWeight.w600,
        //   fontFamily: 'Gilroy',
        // ),
        style: tswh_16_600_0,
      ),
    ),
  );
}
