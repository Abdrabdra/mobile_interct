import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import 'package:flutter/material.dart';

// Color color_grey = const Color(0xff999999);
// Color color_green = const Color(0xff2DC36A);
EdgeInsets marginV10 = const EdgeInsets.symmetric(vertical: 10);
EdgeInsets padAl16 = const EdgeInsets.all(16);
// TextStyle tsNameClient = const TextStyle(
//   fontSize: 18,
//   fontWeight: FontWeight.w600,
//   // color: Color(0xff333333),
//   color: black33,
// );
// TextStyle tsLetterTextNotRead = const TextStyle(
//   fontSize: 14,
//   fontWeight: FontWeight.w600,
//   // color: Color(0xff333333),
//   color: black33,
// );
// TextStyle tsLetterTextRead = const TextStyle(
//   fontSize: 14,
//   fontWeight: FontWeight.w400,
//   // color: Color(0xff878787),
//   color: grey87,
// );
// TextStyle tsNameObyavlenie = const TextStyle(
//   fontSize: 12,
//   fontWeight: FontWeight.w500,
//   // color: Color(0xff878787),
//   color: grey87,
// );
// TextStyle tstime = const TextStyle(
//   fontSize: 12,
//   fontWeight: FontWeight.w400,
//   // color: Color(0xff999999),
//   color: grey87,
// );

class ChatListPageBody extends StatefulWidget {
  const ChatListPageBody({super.key});

  @override
  State<ChatListPageBody> createState() => _ChatListPageBodyState();
}

class _ChatListPageBodyState extends State<ChatListPageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 24, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            8,
            (index) => letterTile(
              index == 7 ? true : false,
              index % 2 == 0 ? true : false,
            ),
          ).toList(),
        ),
      ),
    );
  }

  Widget letterTile(bool isLast, bool isReaden) {
    return Column(
      children: [
        // letter body
        InkWell(
          onTap: () {
            print('Pressed letter tile');
            Navigator.of(context).pushNamed('/chat');
          },
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    // avatarka
                    avatarka(isReaden),
                    const SizedBox(width: 16),
                    Flexible(child: name_text(isReaden)),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              time(),
            ],
          ),
        ),
        !isLast
            ? Container(
                width: double.infinity,
                height: 0.7,
                margin:
                    const EdgeInsets.symmetric(horizontal: 43, vertical: 10),
                // color: Color(0xff878787),
                color: greyc1,
              )
            : const SizedBox()
      ],
    );
  }

  Text time() {
    return Text(
      '14:20',
      // style: tstime,
      style: ts87_12_400_0,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget name_text(bool isRead) {
    return Container(
      // width: MediaQuery.of(context).size.width - 24 - 65 - 16 - 40,
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lexus LF LC 500',
            // style: tsNameObyavlenie,
            style: ts87_12_500_0,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Text(
            'Акжол',
            // style: tsNameClient,
            style: ts33_18_600_0,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            'Вам нужно принять препа hsd mknsdFJDN',
            // style: isRead ? tsLetterTextRead : tsLetterTextNotRead,
            style: isRead ? ts87_14_400_0 : ts33_14_600_0,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Stack avatarka(bool isRead) {
    return Stack(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/avatarka.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        isRead
            ? const SizedBox()
            : const Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.circle,
                  size: 8,
                  color: color_green,
                ),
              ),
      ],
    );
  }
}
