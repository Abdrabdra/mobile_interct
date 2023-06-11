// import '../../screens/single_adv_body.dart/afterPhotoInfo.dart';
import 'package:flutter/material.dart';

import '../../data/constants/textStyles.dart';
import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';

// Color color_green = const Color(0xFF2DC36A);

class NaProverke extends StatelessWidget {
  const NaProverke({super.key, 
  required this.stCanTap, 
  required this.paa});
  
  final PodachaAvtoAdver paa;
  final Function stCanTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 3.2,
      widthFactor: 3.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/proverka_time.png'),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Объявление на проверке',
            // style: TextStyle(
            //   fontSize: 20,
            //   fontWeight: FontWeight.w600,
            //   letterSpacing: 0.8,
            //   color: black11,
            // ),
            style: ts11_20_600_08,
          ),
          const SizedBox(height: 8),
          Text(
            'Продолжительность ожидания\n от 1 минуты до 15 минут',
            textAlign: TextAlign.center,
            // style: TextStyle(
            //   fontSize: 12,
            //   fontWeight: FontWeight.w500,
            //   letterSpacing: 0.8,
            //   // color: Color(0xff878787),
            //   color: grey87,
            // ),
            style: ts87_12_500_0,
          ),
        ],
      ),
    );
  }
}
