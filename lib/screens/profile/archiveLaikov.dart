import '../../data/constants/textStyles.dart';
import '../../screens/profile/appBarCommon.dart';
import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
// import 'bakKartyBody.dart';

class ArchiveLaikovPage extends StatefulWidget {
  const ArchiveLaikovPage({super.key});

  @override
  State<ArchiveLaikovPage> createState() => _ArchiveLaikovPageState();
}

class _ArchiveLaikovPageState extends State<ArchiveLaikovPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      extendBody: true,
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
                children: [
                  txtArchive(),
                ],
              ),
              // const AdvertisementBody(isCar: true),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    10,
                    // (index) => AdvertisementTile(isCar: true),
                    (index) => SizedBox(),
                  ),
                ),
              ),
              SizedBox(height: 60)
            ],
          ),
        ),
      ),
      floatingActionButton: elevButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget txtArchive() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Архив лайков',
            // style: TextStyle(
            //   fontSize: 20,
            //   fontWeight: FontWeight.w600,
            //   letterSpacing: 0.5,
            //   color: black11,
            // ),
            style: ts11_20_600_05,
          ),
          Text(
            '20 176 лайков',
            // style: TextStyle(
            //   fontSize: 14,
            //   fontWeight: FontWeight.w600,
            //   letterSpacing: 0.5,
            //   // color: Color(0xff878787),
            //   color: grey87,
            // ),
            style: ts87_14_600_05,
          ),
        ],
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
