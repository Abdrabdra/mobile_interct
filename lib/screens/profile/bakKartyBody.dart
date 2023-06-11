import '../../data/constants/textStyles.dart';
import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../../data/models/bank_karta_model.dart';
import 'alertBody.dart';

bool isWritten = false;
// TextStyle ts = const TextStyle(
//   fontFamily: 'Gilroy',
//   fontStyle: FontStyle.normal,
//   fontWeight: FontWeight.w600,
//   fontSize: 16,
//   letterSpacing: 1,
//   // color: Color(0xFF333333),
//   color: black33,
// );
// TextStyle tsHint = const TextStyle(
//   fontFamily: 'Gilroy',
//   fontStyle: FontStyle.normal,
//   fontWeight: FontWeight.w600,
//   fontSize: 16,
//   letterSpacing: 1,
//   // color: Color(0xFFC3C3C3),
//   color: greyc1,
// );
List<BankKarta> kartyList = [
  BankKarta(
    id: 0,
    type: 'Visa',
    numberKarta: '4400786512345678',
    name_surname: 'Seiitmurat Kazbek',
    month: 9,
    year: 2024,
    cvc: 675,
  ),
  BankKarta(
    id: 1,
    type: 'Visa',
    numberKarta: '4400786512349012',
    name_surname: 'Seiitmurat Kazbek',
    month: 12,
    year: 2025,
    cvc: 763,
  ),
];
int countKarta = kartyList.length;

// TextEditingController nomerKartyController =
//     TextEditingController(text: '4400 - 4568 - 455|');
// TextEditingController imyaController = TextEditingController();
// TextEditingController timeController = TextEditingController();
// TextEditingController cvcController = TextEditingController();
// Color color_green = const Color(0xff2DC36A);
// Color color_grey = const Color(0xff999999);

class BankKartyBody extends StatefulWidget {
  const BankKartyBody({super.key});

  @override
  State<BankKartyBody> createState() => _BankKartyBodyState();
}

class _BankKartyBodyState extends State<BankKartyBody> {
  void dobavitKartuFunction(BankKarta bk) {
    setState(() {
      countKarta++;
      kartyList.add(bk);
    });
  }

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
            txtBank(),
            // izmenenieParolinputs(maxW),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                kartyList.length,
                (index) =>
                    // karta_tile(maxW, 'Visa **** 1212', 9, 24),

                    karta_tile(
                  maxW,
                  '${kartyList[index].type}'
                  ' **** ${kartyList[index].numberKarta.substring(12, 16)}',
                  kartyList[index].month,
                  kartyList[index].year,
                ),
              ),
            ),
            // karta_tile(maxW, 'Visa **** 1212', 9, 24),
            // karta_tile(maxW, 'Visa **** 3468', 14, 25),
            dobavitKatu(maxW),
          ],
        ),
      ),
    );
  }

  InkWell dobavitKatu(double maxWidth) {
    return InkWell(
      onTap: () {
        // setState(
        //   () {
        showGeneralDialog(
          context: context,
          // barrierDismissible: true,
          pageBuilder: ((context, animation, secondaryAnimation) =>
              // alertDialog(maxWidth, context)),
              AlertDialogBody(
                dobavitKartu: (BankKarta bk) {
                  dobavitKartuFunction(bk);
                },
              )),
        );
        //   },
        // );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: maxWidth - 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: const Color(0xff333333),
          color: black33,
        ),
        alignment: Alignment.center,
        child: Text(
          'Добавить новую карту',
          // style: TextStyle(
          //   fontSize: 18,
          //   fontWeight: FontWeight.w600,
          //   // color: Colors.white,
          //   color: whitef4,
          // ),
          style: tsf4_18_600_0,
        ),
      ),
    );
  }

  Container txtBank() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        'Банковские карты',
        // style: TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.w600,
        //   letterSpacing: 0.5,
        //   // color: Colors.black,
        //   color: black11,
        // ),
        style: ts11_20_600_05,
      ),
    );
  }

  Widget karta_tile(double maxWidth, String name, int month, int year) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        // color: Colors.white,
        color: white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 20,
            decoration: const BoxDecoration(
              // color: Colors.white,
              color: white,
              image: DecorationImage(
                image: AssetImage('assets/images/visa.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 24),
          SizedBox(
            // margin: const EdgeInsets.symmetric(vertical: 4),
            width: maxWidth - 12 - 20 - 50 - 24 - 16 - 20 - 12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  // 'ndjsnacknejdsncjkenfdjkcnefknj efvn in ervndijen vnejrn',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  // style: const TextStyle(
                  //   fontSize: 16,
                  //   fontWeight: FontWeight.w700,
                  //   // color: Color(0xff333333),
                  //   color: black33,
                  //   fontFamily: 'Gilroy',
                  // ),
                  style: ts33_16_700_0,
                ),
                const SizedBox(height: 8),
                Text(
                  month < 10
                      ? '0${month.toString()}'
                          '/ ${year.toString()}'
                      : '${month.toString()}'
                          '/ ${year.toString()}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  // style: const TextStyle(
                  //   fontSize: 12,
                  //   fontWeight: FontWeight.w500,
                  //   letterSpacing: 0.8,
                  //   color: greyc1,
                  // ),
                  style: tsc1_12_500_08,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
