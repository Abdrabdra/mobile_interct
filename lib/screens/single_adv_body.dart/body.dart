// import '../../../data/constants.dart/colors.dart';
// import '../../screens/home_page/advertisement_list.dart';
// import '../../screens/home_page/carousel_body.dart';
// import '../../screens/home_page/result_search_text.dart';
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:interct_2/data/constants/colors.dart';
import 'package:interct_2/data/constants/sized_boxes.dart';

import '../../../data/models/single_avto_adv_model.dart';
import '../../screens/single_adv_body.dart/afterPhotoInfo.dart';
import '../../screens/single_adv_body.dart/detail_comment_body.dart';
import '../../screens/single_adv_body.dart/photoCarousel.dart';
import 'package:flutter/material.dart';

import '../../data/constants/textStyles.dart';
import 'zabron_page.dart';

// import 'categories_body.dart';
// import 'foundedAdvers.dart';
// import 'textObyavlenie.dart';

// ignore: must_be_immutable
class SingleAdvBody extends StatefulWidget {
  SingleAdvBody({
    super.key,
    this.isAuthors,
    required this.saam,
  }) {
    isAuthors = isAuthors ?? false;
  }
  bool? isAuthors;
  final SingleAvtoAdvModel saam;

  // late bool isSearches;
  @override
  State<SingleAdvBody> createState() => _SingleAdvBodyState();
}

class _SingleAdvBodyState extends State<SingleAdvBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 12),
              PhotoCarousel(
                imageUrls: widget.saam.imageUrls,
              ),
              // !widget.isAuthors! ? AfterPhotoBody(widget.saam) : SizedBox(),
              // namePrice(widget.saam),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: maxWidth(context) - 28 - 10 - 140 - 24,
                          child: Text(
                            '${widget.saam.cityFrom} - ${widget.saam.cityTo}',
                            style: ts11_14_600_0,
                          ),
                        ),
                        sb_h6(),
                        SizedBox(
                          width: maxWidth(context) - 28 - 10 - 140 - 24,
                          child: Text(
                            '${widget.saam.price} KZT',
                            style: tsgr_14_700_08,
                          ),
                        ),
                      ],
                    ),
                    sb_w10(),
                    InkWell(
                      onTap: () {
                        print('Tapped Zabron');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ZabronPage(saam: widget.saam);
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: 140,
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 6),
                        decoration: BoxDecoration(
                          color: green300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Забронировать',
                          style: tswh_16_600_0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Detail_Comment_Body(
                saam: widget.saam,
              ),
              // CategoriesBody(),
              // TextObyavleniya(),
            ],
          ),
          // Container(width: 150, height: 50, color: Colors.black),
          // AdvertisementBody(),
        ],
      ),
    );
  }

  double maxWidth(BuildContext context) => MediaQuery.of(context).size.width;
}

Widget namePrice(SingleAvtoAdvModel saam) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.only(right: 45),
                child: Text(
                  'Lexus LF LC 500',
                  // '${saam.raionFrom} ${saam.raionTo}',
                  maxLines: 1,
                  softWrap: true,
                  // style: TextStyle(
                  //   fontSize: 20,
                  //   overflow: TextOverflow.ellipsis,
                  //   color: black11,
                  //   fontWeight: FontWeight.w700,
                  //   fontFamily: 'Gilroy',
                  //   letterSpacing: 0.8,
                  // ),
                  style: ts11_20_700_08_el,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          // '20 000 000KZT',
          '${saam.price}KZT',
          // style: TextStyle(
          //   color: color_green,
          //   fontSize: 14,
          //   fontWeight: FontWeight.w700,
          //   fontFamily: 'Gilroy',
          //   letterSpacing: 0.8,
          // ),
          style: tsgr_14_700_08,
        ),
      ],
    ),
  );
}
