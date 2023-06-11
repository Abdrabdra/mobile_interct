import 'package:interct_2/data/constants/sized_boxes.dart';

import '../../data/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../data/constants/textStyles.dart';
import '../../widgets/bottom_nav_bar.dart';
// import 'chat_list_page_body.dart';

class HomeChatListPage extends StatefulWidget {
  const HomeChatListPage({super.key});

  @override
  State<HomeChatListPage> createState() => _HomeChatListPageState();
}

class _HomeChatListPageState extends State<HomeChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      extendBody: true,
      // backgroundColor: const Color(0xffF1F2F2),
      backgroundColor: whitef4,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        // child: ChatListPageBody(),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Icon(
              Icons.mail_outline,
              color: black11,
              size: 36,
            ),
            sb_h10(),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                'У вас нет сообщение',
                style: ts11_14_500_08,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        maxWidth: MediaQuery.of(context).size.width,
        selectedIndex: 3,
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
        //   // color: Colors.white,
        //   color: whitef4,
        // ),
        style: tsf4_24_500_328,
      ),
    );
  }
}
