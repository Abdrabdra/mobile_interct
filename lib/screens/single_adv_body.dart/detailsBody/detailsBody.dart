import '../../../data/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../data/constants/textStyles.dart';

// TextStyle ts = const TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w600,
//   letterSpacing: 0.64,
//   fontFamily: 'Gilroy',
//   color: black11,
// );

// Color black33 = const Color(0xff333333);
// Color color_green = const Color(0xFF2DC36A);
// Color color_grey = const Color(0xFF878787);

SizedBox detailsBody(List details, List details_otvet) {
  return SizedBox(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        detailsInfoBody(details, details_otvet),
        // opisanieBody(opisanie),
        // OpisanieBody(opisanie: opisanie),
        // opsii_character(options),
      ],
    ),
  );
}

Container opsii_character(List options) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Опции и характеристики',
          style: ts11_16_600_06,
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 10,
          runSpacing: 8,
          children: List.generate(
            options.length,
            (i) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  // color: const Color(0xffF0F0F0),
                  color: greyf0,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  options[i],
                  // style: TextStyle(
                  //   fontSize: 12,
                  //   fontWeight: FontWeight.w600,
                  //   letterSpacing: 0.8,
                  //   fontFamily: 'Gilroy',
                  //   color: black33,
                  // ),
                  style: ts33_12_600_08,
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

class OpisanieBody extends StatefulWidget {
  const OpisanieBody({
    Key? key,
    required this.opisanie,
  }) : super(key: key);
  final String opisanie;

  @override
  State<OpisanieBody> createState() => _OpisanieBodyState();
}

bool _isHiden = true;

class _OpisanieBodyState extends State<OpisanieBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Описание продовца',
            style: ts11_16_600_06,
          ),
          const SizedBox(height: 8),
          // ExpandableText(
          //   widget.opisanie,
          //   trimLines: 3,
          // ),
          Text(
            widget.opisanie,
            maxLines: _isHiden ? 3 : null,
            style: ts87_14_400_1,
          ),
          widget.opisanie.length > 100
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isHiden = !_isHiden;
                    });
                  },
                  child: Text(
                    _isHiden ? "Ещё..." : "Скрыть",
                    style: tsgr_14_500_0,
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}

// Container opisanieBody(String opisanie) {
//   return Container(
//     width: double.infinity,
//     padding: const EdgeInsets.all(16),
//     margin: const EdgeInsets.symmetric(vertical: 6),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Описание продовца',
//           style: ts11_16_600_06,
//         ),
//         const SizedBox(height: 8),
//         ExpandableText(
//           opisanie,
//           trimLines: 3,
//         ),
//       ],
//     ),
//   );
// }

Container detailsInfoBody(List details, List detailsOtwet) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: details
          .map(
            (i) => SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          i,
                          // style: const TextStyle(
                          //   fontSize: 14,
                          //   fontWeight: FontWeight.w400,
                          //   letterSpacing: 0.8,
                          //   color: greyc1,
                          //   fontFamily: 'Gilroy',
                          // ),
                          style: tsc1_14_400_08,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(right: 3),
                        child: Text(
                          detailsOtwet[details.indexOf(i)],
                          // style: const TextStyle(
                          //   fontSize: 14,
                          //   fontWeight: FontWeight.w500,
                          //   letterSpacing: 0.8,
                          //   color: black11,
                          //   fontFamily: 'Gilroy',
                          // ),
                          style: ts11_14_500_08,
                        ),
                      )),
                    ],
                  ),
                  details.last != i
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: const Divider(
                            thickness: 1,
                            color: greyf0,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          )
          .toList(),
    ),
  );
}
