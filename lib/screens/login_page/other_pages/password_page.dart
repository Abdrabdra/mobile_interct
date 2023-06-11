import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/colors.dart';
import '../../../data/constants/sized_boxes.dart';
import '../../../data/constants/textStyles.dart';
import '../../../../data/models/user_model.dart';
import '../../../route/route_constatnts.dart';
import '../auth_bloc/auth_bloc.dart';
import '../components/custom_button.dart';

TextEditingController passwordController = TextEditingController();
TextEditingController passwordPodController = TextEditingController();
bool _passwordFull = false;

class PasswordPage extends StatefulWidget {
  static const String route = AppRoute.password_page_route;

  const PasswordPage({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoute.home, (route) => false);
          });
        }
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                // FocusScopeNode currentFocus = FocusScope.of(context);
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                appBar: appBar(),
                backgroundColor: white,
                resizeToAvoidBottomInset: false,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                // floatingActionButton: _isFocused ? SizedBox() : button(),
                // floatingActionButton: button(state),
                floatingActionButton: button(state),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sb_h48(),
                      password_input(),
                      sb_h16(),
                      password_pod_input(),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  CustomButton button(AuthState state) {
    // CustomButton button() {
    return CustomButton(
      isLoading: state is AuthLoading,
      text: state is AuthFailure ? state.errorText : 'Зарегистрироваться',
      // text: 'Зарегистрироваться',
      active: _passwordFull,
      onPressed: () {
        print(passwordController.text);
        print(passwordPodController.text);
        if (passwordController.text.length > 7 &&
            passwordPodController.text == passwordController.text) {
          // Navigator.pushReplacementNamed(
          //   context,
          //   AppRoute.mainRoute,
          // );

          context.read<AuthBloc>().add(
                RegisterEvent(
                  widget.userModel.copyWith(
                    password: passwordController.text,
                  ),
                ),
              );
        }
      },
    );
  }

  void checkPassword() {
    if (passwordController.text.length > 7 &&
        // mozhno i bez etogo
        // passwordPodController.text.length > 7 &&
        passwordController.text == passwordPodController.text) {
      setState(() {
        _passwordFull = true;
      });
    } else {
      setState(() {
        _passwordFull = false;
      });
    }
  }

  Column password_pod_input() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Подтвердите пароль",
          style: ts11_14_500_08,
        ),
        sb_h8(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: whitef4,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            controller: passwordPodController,
            keyboardType: TextInputType.text,
            obscureText: true,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Введите пароль',
              hintStyle: ts87_14_600_1,
            ),
            onChanged: (value) {
              checkPassword();
            },
          ),
        ),
      ],
    );
  }

  Column password_input() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Введите пароль",
          style: ts11_14_500_08,
        ),
        sb_h8(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: whitef4,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            controller: passwordController,
            keyboardType: TextInputType.text,
            obscureText: true,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Введите пароль',
              hintStyle: ts87_14_600_05,
            ),
            onChanged: (value) {
              checkPassword();
            },
          ),
        ),
      ],
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
        'Пароль',
        style: ts11_16_400_08,
      ),
      titleSpacing: 0,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      elevation: 7,
      shadowColor: greyc1.withOpacity(0.2),
      backgroundColor: white,
    );
  }
}
