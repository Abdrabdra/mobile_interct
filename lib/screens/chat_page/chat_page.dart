// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:interct_2/data/models/single_avto_adv_model.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../../screens/chat_page/chat_app_bar.dart';

// TextStyle tsDate = const TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w500,
//   // color: Color(0xff878787),
//   color: grey87,
//   letterSpacing: 0.8,
// );
// TextStyle tsClientLetterText = const TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w400,
//   // color: Colors.black54,
//   color: black11,
//   letterSpacing: 0.8,
//   fontFamily: 'Proxima Nova',
// );
// TextStyle tsAuthorsLetterText = const TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w400,
//   // color: Colors.white,
//   color: whitef4,
//   letterSpacing: 0.8,
//   fontFamily: 'Proxima Nova',
// );
// TextStyle tsLetterTime = const TextStyle(
//   fontSize: 12,
//   fontWeight: FontWeight.w400,
//   // color: Color(0xff878787),
//   color: grey87,
//   letterSpacing: 0.8,
//   fontFamily: 'Proxima Nova',
// );
Radius rd = const Radius.circular(5);
// Color color_green = const Color(0xFF2DC36A);
TextEditingController textEditingController = TextEditingController();

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.saam,
  }) : super(key: key);
  final SingleAvtoAdvModel saam;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    double maxW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: chatAppBar(
        context,
        '${widget.saam.cityFrom} - ${widget.saam.cityTo}',
      ),
      extendBody: true,
      // backgroundColor: const Color(0xffF1F2F2),
      backgroundColor: whitef4,
      body: pageBody(maxW),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: inputTextBody(maxW),
    );
  }

  Container inputTextBody(double maxW) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      // color: Colors.white,
      color: white,
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: maxW - 44 - 32 - 14,
            // decoration: BoxDecoration(
            //   color: Color(0xffF0F0F0),
            //   borderRadius: BorderRadius.circular(12),
            // ),
            child: TextField(
              keyboardType: TextInputType.text,
              // style: tsDate,
              style: ts87_16_500_08,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: 'Напишите сообщение...',
                // hintStyle: tsDate,
                hintStyle: ts87_16_500_08,
                filled: true,
                // fillColor: const Color(0xffF0F0F0),
                fillColor: greyf0,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  // borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/sendIcon.png'),
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }

  Padding pageBody(double maxW) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 75),
      child: GestureDetector(
        onTap: () {
          // FocusScopeNode currentFocus = FocusScope.of(context);
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Center(
            heightFactor: 5,
            child: Text(
              'У Вас нет сообщение',
              style: ts11_16_600_06,
            ),
          ),
          // child: Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       // Expanded(child: SizedBox()),
          //       Container(
          //         margin: const EdgeInsets.symmetric(vertical: 20),
          //         width: maxW - 24,
          //         child: Text(
          //           '27 сентября',
          //           // style: tsDate,
          //           style: ts87_16_500_08,
          //           textAlign: TextAlign.center,
          //         ),
          //       ),
          //       Column(
          //         children: List.generate(
          //           7,
          //           (index) => Column(
          //             children: [
          //               letterTile(maxW, false),
          //               letterTile(maxW, true),
          //             ],
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }

  Column letterTile(double maxW, bool isAuthors) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: (maxW - 24) * 0.75,
          margin: EdgeInsets.only(
            right: isAuthors ? 0 : (maxW - 24) / 4,
            left: !isAuthors ? 0 : (maxW - 24) / 4,
            bottom: 16,
          ),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            // color: isAuthors ? color_green : Colors.white,
            color: isAuthors ? color_green : whitef4,
            borderRadius: BorderRadius.only(
              topLeft: isAuthors ? rd : const Radius.circular(0),
              topRight: !isAuthors ? rd : const Radius.circular(0),
              bottomLeft: rd,
              bottomRight: rd,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  'Здравствуйте! Интересуетесь ли машиной?',
                  // style: isAuthors ? tsAuthorsLetterText : tsClientLetterText,
                  style: isAuthors ? tsf4_16_400_08 : ts11_16_400_08,
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    '10:45',
                    // style: tsLetterTime,
                    style: ts87_12_400_08,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
