import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../../screens/profile/appBarCommon.dart';
import 'package:flutter/material.dart';

import 'izmeneieParolBody.dart';

class IzmenenieParol extends StatefulWidget {
  const IzmenenieParol({super.key});

  @override
  State<IzmenenieParol> createState() => _IzmenenieParolState();
}

class _IzmenenieParolState extends State<IzmenenieParol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      extendBody: true,
      backgroundColor: whitef4,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: IzmenenieParolBody(),
      ),
      floatingActionButton: elevButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
