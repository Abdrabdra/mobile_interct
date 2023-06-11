import 'package:flutter/material.dart';
// import 'package:hitba/constants/colors/app_colors.dart';

import '../../../data/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool active;
  final void Function() onPressed;
  final bool isLoading;
  final bool withOuterPadding;

  const CustomButton({
    Key? key,
    required this.text,
    required this.active,
    required this.onPressed,
    this.isLoading = false,
    this.withOuterPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            // backgroundColor: active ? darkBlue : grey,
            backgroundColor: active ? black33 : black33.withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading
                  ? const CircularProgressIndicator(
                      color: white,
                    )
                  : Text(
                      text,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
