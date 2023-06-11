// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import '../../../data/constants/sized_boxes.dart';
import '../../../data/constants/texts.dart';
import '../../../screens/home_page/components/like_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/constants/colors.dart';
import '../../../data/models/avto/avto_advertisement_tile_model.dart';
import '../../../screens/single_adv_body.dart/homeSingleAdv.dart';
import 'package:intl/intl.dart';

import '../../../../data/api/config.dart';
import '../../../data/constants/BoxDecorations.dart';
import '../../../data/constants/textStyles.dart';

// ignore: must_be_immutable
class AdvertisementTile extends StatefulWidget {
  AdvertisementTile({
    Key? key,
    required this.isCar,
    required this.aat,
  }) : super(key: key) {
    isAuthors = isAuthors ?? false;
    // isThunder = isThunder ?? true;
    // dataIli = dataIli ?? '';
  }
  final bool isCar;
  final AvtoAdvertisementTile aat;
  bool? isAuthors;
  // bool? isThunder;
  // String? dataIli;
  @override
  State<AdvertisementTile> createState() => _AdvertisementTileState();
}

class _AdvertisementTileState extends State<AdvertisementTile> {
  int n = 1250;
  // bool isThunder = true;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    DateTime dt = DateTime.parse(widget.aat.datePublish);
    DateTime dt2 = dt.add(Duration(days: 1));
    // bool withL = widget.withLaik!;
    // withL = widget.withLaik!;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print('Advers tile and ${widget.isAuthors}');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SingleAdvPage(
                  isAuthors: widget.isAuthors,
                  id: widget.aat.idOfAdver,
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(bottom: 12),
            width: maxWidth - 24,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                photoOfAdv(),
                sb_w6(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: maxWidth - 158,
                      child: Text(
                        '${widget.aat.city1} - ${widget.aat.city2}',
                        style: ts11_14_600_05,
                      ),
                    ),
                    sb_h6(),
                    SizedBox(
                      width: maxWidth - 158,
                      child: Text(
                        '${widget.aat.price} KZT',
                        style: tsgr_14_700_08,
                      ),
                    ),
                    sb_h6(),
                    SizedBox(
                      width: maxWidth - 158,
                      child: Text(
                        // '5.5.2023 - 6.5.2023',
                        '${dt.day}.${dt.month}.${dt.year} - ${dt2.day}.${dt2.month}.${dt2.year}',
                        style: ts11_14_600_05,
                      ),
                    ),
                    sb_h6(),
                    SizedBox(
                      width: maxWidth - 158,
                      child: infos_body([
                        widget.aat.busTitle,
                        '${widget.aat.price}KZT',
                        widget.aat.city1,
                        widget.aat.city2,
                        'БЫСТРЫЙ'
                      ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        widget.isCar && !widget.isAuthors!
            ? Container(
                margin: EdgeInsets.only(left: (maxWidth - 64), top: 12),
                // child: likeWidget(),
                child: LikeButton(
                  isLiked: widget.aat.isLiked,
                  id: widget.aat.idOfAdver,
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  SingleChildScrollView infos_body(List<String> infos) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(
          infos.length,
          (index) => Container(
            height: 22,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              // color: const Color(0xFF333333),
              color: black33,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              infos[index],
              style: tsc1_12_600_0,
            ),
          ),
        ),
      ),
    );
  }

  // Row numberDate(int n) {
  Row numberDate() {
    // String pr = n.toString();
    // DateTime dt =
    //     DateFormat('yyyy-MM-dd').parse(widget.aat.datePublish.substring(0, 10));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.remove_red_eye_outlined,
          // color: Color(0xFF555555),
          color: black55,
          size: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Text(
            // '${(n / 1000).floor()} ${(n % 1000)}',
            'pr',
            style: ts55_12_400_08,
          ),
        ),
        const Icon(
          Icons.circle_sharp,
          // color: Color(0xff555555),
          color: black55,
          size: 3,
        ),
        // Container(
        //   margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        //   child: Text(
        //     // '7 октября',
        //     '${dt.day} ${months[dt.month - 1]}',
        //     style: ts55_12_400_08,
        //   ),
        // ),
      ],
    );
  }

  Stack photoOfAdv() {
    return Stack(
      children: [
        // Container(
        //   width: 120,
        //   height: 110,
        //   decoration: BoxDecoration(
        //     image: const DecorationImage(
        //       fit: BoxFit.cover,
        //       image: AssetImage('assets/flags/kz.png'),
        //     ),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        // ),
        CachedNetworkImage(
          // imageUrl: "http://mvs.bslmeiyu.com/storage/profile/"
          //     "2022-05-02-626fc39bf18a6.png",
          imageUrl: baseUrlToImage + widget.aat.urlMainPhoto,
          imageBuilder: (context, imageProvider) {
            return Container(
              width: 120,
              height: 110,
              decoration: BoxDecoration(
                color: whitef4,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          placeholder: (context, url) => Container(
            width: 120,
            height: 110,
            // margin: EdgeInsets.only(bottom: 14),
            alignment: Alignment.center,
            decoration: bd_f4_12,
            child: const CircularProgressIndicator(
              color: black33,
            ),
          ),
          errorWidget: (context, url, error) {
            print(baseUrlToImage + widget.aat.urlMainPhoto);
            print(error);
            return Container(
              width: 120,
              height: 110,
              margin: EdgeInsets.only(bottom: 14),
              alignment: Alignment.center,
              decoration: bd_f4_12,
              child: Icon(
                Icons.cloud_off,
                color: Colors.red,
              ),
              // Text(
              //   // 'ERROR',
              //   '$error',
              //   style: ts33_16_500_0,
              // ),
            );
          },
        ),
        Container(
          // width: 52,
          height: 22,
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            // color: const Color(0xFF333333),
            color: black33,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 14,
                height: 14,
                child: Icon(
                  Icons.camera_alt,
                  size: 10,
                  // color: Color(0xFFC1C1C1),
                  color: greyc1,
                ),
              ),
              sb_w8(),
              Text(
                // '20',
                widget.aat.countImages,
                // style: TextStyle(
                //   fontSize: 12,
                //   fontWeight: FontWeight.w500,
                //   letterSpacing: 0.8,
                //   // color: Color(0xFFC1C1C1),
                //   color: greyc1,
                // ),
                style: tsc1_12_500_08,
              )
            ],
          ),
        )
      ],
    );
  }
}
