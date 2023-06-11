import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';

import '../../screens/profile/appBarCommon.dart';
import '../../screens/single_adv_body.dart/homeSingleAdv.dart';
import 'package:flutter/material.dart';


int selectedIndex = 1;

BoxDecoration bd = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(8),
);

class MoiObyavleniePage extends StatefulWidget {
  const MoiObyavleniePage({super.key});

  @override
  State<MoiObyavleniePage> createState() => _MoiObyavleniePageState();
}

class _MoiObyavleniePageState extends State<MoiObyavleniePage> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: profileAppBar(context),
      extendBody: true,
      // backgroundColor: const Color(0xffF1F2F2),
      backgroundColor: whitef4,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  txtMoiObyav(),
                  sostoyania(maxWidth),
                  if (selectedIndex == 1) naProverkeObyavlenii(),
                  if (selectedIndex == 2) archivnyeObyavlenie(context),
                  if (selectedIndex == 3) zablokirovannyeObyavlenie(context),
                ],
              ),
              // const AdvertisementBody(isCar: true),
              SizedBox(height: 60)
            ],
          ),
        ),
      ),
      floatingActionButton: elevButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Column zablokirovannyeObyavlenie(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/singleAdv',
              arguments: SingleAdvPage(isAuthors: true, id: 0),
            );
          },
          child: Stack(
            children: [
              // AdvertisementTile(
              //   isCar: true,
              //   isAuthors: true,
              //   isThunder: false,
              //   dataIli: 'Заблокирован',
              // ),
              SizedBox(),
              Container(
                width: double.infinity,
                height: 146,
                color: Colors.white.withOpacity(0.3),
                // child:
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/singleAdv',
              arguments: SingleAdvPage(isAuthors: true, id: 0),
            );
          },
          child: Stack(
            children: [
              // AdvertisementTile(
              //   isCar: true,
              //   isAuthors: true,
              //   isThunder: false,
              //   dataIli: 'Заблокирован',
              // ),
              SizedBox(),
              Container(
                width: double.infinity,
                height: 146,
                color: Colors.white.withOpacity(0.3),
                // child:
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column archivnyeObyavlenie(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/singleAdv',
              arguments: SingleAdvPage(isAuthors: true, id: 0),
            );
          },
          child: Stack(
            children: [
              // AdvertisementTile(
              //   isCar: true,
              //   isAuthors: true,
              //   isThunder: false,
              //   dataIli: 'Удален',
              // ),
              SizedBox(),
              Container(
                width: double.infinity,
                height: 146,
                color: Colors.white.withOpacity(0.3),
                // child:
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/singleAdv',
              arguments: SingleAdvPage(isAuthors: true, id: 0),
            );
          },
          child: Stack(
            children: [
              // AdvertisementTile(
              //   isCar: true,
              //   isAuthors: true,
              //   isThunder: false,
              //   dataIli: 'Удален',
              // ),
              Container(
                width: double.infinity,
                height: 146,
                color: Colors.white.withOpacity(0.3),
                // child:
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column naProverkeObyavlenii() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // AdvertisementTile(
        //   isCar: true,
        //   isAuthors: true,
        //   isThunder: false,
        //   dataIli: 'На проверке',
        // ),
        // AdvertisementTile(
        //   isCar: true,
        //   isAuthors: true,
        //   isThunder: false,
        //   dataIli: 'На проверке',
        // ),
      ],
    );
  }

  Container sostoyania(double maxWidth) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 10),
      width: double.infinity,
      // height: 44,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 44,
            // width: double.infinity,
            padding: const EdgeInsets.all(4),
            decoration: bd,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sostChoiceContainer(1, 'На проверке', maxWidth),
                  sostChoiceContainer(2, 'Архивные', maxWidth),
                  sostChoiceContainer(3, 'Заблокированные', maxWidth),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sostChoiceContainer(int i, String name, double maxWidth) {
    bool isSel = i == selectedIndex;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = i;
        });
      },
      child: Container(
        // height: 36,
        // width: 155,
        width: (maxWidth - 8 - 40 - 20) / 2,

        // padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSel ? black33 : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            name,
            // style: TextStyle(
            //   fontFamily: 'Gilroy',
            //   fontStyle: FontStyle.normal,
            //   fontWeight: isSel ? FontWeight.w600 : FontWeight.w400,
            //   fontSize: 14,
            //   // height: 20,
            //   letterSpacing: -0.16,
            //   color: isSel ? Colors.white : black33,
            // ),
            style: isSel ? tsf4_14_600_01 : ts33_14_400_01,
          ),
        ),
      ),
    );
  }

  Widget txtMoiObyav() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 0),
      child: Text(
        'Мои объявления',
        // style: TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.w600,
        //   letterSpacing: 0.5,
        //   color: black11,
        // ),
        style: ts11_20_600_05,
      ),
    );
  }

  ElevatedButton elevButton(BuildContext context) {
    return ElevatedButton(
      autofocus: true,
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width - 24,
        decoration: BoxDecoration(
          color: color_green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'Сохранить',
          textAlign: TextAlign.center,
          // style: TextStyle(
          //   fontSize: 20,
          //   fontWeight: FontWeight.w600,
          //   color: whitef4,
          // ),
          style: tsf4_20_600_0,
        ),
      ),
    );
  }
}
