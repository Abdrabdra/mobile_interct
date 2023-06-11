import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../data/constants/colors.dart';
import '../../../data/constants/textStyles.dart';

class CategoriesBody extends StatelessWidget {
  // CategoriesBody({super.key, required this.isCategory});

  // late ValueListenable<bool> isCategory;

  // CategoriesBody({required this.onTap});
  // final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/avtoPage');
              },
              child: const CatBody(
                name: 'Объявления',
                icon: Icon(
                  CupertinoIcons.car_detailed,
                  // color: Colors.white,
                  color: white,
                  size: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Flexible(
            child: InkWell(
              onTap: () {
                // Navigator.of(context).pushNamed('/zapchastiPage');
                Navigator.of(context).pushNamed('/avtoPage');
              },
              child: const CatBody(
                name: 'Главная',
                icon: Icon(
                  CupertinoIcons.battery_charging,
                  // color: Colors.white,
                  color: white,
                  size: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 18),
          Flexible(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/podachaObyavlenie');
              },
              child: const CatBody(
                name: 'Подать',
                icon: Icon(
                  CupertinoIcons.plus,
                  // color: Colors.white,
                  color: white,
                  size: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatBody extends StatelessWidget {
  const CatBody({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);
  final String name;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return
        //
        // Flexible(
        // width: double.infinity,
        // height: 74,
        // width: 110,
        // child:
        //
        Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        color: white,

        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 28,
            decoration: BoxDecoration(
              // color: const Color(0xFF333333),
              color: black33,
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: icon,
          ),
          Text(
            name,
            // style: const TextStyle(
            //   fontSize: 10,
            //   // height: 20,
            //   fontWeight: FontWeight.w500,
            //   fontFamily: 'Gilroy',
            //   letterSpacing: 1,
            //   // color: Colors.black,
            //   color: black11,
            // ),
            style: ts11_10_600_1,
          )
        ],
      ),
      // ),
    );
  }
}
