import '../../data/constants/colors.dart';
import '../../../data/models/user_model.dart';
import '../../route/route_constatnts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/constants/textStyles.dart';
import '../../phone_input_package/phone_field.dart';
// import '../home_page/home_page.dart';
import 'auth_bloc/auth_bloc.dart';

// import 'package:intl_phone_field/intl_phone_field.dart';
bool _isFocused = false;
bool _canGo = false;
bool _isLogin = true;
String countryCode = '+7';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// TextStyle checkboxTextStyle = const TextStyle(
//   fontSize: 14,
//   fontWeight: FontWeight.w400,
//   letterSpacing: 0.8,
//   // color: Color(0xFF000000),
//   color: black11,
//   fontFamily: 'Gilroy',
// );
bool isAgree = false;
TextEditingController _phoneController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _nameController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoute.home, (route) => false);
          });
        }
        return GestureDetector(
          onTap: () {
            unFocus();
          },
          child: Scaffold(
            // backgroundColor: Color(0xffF4F4F4),
            backgroundColor: whitef4,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Visibility(
              child: floatButton(context, state),
              visible: !_isFocused,
            ),
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

            body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                children: [
                  avto_like_image(maxWidth),

                  //after AVTO-LIKE
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 12, top: 12),
                          child: Text(
                            'Добро Пожаловать!',
                            // style: TextStyle(
                            //   fontSize: 24,
                            //   fontWeight: FontWeight.w500,
                            //   fontFamily: 'Gilroy',
                            // ),
                            style: ts11_24_500_0,
                          ),
                        ),
                        phone_input(),
                        // _isLogin ? password_input() : name_input(),
                        password_input(),
                        register_login(),
                        _isLogin ? SizedBox() : soglasya(),
                        // const SizedBox(height: 70),
                      ],
                    ),
                  ),
                  // Expanded(child: Container()),
                  // Container(
                  //   // margin: const EdgeInsets.symmetric(vertical: 34, horizontal: 12),
                  //   margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       isAgree
                  //           ? Navigator.of(context).pushReplacementNamed('/home')
                  //           : null;
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       minimumSize: Size.zero, // Set this
                  //       padding: EdgeInsets.zero, // and this
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12.0),
                  //       ),
                  //     ),
                  //     child: Container(
                  //       alignment: Alignment.bottomCenter,
                  //       padding: const EdgeInsets.all(16),
                  //       decoration: BoxDecoration(
                  //           color: isAgree
                  //               ? const Color(0xFF26C769)
                  //               : const Color(0xFFbdbdbd),
                  //           borderRadius: BorderRadius.circular(12)),
                  //       child: const Text(
                  //         'Зарегистрироваться',
                  //         style: TextStyle(
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.w600,
                  //             color: Colors.white),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
    // ),
    // );
  }

  void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _isFocused = false;
    });
  }

  void checkGo() {
    if (_passwordController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty) {
      setState(() {
        _canGo = true;
      });
    } else {
      setState(() {
        _canGo = false;
      });
    }
  }

  Widget register_login() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isLogin = !_isLogin;
        });
        unFocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: ts33_16_400_1,
            children: <TextSpan>[
              TextSpan(
                  text: !_isLogin
                      ? 'У вас уже есть аккаунт? '
                      : 'У вас нет аккаунта? '),
              TextSpan(
                text: !_isLogin ? 'Войти' : 'Зарегистрироваться',
                style: ts33_16_500_1_un,
              ),
            ],
          ),
        ),
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Text(
    //       'У меня есть аккаунт.',
    //       style: ts0c_14_400,
    //     ),
    //     SizedBox(width: 8),
    //     Text(
    //       'Зарегистрироваться',
    //       style: tsbl_14_400,
    //     ),
    //   ],
    // );
  }

  Widget floatButton(BuildContext context, AuthState state) {
    return ElevatedButton(
      onPressed: () {
        print('8' + _phoneController.text);
        print(_passwordController.text);
        print(_nameController.text);
        _canGo & _isLogin
            ? context.read<AuthBloc>().add(
                  LoginEvent(
                    UserModel(
                      name: '',
                      password: _passwordController.text,
                      phoneNumber: '8' + _phoneController.text,
                    ),
                  ),
                )
            : isAgree
                // ? Navigator.of(context).pushNamed(
                //     AppRoute.code_page_route,
                //     arguments: UserModel(
                //       name: _nameController.text,
                //       password: 'password',
                //       phoneNumber: '8' +
                //           _phoneController.text
                //               .replaceAll('-', '')
                //               .replaceAll(' ', ''),
                //     ),
                //   )
                ? context.read<AuthBloc>().add(
                      RegisterEvent(
                        // widget.userModel.copyWith(
                        //   password: passwordController.text,
                        // ),
                        UserModel(
                          name: '',
                          password: _passwordController.text,
                          phoneNumber: '8' + _phoneController.text,
                        ),
                      ),
                    )
                : null;
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width - 24,
        decoration: BoxDecoration(
            color: (_isLogin || isAgree) && _canGo ? color_green : grey87,
            borderRadius: BorderRadius.circular(12)),
        child: state is AuthLoading
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: whitef4),
                ],
              )
            : state is AuthFailure
                ? Text(
                    state.errorText,
                    style: tswh_14_600_1,
                  )
                : Text(
                    _isLogin ? 'Войти' : 'Зарегистрироваться',
                    textAlign: TextAlign.center,
                    // style: TextStyle(
                    //   fontSize: 20,
                    //   fontWeight: FontWeight.w600,
                    //   color: white,
                    // ),
                    style: tswh_20_600_0,
                  ),
      ),
    );
  }

  Container password_input() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: greyf0,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        controller: _passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        obscuringCharacter: '*',
        style: ts11_21_600_0,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Введите пароль',
          hintStyle: tsc1_20_500_0,
        ),
        onTap: () {
          setState(() {
            _isFocused = true;
          });
        },
        onChanged: (value) {
          checkGo();
        },
        onEditingComplete: () {
          setState(() {
            _isFocused = false;
          });
        },
      ),
    );
  }

  Row soglasya() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          child: Checkbox(
              side: const BorderSide(
                // color: Color(0xFF26C769),
                color: color_green,
                width: 1.5,
              ),
              // activeColor: const Color(0xFF26C769),
              activeColor: color_green,
              value: isAgree,
              onChanged: (value) {
                isAgree = value!;
                setState(() {});
              }),
        ),
        const SizedBox(width: 12),
        Flexible(
          // width: 315,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Я соглашаюсь с ',
                  style: ts11_14_400_08,
                ),
                TextSpan(
                  text:
                      'условиями использование и политикой конфеденциальности',
                  // style: TextStyle(
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.w400,
                  //   letterSpacing: 0.8,
                  //   // color: Color(0xFF26C769),
                  //   color: color_green,
                  //   fontFamily: 'Gilroy',
                  // ),
                  style: tsgr_14_400_08,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget name_input() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: greyf0,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        controller: _nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Введите ваше имя',
          hintStyle: tsc1_20_500_0,
        ),
        onTap: () {
          setState(() {
            _isFocused = true;
          });
        },
        onChanged: (value) {
          checkGo();
        },
        onFieldSubmitted: (p0) {
          setState(() {
            _isFocused = false;
          });
        },
      ),
    );
  }

  Widget phone_input() {
    return AnimatedContainer(
      height: 56,
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(bottom: 12),
      // padding: EdgeInsets.only(bottom: 28),
      // decoration: BoxDecoration(
      //   color: Color(0xffF6F6F6),
      //   borderRadius: BorderRadius.circular(8),
      // ),
      duration: const Duration(milliseconds: 300),
      child: PhoneField(
        initialCountryCode: 'KZ',
        dropdownIconPosition: IconPosition.trailing,
        textAlignVertical: TextAlignVertical.bottom,
        autovalidateMode: AutovalidateMode.disabled,
        textInputAction: TextInputAction.next,
        controller: _phoneController,
        style: ts11_21_600_0,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 16),
          hintText: '(000)-000-00-00',
          // hintStyle: const TextStyle(
          //   // color: Color(0xFFB4B4B4),
          //   color: greyc1,
          //   fontSize: 20,
          //   fontFamily: 'Gilroy',
          //   fontStyle: FontStyle.normal,
          // ),
          hintStyle: tsc1_20_500_0,
          counterText: '',
          counterStyle: const TextStyle(fontSize: 0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          filled: true,
          // fillColor: const Color(0xFFF7F7F7),
          fillColor: greyf0,
          // labelStyle: const TextStyle(
          //   // color: Color(0xFFB4B4B4),
          //   color: greyc1,
          //   fontWeight: FontWeight.w400,
          // ),
          labelStyle: tsc1_20_400_0,
        ),
        // dropdownTextStyle: const TextStyle(
        //   fontSize: 21,
        //   fontWeight: FontWeight.w600,
        //   // color: Color(0xFF222222),
        //   color: black11,
        //   fontFamily: 'Proxima Nova',
        // ),
        dropdownTextStyle: ts11_21_600_0,
        dropdownDecoration: BoxDecoration(
          // color: const Color(0xFFF7F7F7),
          color: greyf0,
          // color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        onChanged: (phone) {
          print(phone.completeNumber);
        },
        onCountryChanged: (country) {
          print('Country changed to: ' + country.name);
          setState(() {
            countryCode = country.code;
          });
        },
        onTap: () {
          setState(() {
            _isFocused = true;
          });
        },
        onSubmitted: (p0) {
          setState(() {
            _isFocused = false;
          });
        },
      ),
    );
  }

  Container avto_like_image(double maxWidth) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(70),
        ),
        // color: const Color(0xFF111111),
        color: black11,
      ),
      // height: MediaQuery.of(context).size.height * 0.54,
      width: maxWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 59),
            child: Text(
              'InterCity',
              // style: TextStyle(
              //   fontSize: 24,
              //   fontWeight: FontWeight.w400,
              //   // color: Color(0xFFFFFFFF),
              //   color: whitef4,
              //   fontFamily: 'Ferret Face Laser',
              //   letterSpacing: 7.68,
              // ),
              style: tsf4_24_400_768,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              'assets/images/auto_icon.png',
              // width: 390,
              // height: 276.25,
              // color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
