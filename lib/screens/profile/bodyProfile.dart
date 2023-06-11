import 'package:hive_flutter/adapters.dart';
import 'package:interct_2/data/constants/sized_boxes.dart';
import 'package:interct_2/data/models/userme_model.dart';
import 'package:interct_2/screens/login_page/login_page.dart';
import 'package:interct_2/screens/profile/lichnye_dannie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interct_2/screens/profile/moi_bilety_page.dart';

import '../../data/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../data/constants/textStyles.dart';
import '../single_adv_body.dart/homeSingleAdv.dart';
import 'blocs/get_user_me_bloc/get_user_me_bloc.dart';
import 'moi_obyavlenie_page.dart';

class BodyProfilePage extends StatefulWidget {
  const BodyProfilePage({super.key});

  @override
  State<BodyProfilePage> createState() => _BodyProfilePageState();
}

// Color grey87 = const Color(0xff999999);
// Color color_green = const Color(0xff2DC36A);
EdgeInsets marginV10 = const EdgeInsets.symmetric(vertical: 10);
EdgeInsets padAl16 = const EdgeInsets.all(16);
// TextStyle tsStatic_nast = const TextStyle(
//   fontSize: 15,
//   fontWeight: FontWeight.w500,
//   letterSpacing: 0.5,
//   color: black11,
// );
// TextStyle tsStatic_nast_txt = const TextStyle(
//   fontSize: 12,
//   fontWeight: FontWeight.w600,
//   letterSpacing: 0.5,
//   color: grey87,
// );
// String name = 'Lexus LF LC 500';
// int prosmotr = 200;
// int likeCount = 36;

class _BodyProfilePageState extends State<BodyProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetUserMeBloc>().add(GetUserMeEvent());
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    // maxWidth = 320;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileInfo(maxWidth),
          // statics_nastroyka(),
          // moi_obyavlenie_body(maxWidth),
          // const SizedBox(height: 76)
          sb_h10(),
          obyavlenie(),
          sb_h10(),
          bilety(),
          Spacer(),
          InkWell(
            onTap: () {
              var tokenBox = Hive.box('tokens');
              tokenBox.clear();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (route) => true);
            },
            child: Container(
              width: maxWidth - 24,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: redff0,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Выйти',
                style: tsf4_16_600_0,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          sb_h48(),
          sb_h20(),
        ],
      ),
    );
  }

  InkWell bilety() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MoiBiletyPage();
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: black11,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              'Мои билеты',
              style: tsf4_16_600_0,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward,
              color: whitef4,
            ),
          ],
        ),
      ),
    );
  }

  Widget obyavlenie() {
    return BlocBuilder<GetUserMeBloc, GetUserMeState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            state is GetUserMeSuccess
                ? Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                    return MoiObyavleniePage(busId: state.umm.busId);
                  }))
                : null;
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: black11,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  'Мои обьявления',
                  style: tsf4_16_600_0,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward,
                  color: whitef4,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget moi_obyavlenie_body(double maxWidth) {
    return Container(
      margin: marginV10,
      width: maxWidth - 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: const Color(0xff111111),
        color: black11,
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // moi obyavlenie
          moi_obyav(),
          // dva obyavlenya
          Container(
            padding: const EdgeInsets.only(right: 10),
            // margin: EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // pervoe
                obyavlenie_tile(maxWidth, 'Lexus LF LC 500', 200, 36),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 1,
                  // color: Color(0xff262D35),
                  color: black33,
                ),
                obyavlenie_tile(maxWidth, 'BMW m5', 1200, 36),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget obyavlenie_tile(
      double maxWidth, String name, int prosmotr, int likeCount) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SingleAdvPage(
                  isAuthors: true,
                  id: 0,
                )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: black11.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/obyavlenie_photo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  width: maxWidth - 12 - 20 - 50 - 16 - 32 - 10 - 16 - 12,
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
                        //   fontWeight: FontWeight.w400,
                        //   color: whitef4,
                        //   letterSpacing: 0.8,
                        //   fontFamily: 'Gilroy',
                        // ),
                        style: tsf4_16_400_08,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${prosmotr.toString()} просмотров'
                        ' | ${likeCount.toString()} лайков',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        // style: TextStyle(
                        //   fontSize: 12,
                        //   fontWeight: FontWeight.w500,
                        //   letterSpacing: 0.8,
                        //   color: grey87,
                        // ),
                        style: ts87_12_500_0,
                      )
                    ],
                  ),
                ),
                // SizedBox(width: 8),
              ],
            ),
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(
                'assets/images/double_right.png',
              ),
              backgroundColor: black11,
            ),
          ],
        ),
      ),
    );
  }

  Widget moi_obyav() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/moiObyavlenie');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Мои объявления',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: whitef4,
                letterSpacing: 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.chevron_right,
                color: color_green,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container statics_nastroyka() {
    return Container(
      margin: marginV10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          statics(),
          const SizedBox(width: 20),
          nastroyka(),
        ],
      ),
    );
  }

  Widget nastroyka() {
    return Flexible(
      child: InkWell(
        onTap: () {
          print('nastroyka');
          Navigator.of(context).pushNamed('/nastroyka');
        },
        child: Container(
          padding: padAl16,
          decoration: BoxDecoration(
            // color: const Color(0xffB5FBDD),
            color: greenNastroyka,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/nastroyka_icon.png'),
              ),
              const SizedBox(height: 20),
              Text(
                'Настройки',
                style: ts11_15_500_05,
              ),
              const SizedBox(height: 10),
              Text(
                'Способ оплаты. Изменение языка, цвета. ',
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: ts87_12_600_05,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget statics() {
    return Flexible(
      child: InkWell(
        onTap: () {
          print('statics');
          Navigator.of(context).pushNamed('/statics');
        },
        child: Container(
          padding: padAl16,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/statics_icon.png'),
              ),
              const SizedBox(height: 20),
              Text(
                'Статистика',
                style: ts11_15_500_05,
              ),
              const SizedBox(height: 10),
              Text(
                'Статистика продаж, просмотровкликов и т.д.',
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: ts87_12_600_05,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget profileInfo(double maxWidth) {
    return BlocBuilder<GetUserMeBloc, GetUserMeState>(
      builder: (context, state) {
        if (state is GetUserMeFailure) {
          var tokenBox = Hive.box('tokens');

          if (tokenBox.isEmpty) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return LoginPage();
            }), (route) => false);
          }
        }
        return InkWell(
          onTap: () {
            //  state is GetUserMeSuccess? Navigator.of(context).pushNamed('/lichnyeDannye', arguments: state.umm):null;
            state is GetUserMeSuccess
                ? Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                    return LichnyeDannye(
                      umm: state.umm,
                    );
                  }))
                : null;
          },
          child: Container(
            width: maxWidth - 24,
            padding: padAl16,
            margin: marginV10,
            decoration: BoxDecoration(
              // color: const Color(0xffFFDFDC),
              color: rosovyi,
              borderRadius: BorderRadius.circular(20),
            ),
            child: state is GetUserMeLoading
                ? SizedBox(
                    height: 190,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        // SizedBox(height: 100),
                        CircularProgressIndicator(
                          color: black11,
                        ),
                      ],
                    ),
                  )
                : state is GetUserMeSuccess
                    ? Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// avatarka i imya/nomer
                                avatarka_name(state.umm),
                                // time on avto-like
                                sb_h10(),
                                // time_on_AutoLike(),
                                //count like and post
                                Row(
                                  children: [
                                    post_like(Icons.photo, '0 постов'),
                                    const SizedBox(width: 8),
                                    post_like(Icons.favorite, '0 лайков'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundImage:
                                  AssetImage('assets/images/right.png'),
                            ),
                          )
                        ],
                      )
                    : state is GetUserMeFailure
                        ? Container(
                            height: 150,
                            alignment: Alignment.center,
                            child: Text(
                              'ERROR',
                              style: tsgr_12_600_08,
                            ),
                          )
                        : SizedBox(),
          ),
        );
      },
    );
  }

  Container post_like(IconData iconData, String txt) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whitef4,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 22,
            color: color_green,
          ),
          const SizedBox(width: 10),
          Text(
            txt,
            // style: const TextStyle(
            //   fontSize: 12,
            //   fontWeight: FontWeight.w600,
            //   letterSpacing: 0.5,
            //   color: black11,
            // ),
            style: ts11_12_600_05,
          )
        ],
      ),
    );
  }

  Container time_on_AutoLike() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.centerLeft,
      child: RichText(
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        maxLines: 2,
        text: TextSpan(
          text: 'C Avto-Like ',
          // style: TextStyle(
          //   fontSize: 14,
          //   fontWeight: FontWeight.w600,
          //   letterSpacing: 0.5,
          //   color: grey87,
          // ),
          style: ts87_14_600_05,
          children: <TextSpan>[
            TextSpan(
                text: 'с 2023г. 21 апреля',
                // style: TextStyle(
                //   fontSize: 14,
                //   fontWeight: FontWeight.w600,
                //   letterSpacing: 0.5,
                //   color: black11,
                // ),
                style: ts11_14_600_05),
          ],
        ),
      ),
    );
  }

  Row avatarka_name(UserMeModel umm) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 32,
          backgroundColor: white,
          // backgroundImage: AssetImage('assets/images/avatarka.png'),
          child: Center(
              child: Icon(
            Icons.person,
            color: black11,
            size: 36,
          )),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // 'Инсар Еркимбеков',
                umm.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                // style: TextStyle(
                //   fontSize: 20,
                //   fontWeight: FontWeight.w500,
                //   letterSpacing: 0.5,
                //   color: black11,
                // ),
                style: ts11_20_500_05,
              ),
              const SizedBox(height: 8),
              Text(
                // '+ 7 707 188 18 34',
                umm.phone.substring(0, 2) +
                    // ' ' +
                    umm.phone.substring(2, 5) +
                    // ' ' +
                    umm.phone.substring(5, 8) +
                    // ' ' +
                    umm.phone.substring(8),

                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                // style: TextStyle(
                //   fontSize: 14,
                //   fontWeight: FontWeight.w600,
                //   letterSpacing: 0.5,
                //   color: grey87,
                // ),
                style: ts87_14_600_05,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
