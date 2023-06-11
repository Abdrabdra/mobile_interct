// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'dart:async';

import '../../../data/constants/textStyles.dart';
import 'package:flutter/material.dart';

import '../../../data/constants/colors.dart';
import '../../../../data/models/user_model.dart';
import '../../../route/route_constatnts.dart';
import '../components/custom_button.dart';
import '../components/custom_code_textfield.dart';
import '../components/send_button.dart';

class CodeVerificationScreen extends StatefulWidget {
  static const String route = AppRoute.code_page_route;

  const CodeVerificationScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  String language = "RU";
  String _code = '';
  bool _onEditing = false;
  Duration duration = const Duration(seconds: 15);
  String sendButtonText = "Переотправить";
  bool initial = true;
  Timer? timer;
  bool isLoading = false;
  bool error = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void tick() {
    setState(() {
      final seconds = duration.inSeconds - 1;
      if (seconds == 0) {
        timer?.cancel();
      }
      if (!initial && seconds == 29) {
        sendButtonText = "Повторить";
      }
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      tick();
    });
  }

  @override
  Widget build(BuildContext context) {
    // UserModel userModel = UserModel(email: widget.email);

    return GestureDetector(
      onTap: () {
        // FocusScopeNode currentFocus = FocusScope.of(context);
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: appBar(),
        backgroundColor: white,
        resizeToAvoidBottomInset: false,
        floatingActionButton: button(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Код потверждения",
                      style: ts11_21_600_0,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: ts33_16_400_1,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'На ваш номер телефона отправлено письмо \n',
                            style: tsc1_16_600_1,
                          ),
                          TextSpan(text: 'с кодом подтверждения аккаунта.'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: whitef4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Номер телефона:",
                                style: tsc1_12_400,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.userModel.phoneNumber,
                                style: ts33_14_600_01,
                              ),
                            ],
                          ),
                          // const SizedBox(
                          //   width: 25,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.of(context).pop();
                          //   },
                          //   child: Container(
                          //     height: 40,
                          //     width: 40,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(20),
                          //       color: white,
                          //     ),
                          //     child: SvgPicture.asset(
                          //       'assets/images/ic_edit.svg',
                          //       fit: BoxFit.scaleDown,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomVerificationCode(
                          textStyle:
                              const TextStyle(fontSize: 24.0, color: black11),
                          keyboardType: TextInputType.number,
                          underlineColor: black11,
                          length: 4,
                          cursorColor: black11,
                          // If this is null it will default to the ambient
                          onCompleted: (String value) {
                            setState(() {
                              _code = value;
                            });
                          },
                          underlineUnfocusedColor: black11,
                          onEditing: (bool value) {
                            setState(() {
                              _onEditing = value;
                            });
                            if (!_onEditing) FocusScope.of(context).unfocus();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Не пришло смс?",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: black11.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildTimer(),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: SendButton(
                            backgroundColor: initial
                                // ? (duration.inSeconds == 0
                                //     // ? darkBlue
                                //     // : lightBlue)
                                //     ? blue.withOpacity(0.8)
                                //     : blue2.withOpacity(0.5))
                                ? whitef4
                                : duration.inSeconds == 0
                                    // ? darkBlue
                                    ? whitef4
                                    // : duration.inSeconds < 30
                                    //     // ? lightBlue
                                    //     ? blue2.withOpacity(0.5)
                                    //     : white,
                                    : whitef4,
                            borderColor: whitef4,
                            textColor: initial
                                ? (duration.inSeconds == 0 ? black11 : greyc1)
                                : duration.inSeconds == 0
                                    ? white
                                    : duration.inSeconds < 30
                                        // ? grey
                                        ? greyc1
                                        // : darkBlue,
                                        : black11,
                            text: sendButtonText,
                            onPressed: () {
                              if (duration.inSeconds == 0) {
                                if (initial) {
                                  initial = false;
                                }
                                setState(() {
                                  sendButtonText = "Переотправлено";
                                  duration = const Duration(seconds: 30);
                                });
                                startTimer();
                                // context
                                //     .read<CodeCubit>()
                                //     .sendCode(phoneNumber: widget.phoneNumber);
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    height: error ? 20 : 0,
                    child: const Text(
                      "Неверный код",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const SizedBox(
                height: 15,
              ),
              // button(context),
              // const SizedBox(
              //   height: 15,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  CustomButton button(BuildContext context) {
    return CustomButton(
      text: "Продолжить",
      active: _code.length == 4,
      isLoading: isLoading,
      onPressed: () {
        _code.length == 4
            ? Navigator.pushNamed(
                context,
                AppRoute.password_page_route,
                arguments: widget.userModel,
              )
            : null;
        // widget.isRegister
        //     // ? Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //     //     return PasswordScreen();
        //     //   }))
        //     ? Navigator.pushNamed(
        //         context,
        //         AppRoute.password_page_route,
        //       )
        //     : null;

        //

        // if (!isLoading) {
        //   setState(() {
        //     duration = const Duration(seconds: 0);
        //     timer?.cancel();
        //     sendButtonText = "Повторить";
        //     isLoading = true;
        //     error = false;
        //   });
        //   context
        //       .read<CodeCubit>()
        //       .checkCode(phoneNumber: widget.phoneNumber, code: _code);
        //   // context.read<CodeCubit>().checkCode(
        //   //     phoneNumber: widget.phoneNumber, code: _code);
        //   // Navigator.push(
        //   //   context,
        //   //   MaterialPageRoute(
        //   //     builder: (context) =>
        //   //         // GenderScreen(userModel: userModel),
        //   //         NameScreen(
        //   //       userModel: userModel,
        //   //     ),
        //   //   ),
        //   // );
        // }
      },
    );
  }

  Widget buildTimer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: whitef4,
      ),
      child: Text(
        "$minutes:$seconds",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: black33,
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      // automaticallyImplyLeading: true,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: black11,
        ),
        color: black11,
      ),
      toolbarHeight: 60,
      automaticallyImplyLeading: false,
      title: Text(
        'Назад',
        style: ts33_16_400_1,
      ),
      titleSpacing: 0,
      centerTitle: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      elevation: 7,
      shadowColor: greyc1.withOpacity(0.2),
      backgroundColor: white,
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
