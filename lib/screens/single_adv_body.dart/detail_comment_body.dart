// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../../../data/models/single_avto_adv_model.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../../widgets/Expandable_text.dart';
// import '../home_page/advertisement_tile.dart';
import 'commentsBody.dart';
import 'detailsBody/detailsBody.dart';

// Color black33 = const Color(0xff333333);
// Color color_green = const Color(0xFF2DC36A);
// Color color_grey = const Color(0xFF878787);

List details = [
  'Город отправления',
  'Город прибытия',
  'Район отправления',
  'Районы прибытия',
  'Дата прибытия',
  'Время Прибытия',
  // 'Коробка передач',
  // 'Расстоможен в КЗ',
  // 'Руль',
  // 'Цвет',
  // 'Состояние',
];
List detailsOtwet = [
  'Алматы',
  '2016-2020 W213/S213/C238/A23',
  'Купе',
  '3л',
  '5 000км',
  'Задний привод',
  'Автомат',
  'Да',
  'Слева',
  'Синий',
  'Состояние',
];

String opisanie = 'Среди опций есть контурная подсветка (30 цветов на выбор)'
    ' и электропривод передних сидений. Заявлены скребок для льда.Среди опций '
    'есть контурная подсветка (30 цветов на выбор) и электропривод'
    'Среди опций есть контурная подсветка (30 цветов на выбор)'
    ' и электропривод передних сидений. Заявлены скребок для льда.Среди опций '
    'есть контурная подсветка (30 цветов на выбор) и электропривод'
    ' передних сидений. Заявлены скребок для льда.';

// List<String> list = [
//   'Audi A8',
//   'Tesla Model - S',
//   'Mercedes Benz S-class',
//   'Lexus L500 F600',
//   'BMW M5',
// ];

// TextStyle ts = const TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w600,
//   letterSpacing: 0.64,
//   fontFamily: 'Gilroy',
//   color: black11,
// );

class Detail_Comment_Body extends StatefulWidget {
  const Detail_Comment_Body({
    Key? key,
    required this.saam,
  }) : super(key: key);
  final SingleAvtoAdvModel saam;

  @override
  State<Detail_Comment_Body> createState() => _Detail_Comment_BodyState();
}

bool otvet = true;
int _pageDC = 0;

class _Detail_Comment_BodyState extends State<Detail_Comment_Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.saam.cityFrom);
    detailsOtwet = [
      widget.saam.cityFrom,
      widget.saam.cityTo,
      widget.saam.districtFrom,
      widget.saam.districtTo,
      widget.saam.arrivalDate,
      widget.saam.arrivalTime,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          checkDetail(),
          const SizedBox(height: 10),
          _pageDC == 0
              ? detailsBody(
                  // details, detailsOtwet, widget.saam.description, list)
                  details,
                  detailsOtwet,
                  // widget.saam.cityFrom,
                  // list,
                )
              : CommentsBody(
                  comments: [],
                  saam: widget.saam,
                ),
          // pohozhie(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Container checkDetail() {
    return Container(
      width: double.infinity,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: elements('Детали', 0)),
          const SizedBox(width: 6),
          Expanded(
            child: elements('Комментарии (0)', 1),
          ),
        ],
      ),
    );
  }

  Widget elements(String name, int page) {
    return InkWell(
      onTap: () {
        setState(() {
          _pageDC = page;
        });
      },
      child: Container(
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _pageDC == page ? black33 : white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          name,
          // style: TextStyle(
          //   fontSize: 14,
          //   color: i == isDetail ? whitef4 : black33,
          //   fontWeight: FontWeight.w600,
          //   letterSpacing: 0.16,
          //   fontFamily: 'Gilroy',
          // ),
          style: _pageDC == page ? tsf4_14_600_01 : ts33_14_600_01,
        ),
      ),
    );
  }
}
