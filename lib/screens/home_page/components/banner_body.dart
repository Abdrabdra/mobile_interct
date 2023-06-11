import '../../../data/api/api_provider.dart';
import '../../../data/constants/textStyles.dart';
import '../../../screens/login_page/login_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../data/api/config.dart';
import '../../../data/constants/BoxDecorations.dart';
import '../../../data/constants/colors.dart';
import '../../../data/constants/sized_boxes.dart';
import '../blocs/get_banner_bloc/get_banner_bloc.dart';

int _activePage = 0;
PageController _pageController = PageController(
  initialPage: _activePage,
  viewportFraction: 1,
  keepPage: false,
);

class BannerBody extends StatefulWidget {
  const BannerBody({super.key});

  @override
  State<BannerBody> createState() => _BannerBodyState();
}

class _BannerBodyState extends State<BannerBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetBannerBloc>().add(GetBannerEvent());
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<GetBannerBloc, GetBannerState>(
      builder: (context, state) {
        if (state is GetBannerFailure) {
          if (tokenBox.isEmpty) {
            // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     return LoginPage();
            //   }));
            // });
          }
        }
        return carousel_body(maxWidth, []);
        // state is GetBannerLoading
        //     ? Container(
        //         height: (maxWidth / 390 * 180) + 40,
        //         decoration: bd_f4_12,
        //         alignment: Alignment.center,
        //         child: CircularProgressIndicator(color: black11),
        //       )
        //     : state is GetBannerSuccess
        //         ? carousel_body(maxWidth, state.urlsToImages)
        //         : state is GetBannerFailure
        //             ? Container(
        //                 height: maxWidth / 390 * 180,
        //                 margin: EdgeInsets.only(bottom: 14),
        //                 decoration: bd_f4_12,
        //                 alignment: Alignment.center,
        //                 child: Text(
        //                   state.errorText,
        //                   style: ts33_12_500,
        //                   maxLines: 3,
        //                 ),
        //               )
        //             : SizedBox();
      },
    );
  }

  Column carousel_body(double maxWidth, List<String> urls) {
    return Column(
      children: [
        CarouselSlider.builder(
          // itemCount: assetImagesHome.length,
          itemCount: urls.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              height: maxWidth / 390 * 180,
              decoration: bd_f4_12,
              // child: Image(
              //   image: assetImagesHome[index],
              //   fit: BoxFit.cover,
              // ),
              child: Container(
                decoration: BoxDecoration(
                  color: whitef4,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/images/banner_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // CachedNetworkImage(
              //   // imageUrl: "http://mvs.bslmeiyu.com/storage/profile/"
              //   //     "2022-05-02-626fc39bf18a6.png",
              //   imageUrl: baseUrlToImage + urls[index],
              //   imageBuilder: (context, imageProvider) => Container(
              //     decoration: BoxDecoration(
              //       color: whitef4,
              //       borderRadius: BorderRadius.circular(12),
              //       image: DecorationImage(
              //         image: imageProvider,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              //   placeholder: (context, url) => Container(
              //     height: maxWidth / 390 * 180,
              //     margin: EdgeInsets.only(bottom: 14),
              //     alignment: Alignment.center,
              //     decoration: bd_f4_12,
              //     child: const CircularProgressIndicator(
              //       color: black33,
              //     ),
              //   ),
              //   errorWidget: (context, url, error) => Container(
              //     height: maxWidth / 390 * 180,
              //     margin: EdgeInsets.only(bottom: 14),
              //     alignment: Alignment.center,
              //     decoration: bd_f4_12,
              //     child: Text(
              //       // 'ERROR',
              //       '$error',
              //       style: ts33_16_500_0,
              //     ),
              //   ),
              // ),
            );
          },
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 1,
            // aspectRatio: 366 / 180,
            pauseAutoPlayOnTouch: false,
            initialPage: 0,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            onPageChanged: (index, reason) {
              setState(() {
                _activePage = index;
              });
            },
          ),
        ),
        // SizedBox(
        //   height: 180,
        //   child: PageView.builder(
        //     controller: _pageController,
        //     // itemCount: 3,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         height: 180,
        //         decoration: bd_f4_12,
        //         child: Image(
        //           image: assetImages[index],
        //           fit: BoxFit.cover,
        //         ),
        //         // child: SvgPicture.asset(
        //         //   carousel_ex1_image,
        //         //   fit: BoxFit.cover,
        //         // ),
        //       );
        //     },
        //     onPageChanged: (value) {
        //       setState(() {
        //         _activePage = value;
        //       });
        //     },
        //   ),
        // ),
        sb_h10(),
        SizedBox(
          width: 84,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: ScrollController(keepScrollOffset: false),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                // assetImagesHome.length,
                urls.length,
                (index) => AnimatedContainer(
                  width: _activePage == index ? 48 : 12,
                  height: 4,
                  decoration: BoxDecoration(
                    color: _activePage == index ? color_green : greyc1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(right: 4),
                  duration: Duration(milliseconds: 300),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
