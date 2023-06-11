import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
// import 'package:flutter_shopping_app/src/screens/home/components/camera_app.dart';

class SearchBox extends StatelessWidget {
  // const SearchBox({
  //   required this.onChanged,
  // }) : super();
  // final ValueChanged onChanged;

  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      alignment: Alignment.centerRight,
      child: TextField(
        textCapitalization: TextCapitalization.words,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          // fillColor: Colors.white,
          fillColor: whitef4,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
          hintText: 'Поиск',
          // hintStyle: const TextStyle(color: Color(0xFFADADAD), fontSize: 16),
          hintStyle: tsc1_16_500_0,
          suffixIcon: InkWell(
            child: Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              // padding: EdgeInsets.all(12),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: const Color(0xFF222222),
                color: black11,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                CupertinoIcons.search,
                // color: Colors.white,
                color: whitef4,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
