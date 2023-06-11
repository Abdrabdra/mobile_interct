import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../../screens/profile/bodyProfile.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_nav_bar.dart';

class HomeProfilePage extends StatefulWidget {
  const HomeProfilePage({super.key});

  @override
  State<HomeProfilePage> createState() => _HomeProfilePageState();
}

class _HomeProfilePageState extends State<HomeProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      extendBody: true,
      // backgroundColor: const Color(0xffF1F2F2),
      backgroundColor: whitef4,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: BodyProfilePage(),
      ),
      bottomNavigationBar: BottomNavBar(
        maxWidth: MediaQuery.of(context).size.width,
        selectedIndex: 4,
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 62,
      automaticallyImplyLeading: false,
      // backgroundColor: const Color(0xFF111111),
      backgroundColor: black11,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      centerTitle: true,
      title: Text(
        'Avto-Like'.toUpperCase(),
        // style: const TextStyle(
        //   fontSize: 24,
        //   fontWeight: FontWeight.w500,
        //   letterSpacing: 3.28,
        //   color: whitef4,
        // ),
        style: tsf4_24_500_328,
      ),
    );
  }
}
