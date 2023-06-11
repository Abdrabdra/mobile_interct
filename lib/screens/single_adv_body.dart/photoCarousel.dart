// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';

import '../../../data/api/config.dart';
import '../../data/constants/BoxDecorations.dart';

class PhotoCarousel extends StatefulWidget {
  const PhotoCarousel({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);
  final List<String> imageUrls;

  @override
  State<PhotoCarousel> createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  List<String> images = [
    "https://wallpaperaccess.com/full/8405169.jpg",
    "https://wallpaperaccess.com/full/791.jpg",
    "https://wallpaperaccess.com/full/128130.jpg",
    "https://wallpaperaccess.com/full/8405159.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];
  int activePage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: false,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: ((index, reason) {
                  setState(() {
                    activePage = index;
                  });
                }),
              ),
              // items: images
              items: widget.imageUrls
                  .map(
                    (item) => CachedNetworkImage(
                      // imageUrl: "http://mvs.bslmeiyu.com/storage/profile/"
                      //     "2022-05-02-626fc39bf18a6.png",
                      imageUrl: baseUrlToImage + item,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: color_green,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        height: 160,
                        width: double.infinity,
                        // margin: EdgeInsets.only(bottom: 14),
                        alignment: Alignment.center,
                        decoration: bd_f4_12,
                        child: const CircularProgressIndicator(
                          color: black33,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 160,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 14),
                        alignment: Alignment.center,
                        decoration: bd_f4_12,
                        child: Text(
                          // 'ERROR',
                          '$error',
                          style: ts33_16_500_0,
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 160,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: color_green,
                    //     borderRadius: BorderRadius.circular(20),
                    //     image: const DecorationImage(
                    //       // image: NetworkImage(item),
                    //       image: AssetImage('assets/flags/kz.png'),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    //   child: Center(
                    //       child: Text((images.indexOf(item) + 1).toString())),
                    // ),
                  )
                  .toList(),
            ),
            // number_of_photo(),
          ],
        ),
      ),
    );
  }

  Container number_of_photo() {
    return Container(
      width: 69,
      height: 26,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: black33,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: Icon(
              Icons.camera_alt,
              size: 16,
              color: greyc1,
            ),
          ),
          Text(
            '1/8',
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w500,
            //   letterSpacing: 0.8,
            //   color: greyc1,
            // ),
            style: tsc1_16_500_08,
          )
        ],
      ),
    );
  }
}
