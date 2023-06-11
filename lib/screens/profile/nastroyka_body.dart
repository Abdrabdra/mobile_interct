import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import 'package:flutter/material.dart';

bool isWritten = false;
// TextStyle ts = const TextStyle(
//   fontFamily: 'Gilroy',
//   fontStyle: FontStyle.normal,
//   fontWeight: FontWeight.w600,
//   fontSize: 16,
//   letterSpacing: 1,
//   color: black33,
// );
int countPhone = 1;

TextEditingController nameController = TextEditingController(text: 'Акжол');
TextEditingController phoneController =
    TextEditingController(text: '+ 7 707 188 1834');
// Color color_green = const Color(0xff2DC36A);

class NastroykaBody extends StatefulWidget {
  const NastroykaBody({super.key});

  @override
  State<NastroykaBody> createState() => _NastroykaBodyState();
}

class _NastroykaBodyState extends State<NastroykaBody> {
  @override
  Widget build(BuildContext context) {
    double maxW = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            name(),
            body_1(maxW),
            language(),
          ],
        ),
      ),
    );
  }

  Container language() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              print('language');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // icon i name
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/language.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Русский язык',
                      // style: TextStyle(
                      //   fontSize: 16,
                      //   fontWeight: FontWeight.w600,
                      //   color: black33,
                      // ),
                      style: ts33_16_600_1,
                    ),
                  ],
                ),
                // icon right seryi
                const Icon(
                  Icons.chevron_right,
                  color: grey87,
                  size: 26,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container body_1(double maxW) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          parol(),
          divider(maxW),
          bank_karty(),
          divider(maxW),
          archive(),
        ],
      ),
    );
  }

  Container divider(double maxW) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
      width: maxW - 24 - 36,
      height: 1,
      color: greyc1,
    );
  }

  Widget archive() {
    return InkWell(
      onTap: () {
        print('archive');
        Navigator.of(context).pushNamed('/archive');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // icon i name
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/archive.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Архив',
                // style: TextStyle(
                //   fontSize: 16,
                //   fontWeight: FontWeight.w600,
                //   color: black33,
                // ),
                style: ts33_16_600_1,
              ),
            ],
          ),
          // icon right seryi
          const Icon(
            Icons.chevron_right,
            color: grey87,
            size: 26,
          ),
        ],
      ),
    );
  }

  Widget bank_karty() {
    return InkWell(
      onTap: () {
        print('Bank karty');
        Navigator.of(context).pushNamed('/bankKarty');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // icon i name
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/bank_karty.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Банковские карты',
                // style: TextStyle(
                //   fontSize: 16,
                //   fontWeight: FontWeight.w600,
                //   color: black33,
                // ),
                style: ts33_16_600_1,
              ),
            ],
          ),
          // icon right seryi
          const Icon(
            Icons.chevron_right,
            color: grey87,
            size: 26,
          ),
        ],
      ),
    );
  }

  Widget parol() {
    return InkWell(
      onTap: () {
        print('parol');
        Navigator.of(context).pushNamed('/parol');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // icon i name
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/key_icon.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Изменить пароль',
                // style: TextStyle(
                //   fontSize: 16,
                //   fontWeight: FontWeight.w600,
                //   color: black33,
                // ),
                style: ts33_16_600_1,
              ),
            ],
          ),
          // icon right seryi
          const Icon(
            Icons.chevron_right,
            color: grey87,
            size: 26,
          ),
        ],
      ),
    );
  }

  Container name() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Text(
        'Настройки',
        // style: TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.w600,
        //   letterSpacing: 0.5,
        //   color: black11,
        // ),
        style: ts11_20_600_05,
      ),
    );
  }
}
