import 'package:interct_2/data/models/userme_model.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../../screens/profile/appBarCommon.dart';
import '../../screens/profile/lichnye_body.dart';
import 'package:flutter/material.dart';

class LichnyeDannye extends StatefulWidget {
  const LichnyeDannye({super.key, required this.umm});
  final UserMeModel umm;
  @override
  State<LichnyeDannye> createState() => _LichnyeDannyeState();
}

class _LichnyeDannyeState extends State<LichnyeDannye> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      extendBody: true,
      // backgroundColor: const Color(0xffF1F2F2),
      backgroundColor: whitef4,
      floatingActionButton: elevButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: LichnyeBody(umm: widget.umm),
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
