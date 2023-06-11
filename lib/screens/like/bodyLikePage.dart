import 'package:flutter/material.dart';
import '../../data/constants/colors.dart';

import '../../data/constants/textStyles.dart';
import 'photoCarouselLike.dart';

class BodyLikePage extends StatefulWidget {
  const BodyLikePage({super.key});

  @override
  State<BodyLikePage> createState() => _BodyLikePageState();
}

// Color color_green = const Color(0xFF2DC36A);
bool isSold = false;
double iconSize = 24;

class _BodyLikePageState extends State<BodyLikePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSold = false;
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: List.generate(
            10,
            (index) => abyavlenieTile(maxWidth),
          ),
        ),
      ),
    );
  }

  Widget abyavlenieTile(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // info sverhu obyavleniya
        topInfo(),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/singleAdv');
          },
          child: PhotoCarouselLike(maxWidth: maxWidth),
        ),
        bottomInfo(),
        timeBody()
      ],
    );
  }

  Container timeBody() {
    return Container(
      margin: const EdgeInsets.only(left: 12, bottom: 12),
      child: Text(
        '13 часов назад',
        // style: TextStyle(
        //   fontSize: 12,
        //   fontWeight: FontWeight.w400,
        //   // color: Color(0xff878787),
        //   color: grey87,
        // ),
        style: ts87_12_400_0,
      ),
    );
  }

  Widget bottomInfo() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 10, 13, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          like_comment(),
          const Icon(
            Icons.share,
            size: 22,
            // color: color_green,
            color: color_green,
          ),
        ],
      ),
    );
  }

  Row like_comment() {
    return Row(
      children: [
        // like body
        Row(
          children: [
            const Icon(
              Icons.favorite_border,
              size: 22,
              // color: color_green,
              color: color_green,
            ),
            const SizedBox(width: 12),
            Text(
              '336',
              // style: TextStyle(
              //   fontSize: 16,
              //   fontWeight: FontWeight.w500,
              //   color: color_green,
              // ),
              style: tsgr_16_500_0,
            )
          ],
        ),
        const SizedBox(width: 21),

        // comment body
        Row(
          children: [
            // Icon(
            //   Icons.comment,
            //   size: 22,
            //   // color: color_green,
            //   color: color_green,
            // ),
            const SizedBox(
              width: 22,
              height: 22,
              child: Image(
                image: AssetImage('assets/images/comment_icon.png'),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '13',
              // style: TextStyle(
              //   fontSize: 16,
              //   fontWeight: FontWeight.w500,
              //   color: color_green,
              // ),
              style: tsgr_16_500_0,
            )
          ],
        ),
      ],
    );
  }

  Container topInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //// imya avtora i machiny
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/like_author_icon_1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Lexus LF LC 500',
                  // style: TextStyle(
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.w600,
                  //   // color: Colors.black,
                  //   color: black11,
                  // ),
                  style: ts11_14_600_0,
                ),
              )
            ],
          ),
          // kupit' ili uje prodano
          InkWell(
            onTap: () {
              setState(() {
                isSold = !isSold;
              });
            },
            child: Container(
              child: isSold
                  ? Text(
                      'Продано',
                      textAlign: TextAlign.center,
                      // style: TextStyle(
                      //   fontSize: 14,
                      //   fontWeight: FontWeight.w500,
                      //   // color: Color(0xff878787),
                      //   color: grey87,
                      // ),
                      style: ts87_14_500_0,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Купить',
                          // textAlign: TextAlign.center,
                          // style: TextStyle(
                          //   fontSize: 14,
                          //   fontWeight: FontWeight.w500,
                          //   // color: Color(0xff2DC36A),
                          //   color: color_green,
                          // ),
                          style: tsgr_14_500_0,
                        ),
                        // SizedBox(width: 8),
                        const Center(
                          child: Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: color_green,
                          ),
                        )
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
