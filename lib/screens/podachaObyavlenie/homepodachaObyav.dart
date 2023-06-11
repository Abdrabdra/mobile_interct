import 'package:interct_2/data/models/podacha_adver_model/podacha_avto_adver.dart';
import 'package:interct_2/screens/podachaObyavlenie/vybor_city.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/sized_boxes.dart';
import '../../screens/podachaObyavlenie/appBar.dart';
import '../../screens/podachaObyavlenie/dobavitPhoto.dart';
import '../../screens/podachaObyavlenie/na_proverke.dart';
import '../../screens/podachaObyavlenie/contacts.dart';
import '../../screens/podachaObyavlenie/priceCar.dart';
import '../../screens/podachaObyavlenie/vyborColor.dart';
import '../../screens/podachaObyavlenie/vyborGoda.dart';
import '../../screens/podachaObyavlenie/vyborModificatsii.dart';
import '../../screens/podachaObyavlenie/vyborModificatsii2.dart';
import '../../screens/podachaObyavlenie/vyborRayon.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/constants/textStyles.dart';
import 'blocs/post_advers_bloc/post_advers_bloc.dart';
import 'vyborCar.dart';
import 'vyborKuzova.dart';
import 'vyborMarki1.dart';
import 'vyborMarki2.dart';
import 'vyborPokolenie.dart';

// ignore: must_be_immutable
class PodachaObyavlenie extends StatefulWidget {
  PodachaObyavlenie({super.key, required this.selectedCh});
  int selectedCh;
  @override
  State<PodachaObyavlenie> createState() => _PodachaObyavlenieState();
}

// Map<int, List> optionsList = {
//   0: List.generate(33, (index) => 'Acura'),
//   1: List.generate(8, (index) => 'A1'),
//   2: List.generate(33, (index) => '2022'),
//   3: List.generate(4, (index) => 'Лифтбек'),
//   4: List.generate(1, (index) => '2007-2011 поколение (А5)'),
// };

PodachaAvtoAdver _paa = PodachaAvtoAdver();

class _PodachaObyavlenieState extends State<PodachaObyavlenie> {
  late int selectedChast = widget.selectedCh;
  // late int selectedChast = 14;

  bool canTap = false;

  void stButton(PodachaAvtoAdver paa) {
    print('stbutton method');
    setState(() {
      canTap = !canTap;
      _paa = paa;
    });
  }

  void st(PodachaAvtoAdver podachaAvtoAdver) {
    print('st method');
    setState(() {
      // selectedChast = selectedChast++;
      selectedChast++;
      _paa = podachaAvtoAdver;
    });
  }

  // dlya znanie kolichestvo stranits
  Map<int, dynamic> optionsChecker = {
    0: VyborCar(
      stt: () {},
      stButton: () {},
      paa: _paa,
    ),
    1: VyborMarka(
      stt: () {},
      paa: _paa,
    ),
    2: VyborModel(
      stt: () {},
      paa: _paa,
    ),
    3: VyborGoda(
      stt: () {},
      paa: _paa,
    ),
    4: VyborKuzova(
      stt: () {},
      paa: _paa,
    ),
    5: VyborPokolenie(
      stt: () {},
      paa: _paa,
    ),
    6: VyborModification(
      stt: () {},
      stButton: () {},
      paa: _paa,
    ),
    7: VyborModification_2(
      stt: () {},
      stButton: () {},
      paa: _paa,
    ),
    8: PriceCar(
      stt: () {},
      stButton: () {},
      paa: _paa,
    ),
    9: DobavitPhoto(
      stNextPage: () {},
      stCanTap: () {},
      paa: _paa,
    ),
    10: VyborColor(
      stt: () {},
      stButton: () {},
      paa: _paa,
    ),
    11: VyborRayona(
      stt: () {},
      stButton: () {},
      paa: _paa,
    ),
    12: Contacts(
      stt: () {},
      stButton: () {},
      paa: _paa,
    ),
    13: NaProverke(
      stCanTap: () {},
      paa: _paa,
    ),
  };

  Widget callPage(int i) {
    switch (i) {
      case 0:
        return VyborCar(
          stt: st,
          stButton: stButton,
          paa: _paa,
        );
      case 1:
        return VyborMarka(
          stt: st,
          paa: _paa,
        );
      case 2:
        return VyborModel(
          stt: st,
          paa: _paa,
        );
      case 3:
        return VyborGoda(
          stt: st,
          paa: _paa,
        );
      case 4:
        return VyborKuzova(
          stt: st,
          paa: _paa,
        );
      case 5:
        return VyborPokolenie(
          stt: st,
          paa: _paa,
        );
      case 6:
        return VyborModification(
          stt: st,
          stButton: stButton,
          paa: _paa,
        );
      case 7:
        return VyborModification_2(
          stt: st,
          stButton: stButton,
          paa: _paa,
        );
      case 8:
        return PriceCar(
          stt: st,
          stButton: stButton,
          paa: _paa,
        );
      case 9:
        return DobavitPhoto(
          stNextPage: st,
          stCanTap: stButton,
          paa: _paa,
        );
      case 10:
        return VyborColor(
          stt: st,
          stButton: stButton,
          paa: _paa,
        );
      case 11:
        return VyborRayona(
          stt: st,
          stButton: stButton,
          paa: _paa,
        );
      case 12:
        return Contacts(
          stt: st,
          stButton: stButton,
          paa: _paa,
        );
      case 13:
        return NaProverke(
          stCanTap: stButton,
          paa: _paa,
        );

      // break;
      default:
        return Container();
    }
  }

  List<String> appBarNames = [
    'Подача объявления',
    'Выберите марку',
    'Выберите модель',
    'Выберите год выпуска',
    'Выберите кузов',
    'Выберите поколение',
    'Выберите модификацию',
    'Выберите модификацию',
    'Цена машины',
    'Выберите фотографию',
    'Выберите модификацию',
    'Выберите регион машины',
    'Выберите город машины',
    'Контакты',
    // 'Предпросмотр',
    'Объявление на проврке',
  ];

  Widget getPage(int index) {
    List<Widget> widgetPages = [
      VyborCar(
        stt: st,
        stButton: stButton,
        paa: _paa,
      ),
      VyborMarka(
        stt: st,
        paa: _paa,
      ),
      VyborModel(
        stt: st,
        paa: _paa,
      ),
      VyborGoda(
        stt: st,
        paa: _paa,
      ),
      VyborKuzova(
        stt: st,
        paa: _paa,
      ),
      VyborPokolenie(
        stt: st,
        paa: _paa,
      ),
      VyborModification(
        stt: st,
        stButton: stButton,
        paa: _paa,
      ),
      VyborModification_2(
        stt: st,
        stButton: stButton,
        paa: _paa,
      ),
      PriceCar(
        stt: st,
        stButton: stButton,
        paa: _paa,
      ),
      DobavitPhoto(
        stNextPage: st,
        stCanTap: stButton,
        paa: _paa,
      ),
      VyborColor(
        stt: st,
        stButton: stButton,
        paa: _paa,
      ),
      VyborRayona(
        stt: st,
        stButton: stButton,
        paa: _paa,
      ),
      VyborCity(
        stt: st,
        stButton: stButton,
        paa: _paa,
      ),
      Contacts(
        stt: st,
        stButton: stButton,
        paa: _paa,
      ),
      // PredProsmotr(stCanTap: st, paa: _paa,),
      NaProverke(
        stCanTap: stButton,
        paa: _paa,
      ),
    ];
    return widgetPages[index];
  }

  List notFloatingButtonsPage = List.generate(5, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    double chastWidth = (MediaQuery.of(context).size.width - 24 - 28) /
        (optionsChecker.length + 1);
    bool isButtonVisible = !notFloatingButtonsPage.contains(selectedChast);
    return BlocBuilder<PostAdversBloc, PostAdversState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PodachaObyavlenieAppBar(
            context,
            appBarNames[selectedChast],
          ),
          extendBody: true,
          // backgroundColor: const Color(0xFFFAFAFA),
          backgroundColor: whitef4,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Visibility(
              visible: isButtonVisible, child: elevatedButton(context)),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    indexChecker(chastWidth),
                    // callPage(selectedChast),
                    state is PostAdversLoading
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              sb_h16(),
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                              sb_h16(),
                            ],
                          )
                        : state is PostAdversFailure
                            ? Center(
                                child: Text(
                                  'ERROR',
                                  style: tsgr_12_600_08,
                                ),
                              )
                            : getPage(selectedChast),
                    // NaProverke(stCanTap: stButton),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ElevatedButton elevatedButton(BuildContext context) {
    return ElevatedButton(
      autofocus: true,
      onPressed: () {
        if (canTap ||
            // optionsChecker.length - 1 == selectedChast ||
            // selectedChast == 14||
            selectedChast == 13) {
          print('Elevated');
          // st(PodachaAvtoAdver());
          // stButton(PodachaAvtoAdver());
          setState(() {
            canTap = !canTap;
            selectedChast++;
          });
        }
        if (optionsChecker.length - 2 == selectedChast) {
          context
              .read<PostAdversBloc>()
              .add(PostAdversEvent(PodachaAvtoAdver()));
          setState(() {
            canTap = !canTap;
            selectedChast++;
          });
        }
        if (optionsChecker.length - 1 == selectedChast) {
          Navigator.of(context).pop();
        }
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
          color: canTap ||
                  optionsChecker.length - 1 == selectedChast ||
                  selectedChast == 12
              // ? const Color(0xFF2DC36A)
              ? color_green
              // : Colors.green[300],
              : green300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          'Подтвердить',
          textAlign: TextAlign.center,
          // style: TextStyle(
          //   fontSize: 20,
          //   fontWeight: FontWeight.w600,
          //   // color: Colors.white,
          //   color: whitef4,
          // ),
          style: tsf4_20_600_0,
        ),
      ),
    );
  }

  Widget indexChecker(double chastWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          appBarNames.length + 1,
          (index) => Container(
            width: chastWidth,
            height: 3,
            decoration: BoxDecoration(
              color: selectedChast >= index
                  // ? const Color(0xFF2DC36A)
                  ? color_green
                  // : const Color(0xFFE5E7EB),
                  : greyc1,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
      ),
    );
  }
}
