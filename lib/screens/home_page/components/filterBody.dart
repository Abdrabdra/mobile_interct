// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../../../data/constants/colors.dart';
import '../../../data/constants/sized_boxes.dart';
import '../../../data/models/avto_request_model.dart';
import '../../../screens/home_page/components/alert_choose_city.dart';
import '../../../screens/home_page/components/alert_choose_marka.dart';

import '../../../data/constants/textStyles.dart';
import '../../../../data/models/city_model.dart';
import '../blocs/get_advertisements_bloc/get_advertisements_bloc.dart';
import '../blocs/get_banner_bloc/get_banner_bloc.dart';
// class CustomTextInputFormatter extends TextInputFormatter {
//   static const int _maxLength =11; // maximum length of the formatted string
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     final unformattedText = newValue.text.replaceAll(RegExp(r'\s+'), ''); // remove all white space
//     final formattedText = _getFormattedText(unformattedText);
//     final selectionIndex = _getSelectionIndex(newValue.selection, formattedText);
//     return TextEditingValue(
//       text: formattedText,
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//   }
//   String _getFormattedText(String unformattedText) {
//     final length = unformattedText.length;
//     if (length == 5 || length == 8) {
//       return '${unformattedText.substring(0, 2)} ${unformattedText.substring(2, 5)} ${unformattedText.substring(5, length)}';
//     } else if (length == 3 || length == 6 || length == 9) {
//       return '${unformattedText.substring(0, 3)} ${unformattedText.substring(3, 6)} ${unformattedText.substring(6, length)}';
//     } else if (length == 4 || length == 7) {
//       return '${unformattedText.substring(0, 1)} ${unformattedText.substring(1, 4)} ${unformattedText.substring(4, length)}';
//     } else {
//       return unformattedText.substring(0, min(length, _maxLength));
//     }
//   }
//   int _getSelectionIndex(TextSelection selection, String formattedText) {
//     final unformattedIndex = selection.baseOffset;
//     final spacesBeforeIndex = formattedText.substring(0, unformattedIndex).replaceAll(RegExp(r'[^\s]'), '').length;
//     return unformattedIndex + spacesBeforeIndex;
//   }
// }

class AvtoFilterBody extends StatefulWidget {
  const AvtoFilterBody({
    Key? key,
    required this.bannerRecall,
    required this.starm,
  }) : super(key: key);
  final bool bannerRecall;
  final Function starm;

  @override
  State<AvtoFilterBody> createState() => _AvtoFilterBodyState();
}

List<CityModel> _cities = [];
int _selectedRegionId = -1;
String _selectedRegion = 'Все регионы';
int _selectedCityId = -1;
String _selectedCity = 'Все городы';
int _selectedMarkaId = -1;
String _selectedMarka = 'Все марки';
int _selectedModelId = -1;
String _selectedModel = 'Все модели';
bool _isFocused = false;
bool _tappedGorod = false;
bool _tappedModel = false;
TextEditingController _yearFromController = TextEditingController();
TextEditingController _yearToController = TextEditingController();
TextEditingController _priceFromController = TextEditingController();
TextEditingController _priceToController = TextEditingController();
int selectedIndex = 1;

bool isRastomojen = false;
bool withPhoto = false;
// TextStyle ts = const TextStyle(
//   fontFamily: 'Gilroy',
//   fontStyle: FontStyle.normal,
//   fontWeight: FontWeight.w400,
//   fontSize: 14,
//   letterSpacing: 1,
//   // color: Color(0xFF878787),
//   color: grey87,
// );
BoxDecoration bd = BoxDecoration(
  // color: const Color(0xffF0F0F0),
  color: greyf0,
  borderRadius: BorderRadius.circular(8),
);

class _AvtoFilterBodyState extends State<AvtoFilterBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedRegionId = -1;
    _selectedRegion = 'Все регионы';
    _selectedCityId = -1;
    _selectedCity = 'Все городы';
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: const EdgeInsets.only(top: 15),
          color: white,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        closeBody(),
                        sostoyania(maxWidth),
                        filterBody_1(),
                        // filterBody_2(),
                        sb_h16(),
                        filterBody_3(context),
                        // yearFrom_input(),
                        sb_h16(),
                      ],
                    ),
                  ),
                ),
              ),
              button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return GestureDetector(
      onTap: () {
        // print('object');
        AvtoRequestModel arm = AvtoRequestModel(
          yearFrom: _yearFromController.text,
          yearTo: _yearToController.text,
          priceFrom: _priceFromController.text,
          priceTo: _priceToController.text,
          cityId: _selectedCityId,
          modelId: _selectedModelId,
          markaId: _selectedMarkaId,
          withPhoto: false,
          isRastomojen: false,
          page: 1,
        );
        print(arm);
      },
      child: Container(
        decoration: BoxDecoration(
          // color: const Color(0xff26C769),
          color: color_green,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Center(
          child: Text(
            'Подтвердить',
            // style: TextStyle(
            //   fontFamily: 'Gilroy',
            //   fontStyle: FontStyle.normal,
            //   fontWeight: FontWeight.w600,
            //   fontSize: 18,
            //   // color: Colors.white,
            //   color: whitef4,
            // ),
            style: tsf4_18_600_0,
          ),
        ),
      ),
    );
  }

  Widget number_input(String txt, TextEditingController tec, bool isYear) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          txt,
          style: ts33_12_600_01,
        ),
        sb_h8(),
        Container(
          width: (MediaQuery.of(context).size.width - 10 - 40) / 2,
          height: 44,
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
          // margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: greyf0,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            textInputAction: TextInputAction.done,
            controller: tec,
            keyboardType: TextInputType.number,
            inputFormatters: [
              isYear
                  ? MaskedInputFormatter("####")
                  : MaskedInputFormatter(
                      // (tec.text.length==4||tec.text.length==7)
                      // ?"# ### ###"
                      // :
                      (tec.text.length == 5 ||
                              tec.text.length == 8 ||
                              tec.text.length == 2)
                          ? "## ### ###"
                          :
                          // tec.text.length==9?
                          "### ### ###"
                      // :"### ###"
                      )
            ],
            // inputFormatters: [CustomTextInputFormatter()],
            maxLength: isYear ? 4 : 11,
            decoration: InputDecoration(
                border: InputBorder.none,
                // hintText: 'Введите ваше имя',
                // hintStyle: ts33_12_600_01,
                fillColor: white,
                filled: true,
                // counterStyle: TextStyle(fontSize: 0, height: 0,),
                counter: SizedBox(),
                counterText: ''),
            onTap: () {
              setState(() {
                _isFocused = true;
              });
            },
            onFieldSubmitted: (p0) {
              setState(() {
                _isFocused = false;
              });
            },
          ),
        ),
      ],
    );
  }

  SizedBox filterBody_3(BuildContext context) {
    return SizedBox(
      // height: 172,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Год выпуска (Г.)',
                style: ts87_14_400_0,
              ),
              sb_h8(),
              Row(
                children: [
                  number_input('От', _yearFromController, true),
                  sb_w10(),
                  number_input('До', _yearToController, true),
                ],
              ),
            ],
          ),
          sb_h10(),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Цена (KZT)',
                style: ts87_14_400_0,
              ),
              sb_h8(),
              Row(
                children: [
                  number_input('От', _priceFromController, false),
                  sb_w10(),
                  number_input('До', _priceToController, false),
                ],
              ),
            ],
          ),
          // SizedBox(
          //   // height: 86,
          //   child: filterBody_pod_3(context, 'Год выпуска (Г.)', 'От', 'До'),
          // ),
          // sb_h10(),
          // SizedBox(
          //   // height: 86,
          //   child: filterBody_pod_3(context, 'Цена (KZT)', 'От', 'До'),
          // ),
        ],
      ),
    );
  }

  Container filterBody_2() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      width: double.infinity,
      height: 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          filterBody_pod_2('Растаможен в РК', 1),
          filterBody_pod_2('С фото', 2),
        ],
      ),
    );
  }

  Widget filterBody_pod_2(String text, int i) {
    return SizedBox(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            // style: const TextStyle(
            //   fontFamily: 'Gilroy',
            //   fontStyle: FontStyle.normal,
            //   fontWeight: FontWeight.w600,
            //   fontSize: 14,
            //   letterSpacing: 1,
            //   // color: Color(0xFF333333),
            //   color: black33,
            // ),
            style: ts33_14_600_0,
          ),
          Checkbox(
            value: i == 1 ? isRastomojen : withPhoto,
            // activeColor: const Color(0xFF333333),
            activeColor: color_green,
            // checkColor: Colors.white,
            checkColor: whitef4,
            splashRadius: 20,
            onChanged: ((value) {
              setState(() {
                i == 1 ? isRastomojen = !isRastomojen : withPhoto = !withPhoto;
              });
            }),
          )
        ],
      ),
    );
  }

  SizedBox filterBody_1() {
    return SizedBox(
      // height: 218,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    AlertSetRegionCity(
                  isRegion: true,
                  cities: [],
                  // regionId: 0,
                  setListCities: (List<CityModel> cities) {
                    print(_cities);
                    setState(() {
                      _cities = cities;
                    });
                    print(_cities);
                  },
                  setSelectedCityRegionId: (int regionId, String region) {
                    setState(() {
                      _selectedRegionId = regionId;
                      _selectedRegion = region;
                      _selectedCityId = -1;
                    });
                  },
                ),
              );
            },
            child: filtersBody_pod_1(
              true,
              label: 'Регионы',
              icon: const Icon(
                Icons.location_on,
                // color: Color(0xff878787),
                color: grey87,
                size: 20,
              ),
              _selectedRegionId == -1 ? 'Все регионы' : _selectedRegion,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _selectedRegionId != -1
                  ? showGeneralDialog(
                      context: context,
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          AlertSetRegionCity(
                        isRegion: false,
                        cities: _cities,
                        // regionId: 0,
                        setListCities: () {},
                        setSelectedCityRegionId: (int cityId, String city) {
                          setState(() {
                            _selectedCityId = cityId;
                            _selectedCity = city;
                          });
                        },
                      ),
                    )
                  : null;
              setState(() {
                _tappedGorod = true;
              });
            },
            child: filtersBody_pod_1(
              true,
              label: 'Городы',
              icon: const Icon(
                Icons.location_on,
                // color: Color(0xff878787),
                color: grey87,
                size: 20,
              ),
              _selectedCityId == -1 ? 'Все городы' : _selectedCity,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _tappedGorod && (_selectedRegionId == -1) ? 32 : 0,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Выберите регион',
                style: tsred_12_500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    AlertSetMarkaModel(
                  isMarka: true,
                  // regionId: 0,
                  // setListCities: (List<CityModel> cities) {
                  //   print(_cities);
                  //   setState(() {
                  //     _cities = cities;
                  //   });
                  //   print(_cities);
                  // },
                  setSelectedMarkaModelId: (int markaId, String marka) {
                    setState(() {
                      _selectedMarkaId = markaId;
                      _selectedMarka = marka;
                      _selectedModelId = -1;
                    });
                  },
                  markaId: _selectedMarkaId,
                ),
              );
            },
            child: filtersBody_pod_1(
              true,
              _selectedMarkaId == -1 ? 'Все марки' : _selectedMarka,
              label: 'Выберите марку машины',
              icon: const Icon(
                CupertinoIcons.car_detailed,
                // color: Color(0xff878787),
                color: grey87,
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // filtersBody_pod_1(
          //   false,
          //   'Показать расширенный поиск',
          // ),
          GestureDetector(
            onTap: () {
              _selectedMarkaId != -1
                  ? showGeneralDialog(
                      context: context,
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          AlertSetMarkaModel(
                        isMarka: false,
                        // cities: _cities,
                        // regionId: 0,
                        // setListCities: () {},
                        markaId: _selectedMarkaId,
                        setSelectedMarkaModelId: (int modelId, String model) {
                          setState(() {
                            _selectedModelId = modelId;
                            _selectedModel = model;
                          });
                        },
                      ),
                    )
                  : null;
              setState(() {
                _tappedModel = true;
              });
            },
            child: filtersBody_pod_1(
              true,
              // label: 'Выберите модель марки',
              _selectedModelId == -1 ? 'Все модели' : _selectedModel,
              label: 'Выберите модель марки',
              icon: const Icon(
                CupertinoIcons.car_detailed,
                // color: Color(0xff878787),
                color: grey87,
                size: 20,
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _tappedModel && (_selectedMarkaId == -1) ? 32 : 0,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Выберите марку машины',
                style: tsred_12_500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox filtersBody_pod_1(bool isLabel, String text,
      {String? label, Icon? icon}) {
    return SizedBox(
      // height: isLabel ? 67 : 44,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          isLabel
              ? Text(
                  label!,
                  style: ts87_14_400_0,
                )
              : const SizedBox(),
          Container(
            height: 44,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: bd,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isLabel ? icon! : const SizedBox(),
                    SizedBox(width: isLabel ? 8 : 0),
                    Text(
                      text,
                      // style: const TextStyle(
                      //   fontFamily: 'Gilroy',
                      //   fontStyle: FontStyle.normal,
                      //   fontWeight: FontWeight.w400,
                      //   fontSize: 14,
                      //   letterSpacing: -0.16,
                      //   // color: Color(0xff333333),
                      //   color: black33,
                      // ),
                      style: ts33_14_400_01,
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                  // color: Colors.black,
                  color: black11,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container sostoyania(double maxWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 67,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Состояние',
            style: ts87_14_400_0,
          ),
          Container(
            height: 44,
            width: double.infinity,
            padding: const EdgeInsets.all(4),
            decoration: bd,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                choiceContainer(1, 'Все', maxWidth),
                choiceContainer(2, 'Новая', maxWidth),
                choiceContainer(3, 'С пробегом', maxWidth),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget choiceContainer(int i, String name, double maxWidth) {
    bool isSel = i == selectedIndex;
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = i;
        });
      },
      child: Container(
        // height: 36,
        // width: 110,
        width: (maxWidth - 8 - 40) / 3,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          // color: isSel ? const Color(0xff333333) : null,
          color: isSel ? black33 : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            name,
            // style: TextStyle(
            //   fontFamily: 'Gilroy',
            //   fontStyle: FontStyle.normal,
            //   fontWeight: isSel ? FontWeight.w600 : FontWeight.w400,
            //   fontSize: 14,
            //   // height: 20,
            //   letterSpacing: -0.16,
            //   // color: isSel ? Colors.white : const Color(0xff333333),
            //   color: isSel ? whitef4 : black33,
            // ),
            style: isSel ? tsf4_14_600_01 : ts33_14_400_01,
          ),
        ),
      ),
    );
  }

  Widget closeBody() {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: [
                const Icon(
                  Icons.close,
                  // size: 14.14,
                  size: 16.14,
                  // color: Colors.black,
                  color: black11,
                ),
                const SizedBox(width: 12),
                Text(
                  'Фильтры',
                  // style: TextStyle(
                  //   fontFamily: 'Gilroy',
                  //   fontStyle: FontStyle.normal,
                  //   fontWeight: FontWeight.w500,
                  //   fontSize: 16,
                  //   // height: 20,
                  //   letterSpacing: 1,
                  //   // color: Color(0xFF000000),
                  //   color: black11,
                  // ),
                  style: ts11_16_500_1,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<GetAdvertisementsBloc>().add(
                  GetAvtoAdvertisementsEvent(AvtoRequestModel(
                      withPhoto: false, isRastomojen: false, page: 1)));
              context.read<GetBannerBloc>().add(GetBannerEvent());
              Navigator.pop(context);
            },
            child: Row(
              children: [
                const Icon(
                  CupertinoIcons.refresh_bold,
                  // size: 12.19,
                  size: 14.19,
                  // color: Color(0xff2DC36A),
                  color: color_green,
                ),
                const SizedBox(width: 12),
                Text(
                  'Сбросить',
                  // style: TextStyle(
                  //   fontFamily: 'Gilroy',
                  //   fontStyle: FontStyle.normal,
                  //   fontWeight: FontWeight.w500,
                  //   fontSize: 16,
                  //   // height: 20,
                  //   letterSpacing: 1,
                  //   // color: Color(0xff2DC36A),
                  //   color: color_green,
                  // ),
                  style: tsgr_16_500_0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
