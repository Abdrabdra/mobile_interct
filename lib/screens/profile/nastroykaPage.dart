import '../../data/constants/colors.dart';
import '../../screens/profile/appBarCommon.dart';
import '../../screens/profile/nastroyka_body.dart';
import 'package:flutter/material.dart';

class NastroykaPage extends StatefulWidget {
  const NastroykaPage({super.key});

  @override
  State<NastroykaPage> createState() => _NastroykaPageState();
}

class _NastroykaPageState extends State<NastroykaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      extendBody: true,
      backgroundColor: whitef4,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: NastroykaBody(),
      ),
    );
  }
}
