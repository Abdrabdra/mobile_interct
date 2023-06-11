import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PhotoCarouselLike extends StatefulWidget {
  const PhotoCarouselLike({super.key, required this.maxWidth});
  final double maxWidth;

  @override
  State<PhotoCarouselLike> createState() => _PhotoCarouselLikeState();
}

class _PhotoCarouselLikeState extends State<PhotoCarouselLike> {
  // late PageController _pageController;
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
      // padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                // height: 200.0,
                height: widget.maxWidth / 1.4,
                autoPlay: false,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: ((index, reason) {
                  setState(() {
                    activePage = index;
                  });
                }),
              ),
              items: images
                  .map(
                    (item) => Container(
                      // height: widget.maxWidth / 1.3,
                      // width: double.infinity,
                      width: widget.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.amber[700],
                        // borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          // image: NetworkImage(item),
                          image: AssetImage('assets/flags/kz.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // child: Center(
                      //     child: Text((images.indexOf(item) + 1).toString())),
                    ),
                  )
                  .toList(),
            ),
            number_of_photo(),
            indexChecker(),
          ],
        ),
      ),
    );
  }

  Positioned indexChecker() {
    return Positioned(
      bottom: 0,
      left: (widget.maxWidth - 164) / 2,
      child: SizedBox(
        width: 164, //  2 + 160 + 2
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.map((urlOfItem) {
            int index = images.indexOf(urlOfItem);
            return Container(
              width: activePage == index ? 48.0 : 12.0,
              height: 4.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(40),
                color: activePage == index
                    // ? Color(0xFF2DC36A)
                    ? color_green
                    // : Color(0xFFD9D9D9),
                    : greyc1,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Container number_of_photo() {
    return Container(
      width: 45,
      height: 26,
      margin: const EdgeInsets.all(12),
      // padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        // color: const Color(0xFF333333),
        color: black33,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '${(activePage + 1).toString()}/${images.length.toString()}',
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w500,
            //   letterSpacing: 0.8,
            //   // color: Color(0xFFC1C1C1),
            //   color: greyc1,
            // ),
            style: tsc1_16_500_08,
          )
        ],
      ),
    );
  }
}
