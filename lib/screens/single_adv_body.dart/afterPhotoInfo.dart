// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../data/models/single_avto_adv_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../home_page/blocs/like_cubit/like_cubit.dart';

// Color color_green = const Color(0xFF2DC36A);
// Color black33 = Color(0xFF333333);
Container AfterPhotoBody(SingleAvtoAdvModel saam) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    height: 31,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        elements_1_2(saam),
        LikeButton(
          saam: saam,
        ),
      ],
    ),
  );
}

class LikeButton extends StatefulWidget {
  const LikeButton({
    Key? key,
    required this.saam,
  }) : super(key: key);
  final SingleAvtoAdvModel saam;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

bool _isLiked = false;
int _likes = -1;

class _LikeButtonState extends State<LikeButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _isLiked = widget.saam.isLiked;
    // _likes = int.parse(widget.saam.likes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69,
      height: 31,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: black33,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              _isLiked
                  ? null
                  : context.read<LikeCubit>().likeAdver(widget.saam.id);
              setState(() {
                _isLiked ? _likes-- : _likes++;
                _isLiked = !_isLiked;
              });
            },
            // width: 16,
            // height: 16,
            child: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              size: 18,
              color: color_green,
            ),
          ),
          Text(
            // '326',
            _likes.toString(),
            // style: TextStyle(
            //   fontSize: 12,
            //   fontWeight: FontWeight.w600,
            //   letterSpacing: 0.8,
            //   color: color_green,
            // ),
            style: tsgr_12_600_08,
          )
        ],
      ),
    );
  }
}

// Container like() {
//   return Container(
//     width: 69,
//     height: 31,
//     alignment: Alignment.center,
//     decoration: BoxDecoration(
//       color: black33,
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         SizedBox(
//           // width: 16,
//           // height: 16,
//           child: Icon(
//             Icons.favorite_border,
//             size: 18,
//             color: color_green,
//           ),
//         ),
//         Text(
//           '326',
//           // style: TextStyle(
//           //   fontSize: 12,
//           //   fontWeight: FontWeight.w600,
//           //   letterSpacing: 0.8,
//           //   color: color_green,
//           // ),
//           style: tsgr_12_600_08,
//         )
//       ],
//     ),
//   );
// }

SizedBox elements_1_2(SingleAvtoAdvModel saam) {
  return SizedBox(
    width: 217,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // saam.isTop
        //     ? Container(
        //         width: 77,
        //         height: double.infinity,
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //           color: color_green,
        //           borderRadius: BorderRadius.circular(5),
        //         ),
        //         child: Text(
        //           'В Топ-10',
        //           // style: TextStyle(
        //           //   fontSize: 12,
        //           //   fontWeight: FontWeight.w700,
        //           //   letterSpacing: 0.8,
        //           //   color: whitef4,
        //           //   fontFamily: 'Gilroy',
        //           // ),
        //           style: tsf4_12_700_08,
        //         ),
        //       )
        //     : SizedBox(),
        // saam.isRecommended
        //     ? Container(
        //         width: 132,
        //         height: double.infinity,
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(5),
        //         ),
        //         child: Text(
        //           'В Рекомендациях',
        //           // style: TextStyle(
        //           //   fontSize: 12,
        //           //   fontWeight: FontWeight.w600,
        //           //   letterSpacing: 0.8,
        //           //   color: black33,
        //           //   fontFamily: 'Gilroy',
        //           // ),
        //           style: ts33_12_600_08,
        //         ),
        //       )
        //     : SizedBox(),
      ],
    ),
  );
}
