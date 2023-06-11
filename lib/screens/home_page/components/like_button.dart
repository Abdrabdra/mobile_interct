// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/colors.dart';
import '../blocs/like_cubit/like_cubit.dart';

bool _isLiked = false;

class LikeButton extends StatefulWidget {
  const LikeButton({
    Key? key,
    required this.isLiked,
    required this.id,
  }) : super(key: key);
  final bool isLiked;
  final int id;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<LikeCubit, LikeState>(
    //   builder: (context, state) {
    return InkWell(
      onTap: () {
        _isLiked ? null : context.read<LikeCubit>().likeAdver(widget.id);
        setState(() {
          _isLiked = !_isLiked;
          // _isLiked && state is LikeFailure ? _isLiked = false : null;
        });
      },
      child: Container(
        width: 32,
        height: 30,
        decoration: BoxDecoration(
          // color: const Color(0xFF333333),
          color: black33,
          borderRadius: BorderRadius.circular(5),
        ),
        // child: _isLiked && state is! LikeFailure?
        child: _isLiked
            ? const Icon(
                Icons.favorite_outlined,
                // color: Color(0xFF2DC36A),
                color: color_green,
                size: 18,
              )
            : const Icon(
                Icons.favorite_border_outlined,
                // color: Color(0xFF2DC36A),
                color: color_green,
                size: 18,
              ),
      ),
    );
    //   },
    // );
  }
}
