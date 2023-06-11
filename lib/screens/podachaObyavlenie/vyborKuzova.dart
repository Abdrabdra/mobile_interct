import 'dart:convert';

import '../../data/constants/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../data/models/kuzov_model.dart';
import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';
String kuzaovDatas = '''
[
  {
    "id": 1,
    "title": "Седан"
  },
  {
    "id": 2,
    "title": "Хэтчбек"
  },
  {
    "id": 3,
    "title": "Универсал"
  },
  {
    "id": 4,
    "title": "Лифтбек"
  },
  {
    "id": 5,
    "title": "Внедорожник"
  },
  {
    "id": 6,
    "title": "Кабриолет"
  },
  {
    "id": 7,
    "title": "Пикап"
  }
]''';
List listMarki1 = ['Лифтбек', 'Кабриолет', 'Купе', 'Седан'];
List<KuzovModel> listKuzov= [
  
];
class VyborKuzova extends StatefulWidget {
  const VyborKuzova({
    Key? key,
    // required this.optionsListt,
    required this.stt,
  required this.paa,
  }) : super(key: key);
  final PodachaAvtoAdver paa;

  // final List optionsListt;
  final Function stt;

  @override
  State<VyborKuzova> createState() => _VyborKuzovaState();
}

class _VyborKuzovaState extends State<VyborKuzova> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<dynamic> kuzovs = jsonDecode(kuzaovDatas);
    for (var e in kuzovs) {
      listKuzov.add(KuzovModel(id: e['id'], name: e['name']) );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              // widget.optionsListt.length,
              listKuzov.length,
              (index) => GestureDetector(
                onTap: () {
                  widget.stt(widget.paa.copyWith(typeKuzov: listKuzov[index].id));
                },
                child: opW(
                  // optionName: widget.optionsListt[index] as String,
                  optionName: listKuzov[index].name as String,
                  stt: widget.stt,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class opW extends StatelessWidget {
  const opW({
    Key? key,
    required this.optionName,
    required this.stt,
  }) : super(key: key);

  final String optionName;
  final Function stt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          stt();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  optionName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  // style: const TextStyle(
                  //   fontSize: 18,
                  //   fontWeight: FontWeight.w600,
                  //   letterSpacing: 0.8,
                  //   color: black11,
                  //   fontFamily: 'Gilroy',
                  // ),
                  style: ts11_18_600_08,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 24,
              color: black11,
            )
          ],
        ),
      ),
    );
  }
}
