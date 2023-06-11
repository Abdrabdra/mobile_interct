// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:interct_2/data/api/api_provider.dart';

import 'package:interct_2/data/constants/colors.dart';
import 'package:interct_2/data/constants/sized_boxes.dart';
import 'package:interct_2/data/constants/textStyles.dart';
import 'package:interct_2/data/models/single_avto_adv_model.dart';

int _choosedIndex = -1;

bool isBought = false;

class ZabronPage extends StatefulWidget {
  const ZabronPage({
    Key? key,
    required this.saam,
  }) : super(key: key);
  final SingleAvtoAdvModel saam;

  @override
  State<ZabronPage> createState() => _ZabronPageState();
}

class _ZabronPageState extends State<ZabronPage> {
  double maxWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _choosedIndex = -2;
    isBought = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      extendBody: true,
      backgroundColor: whitef4,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 88,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sb_h10(),
                    SizedBox(
                      width: maxWidth(context) - 24,
                      child: Text(
                        'Дата отправления: ${widget.saam.arrivalDate}',
                        style: ts11_16_500_1,
                      ),
                    ),
                    sb_h10(),
                    Container(
                      width: maxWidth(context) - 24,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: black11,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // child: wrap_body(),
                      // child: places_widget_5(context),
                      // child: places_widget_7(context),
                      // child: place_widget_40(context),
                      child: widget.saam.busTypeId == 14
                          ? places_widget_5(context)
                          : widget.saam.busTypeId == 18
                              ? place_widget_40(context)
                              : places_widget_7(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Spacer(),
          _choosedIndex != -2
              ? Positioned(
                  bottom: 0,
                  child: zabron_button(context),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Column place_widget_40(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            place_tile_body(context, -1, false),
            sb_w10(),
            SizedBox(
              width: (maxWidth(context) - 64) / 6,
            ),
            sb_w16(),
            sb_w16(),
            SizedBox(
              width: (maxWidth(context) - 64) / 6,
            ),
            sb_w10(),
            SizedBox(
              width: (maxWidth(context) - 64) / 6,
            ),
          ],
        ),
        Column(
          children: List.generate(
            10,
            (index) => Column(
              children: [
                sb_h10(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    place_tile_body(context, (index * 4) + 1,
                        widget.saam.availablePlaces[index]),
                    sb_w10(),
                    place_tile_body(context, (index * 4) + 2,
                        widget.saam.availablePlaces[index]),
                    sb_w16(),
                    sb_w16(),
                    place_tile_body(context, (index * 4) + 3,
                        widget.saam.availablePlaces[index]),
                    sb_w10(),
                    place_tile_body(context, (index * 4) + 4,
                        widget.saam.availablePlaces[index]),
                    //widget.saam.availablePlaces[index]
                  ],
                ),
              ],
            ),
          ),
        ),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     place_tile_body(context, 1, widget.saam.availablePlaces[0]),
        //     sb_w10(),
        //     place_tile_body(context, 2, widget.saam.availablePlaces[1]),
        //     sb_w16(),
        //     sb_w16(),
        //     place_tile_body(context, 3, widget.saam.availablePlaces[2]),
        //     sb_w10(),
        //     place_tile_body(context, 4, widget.saam.availablePlaces[3]),
        //   ],
        // ),
        // sb_h10(),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     place_tile_body(context, 5, widget.saam.availablePlaces[4]),
        //     sb_w10(),
        //     place_tile_body(context, 6, widget.saam.availablePlaces[5]),
        //     sb_w16(),
        //     sb_w16(),
        //     place_tile_body(context, 7, widget.saam.availablePlaces[6]),
        //     sb_w10(),
        //     place_tile_body(context, 8, true),
        //   ],
        // ),
        // sb_h10(),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     place_tile_body(context, 9, false),
        //     sb_w10(),
        //     place_tile_body(context, 10, true),
        //     sb_w16(),
        //     sb_w16(),
        //     place_tile_body(context, 11, true),
        //     sb_w10(),
        //     place_tile_body(context, 12, true),
        //   ],
        // ),
        // sb_h10(),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     place_tile_body(context, 13, false),
        //     sb_w10(),
        //     place_tile_body(context, 14, true),
        //     sb_w16(),
        //     sb_w16(),
        //     place_tile_body(context, 15, true),
        //     sb_w10(),
        //     place_tile_body(context, 16, true),
        //   ],
        // ),
        // sb_h10(),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     place_tile_body(context, 17, false),
        //     sb_w10(),
        //     place_tile_body(context, 18, true),
        //     sb_w16(),
        //     sb_w16(),
        //     place_tile_body(context, 19, true),
        //     sb_w10(),
        //     place_tile_body(context, 20, true),
        //   ],
        // ),
        // sb_h10(),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     place_tile_body(context, 21, false),
        //     sb_w10(),
        //     place_tile_body(context, 22, true),
        //     sb_w16(),
        //     sb_w16(),
        //     place_tile_body(context, 23, true),
        //     sb_w10(),
        //     place_tile_body(context, 24, true),
        //   ],
        // ),
        // sb_h10(),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     place_tile_body(context, 25, false),
        //     sb_w10(),
        //     place_tile_body(context, 26, true),
        //     sb_w16(),
        //     sb_w16(),
        //     place_tile_body(context, 27, true),
        //     sb_w10(),
        //     place_tile_body(context, 28, true),
        //   ],
        // ),
        // sb_h10(),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     place_tile_body(context, 29, false),
        //     sb_w10(),
        //     place_tile_body(context, 30, true),
        //     sb_w16(),
        //     sb_w16(),
        //     place_tile_body(context, 31, true),
        //     sb_w10(),
        //     place_tile_body(context, 32, true),
        //   ],
        // ),
        // sb_h10(),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     place_tile_body(context, 33, false),
        //     sb_w10(),
        //     place_tile_body(context, 34, true),
        //     sb_w16(),
        //     sb_w16(),
        //     place_tile_body(context, 35, true),
        //     sb_w10(),
        //     place_tile_body(context, 36, true),
        //   ],
        // ),
        // sb_h10(),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     place_tile_body(context, 37, false),
        //     sb_w10(),
        //     place_tile_body(context, 38, true),
        //     sb_w16(),
        //     sb_w16(),
        //     place_tile_body(context, 39, true),
        //     sb_w10(),
        //     place_tile_body(context, 40, true),
        //   ],
        // ),

        _choosedIndex != -1
            ? Column(
                children: [
                  sb_h32(),
                  sb_h40(),
                ],
              )
            : SizedBox(),
      ],
    );
  }

  Column places_widget_7(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            place_tile_body(context, -1, false),
            sb_w10(),
            SizedBox(width: (maxWidth(context) - 64) / 6),
            sb_w10(),
            place_tile_body(context, 2, widget.saam.availablePlaces[0]),
          ],
        ),
        sb_h16(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            place_tile_body(context, 3, widget.saam.availablePlaces[1]),
            sb_w10(),
            place_tile_body(context, 4, widget.saam.availablePlaces[2]),
            sb_w10(),
            place_tile_body(context, 5, widget.saam.availablePlaces[3]),
          ],
        ),
        sb_h16(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            place_tile_body(context, 6, widget.saam.availablePlaces[4]),
            sb_w10(),
            SizedBox(width: (maxWidth(context) - 64) / 6),
            sb_w10(),
            place_tile_body(context, 7, widget.saam.availablePlaces[6]),
          ],
        ),
      ],
    );
  }

  Column places_widget_5(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            place_tile_body(context, -1, false),
            sb_w10(),
            SizedBox(width: (maxWidth(context) - 64) / 6),
            sb_w10(),
            place_tile_body(context, 2, widget.saam.availablePlaces[0]),
          ],
        ),
        sb_h16(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            place_tile_body(context, 3, widget.saam.availablePlaces[1]),
            sb_w10(),
            place_tile_body(context, 4, widget.saam.availablePlaces[2]),
            sb_w10(),
            place_tile_body(context, 5, widget.saam.availablePlaces[3]),
          ],
        ),
      ],
    );
  }

  InkWell place_tile_body(BuildContext context, int index, bool isAvailable) {
    return InkWell(
      onTap: () {
        // index % 3 == 0
        // ?
        isAvailable
            ? setState(() {
                _choosedIndex = index;
              })
            : null;
      },
      child: Container(
        width: (maxWidth(context) - 64) / 6,
        height: (maxWidth(context) - 64) / 6,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isAvailable ? color_green : grey87,
            width: 1,
          ),
          color: index == _choosedIndex ? color_green : whitef4,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: index == -1
            ? Icon(
                Icons.airline_seat_recline_extra_outlined,
                color: grey87,
              )
            : Text(
                '$index',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: index == _choosedIndex
                      ? whitef4
                      : isAvailable
                          ? color_green
                          : grey87,
                ),
              ),
      ),
    );
  }

  Container zabron_button(BuildContext context) {
    return Container(
      width: maxWidth(context),
      padding: EdgeInsets.fromLTRB(12, 12, 12, 20),
      decoration: BoxDecoration(
        color: whitef4,
        boxShadow: [
          BoxShadow(
            color: black11.withOpacity(0.4),
            blurRadius: 4,
            // offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Выбрано ${_choosedIndex}',
                style: ts11_14_600_05,
              ),
              sb_h6(),
              Text(
                // 'Цена 6700',
                'Цена ${widget.saam.price}',
                style: ts11_14_400_08,
              ),
            ],
          ),
          Spacer(),
          InkWell(
            onTap: () {
              setState(() {
                isBought = true;
              });
              print(widget.saam.placeIds);
              print(_choosedIndex);
              ApiProvider _apiProvider = ApiProvider();
              _apiProvider.buyTicket(
                  widget.saam.placeIds[_choosedIndex - 2], widget.saam.busId);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: black11,
                borderRadius: BorderRadius.circular(12),
              ),
              child: isBought
                  ? Icon(Icons.check, color: whitef4)
                  : Text(
                      'Бронировать',
                      style: tsf4_16_600_0,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Wrap wrap_body() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
        10,
        (index) => InkWell(
          onTap: () {
            index % 3 == 0
                ? setState(() {
                    _choosedIndex = index;
                  })
                : null;
          },
          child: Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: index % 3 == 0 ? color_green : grey87,
                width: 1,
              ),
              color: index == _choosedIndex ? color_green : whitef4,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${index + 31}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: index == _choosedIndex
                    ? whitef4
                    : index % 3 == 0
                        ? color_green
                        : grey87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: color_green,
      automaticallyImplyLeading: false,
      leadingWidth: 30,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          margin: EdgeInsets.only(left: 12),
          child: Icon(
            Icons.close,
            color: whitef4,
          ),
        ),
      ),
      centerTitle: false,
      title: Text(
        '${widget.saam.cityFrom} - ${widget.saam.cityTo}',
        style: tsf4_16_600_0,
      ),
    );
  }
}
