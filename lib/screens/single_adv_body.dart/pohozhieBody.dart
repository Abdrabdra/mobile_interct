import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';

// TextStyle ts = const TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w600,
//   letterSpacing: 0.64,
//   fontFamily: 'Gilroy',
//   color: black11,
// );

// Color black33 = const Color(0xff333333);
// Color color_green = const Color(0xFF2DC36A);

Container pohozhie() {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Похожие объявления',
          style: ts11_16_600_06,
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (i) {
                return Container(
                    width: 160,
                    // height: 200,
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/flags/kz.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            '2017г.',
                            // style: TextStyle(
                            //   fontSize: 10,
                            //   fontWeight: FontWeight.w600,
                            //   // color: Color(0xFF555555),
                            //   color: grey87,
                            //   fontFamily: 'Gilroy-Medium',
                            //   letterSpacing: 0.8,
                            // ),
                            style: ts87_10_600_08,
                          ),
                        ),
                        Text(
                          'BMW M5',
                          // style: TextStyle(
                          //   fontSize: 12,
                          //   fontWeight: FontWeight.w600,
                          //   letterSpacing: 0.8,
                          //   fontFamily: 'Gilroy',
                          //   color: black33,
                          // ),
                          style: ts33_12_600_08,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            '17 000 000 KZT',
                            // style: TextStyle(
                            //   fontSize: 12,
                            //   fontWeight: FontWeight.w600,
                            //   letterSpacing: 0.8,
                            //   fontFamily: 'Gilroy',
                            //   color: color_green,
                            // ),
                            style: tsgr_12_600_08,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Подробнее',
                              // style: TextStyle(
                              //   fontSize: 12,
                              //   fontWeight: FontWeight.w500,
                              //   letterSpacing: 0.8,
                              //   fontFamily: 'Gilroy',
                              //   color: black33,
                              // ),
                              style: ts33_12_500,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              alignment: Alignment.center,
                              // padding: EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: black33,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.chevron_right,
                                color: color_green,
                                size: 14,
                              ),
                            )
                          ],
                        )
                      ],
                    ));
              },
            ),
          ),
        )
      ],
    ),
  );
}
