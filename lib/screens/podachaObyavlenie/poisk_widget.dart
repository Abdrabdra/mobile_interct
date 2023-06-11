import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';

Container poisk() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 7),
    child: TextField(
      textCapitalization: TextCapitalization.words,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 13,
          horizontal: 15,
        ),
        hintText: 'Поиск',
        // hintStyle: const TextStyle(
        //   color: black55,
        //   fontSize: 16,
        // ),
        hintStyle: ts55_16_500_0,
        prefixIcon: Container(
          width: 20,
          height: 20,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8),
          child: const Icon(
            CupertinoIcons.search,
            color: black55,
            size: 18,
          ),
        ),
      ),
    ),
  );
}
