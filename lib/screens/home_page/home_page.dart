// ignore_for_file: prefer_const_constructors

import '../../data/constants/colors.dart';
import '../../data/constants/sized_boxes.dart';
import '../../data/models/avto_request_model.dart';
import '../../screens/home_page/components/banner_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/get_advertisements_bloc/get_advertisements_bloc.dart';
import 'blocs/get_banner_bloc/get_banner_bloc.dart';
import 'components/advertisement_tile.dart';
import 'components/filterBody.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/constants/textStyles.dart';
// import 'components/advertisement_list.dart';
import 'components/categories_body.dart';
import 'foundedAdvers.dart';
// import 'result_search_text.dart';
import 'textObyavlenie.dart';

AvtoRequestModel _arm =
    AvtoRequestModel(withPhoto: false, isRastomojen: false, page: -1);
List<String> _listAuto = [
  'BMW M5',
  'Tesla Model - S',
  'Mercedes Benz S-class',
  'Lexus L500 F600',
  'BMW M5',
  'Mercedes Benz E-class',
  'Volkswagen Polo',
  'Audi A8',
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetAdvertisementsBloc>().add(GetAvtoAdvertisementsEvent(
        AvtoRequestModel(withPhoto: false, isRastomojen: false, page: -1)));
  }

  bool isSearches = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAdvertisementsBloc, GetAdvertisementsState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            unfocus();
          },
          child: Scaffold(
            // appBar: HomeAppBar(),
            appBar: homeAppBar(),
            extendBody: true,
            // backgroundColor: const Color(0xffF4F4F4),
            backgroundColor: whitef4,
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<GetAdvertisementsBloc>().add(
                    GetAvtoAdvertisementsEvent(AvtoRequestModel(
                        withPhoto: false, isRastomojen: false, page: -1)));
                context.read<GetBannerBloc>().add(GetBannerEvent());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      isSearches
                          ? Column(
                              children: [
                                // ResultSearchText(),
                                resultText(),
                                // FoundedAdvText(
                                //   isCar: true,
                                //   length: 0,
                                // ),
                                state is GetAdvertisementsSuccess
                                    ? Container(
                                        margin: const EdgeInsets.only(
                                          // top: 24,
                                          top: 12,
                                          bottom: 0,
                                        ),
                                        height: 38,
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${state.list.length} obyavlenia',
                                              // style: TextStyle(
                                              //   fontSize: 14,
                                              //   fontWeight: FontWeight.w600,
                                              //   // color: Color(0xFF878787),
                                              //   color: grey87,
                                              //   letterSpacing: 1,
                                              // ),
                                              style: ts87_14_600_1,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  // backgroundColor: Colors.white,
                                                  backgroundColor: whitef4,
                                                  isScrollControlled: true,
                                                  builder: (context) =>
                                                      SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height -
                                                            50,
                                                    // margin: const EdgeInsets.symmetric(horizontal: 0),
                                                    child: AvtoFilterBody(
                                                      bannerRecall: false,
                                                      starm: (AvtoRequestModel
                                                          arm) {
                                                        setState(() {
                                                          _arm = arm;
                                                        });
                                                      },
                                                    ),
                                                    // ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 114,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 12),
                                                decoration: BoxDecoration(
                                                  // color: const Color(0xFF2DC36A),
                                                  color: color_green,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Фильтры',
                                                      // style: TextStyle(
                                                      //   fontSize: 14,
                                                      //   fontStyle: FontStyle.normal,
                                                      //   fontWeight: FontWeight.w600,
                                                      //   color: Colors.white,
                                                      //   letterSpacing: 1,
                                                      //   fontFamily: 'Gilroy',
                                                      // ),
                                                      style: tswh_14_600_1,
                                                    ),
                                                    // Icon(
                                                    //   Icons.filter,
                                                    //   size: 14,
                                                    //   // color: Colors.white,
                                                    //   color: whitef4,
                                                    // )
                                                    const SizedBox(
                                                      width: 16,
                                                      height: 16,
                                                      child: Image(
                                                        image: AssetImage(
                                                            'assets/images/filter_icon.png'),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            )
                          : Column(
                              children: [
                                // const CarouselBody(),
                                sb_h10(),
                                BannerBody(),
                                CategoriesBody(),
                                const TextObyavleniya(),
                              ],
                            ),
                      // const AdvertisementBody(isCar: true),
                      state is GetAdvertisementsLoading
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                SizedBox(height: 100),
                                CircularProgressIndicator(
                                  color: black11,
                                ),
                              ],
                            )
                          : state is GetAdvertisementsSuccess
                              ? list_advers(state)
                              : state is GetAdvertisementsFailure
                                  ? Container(
                                      height: 150,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'ERROR',
                                        style: tsgr_12_600_08,
                                      ),
                                    )
                                  : SizedBox(),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: BottomNavBar(
                maxWidth: MediaQuery.of(context).size.width, selectedIndex: 0),
          ),
        );
      },
    );
  }

  Container list_advers(GetAdvertisementsSuccess state) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          state.list.length,
          (index) => AdvertisementTile(
            isCar: true,
            aat: state.list[index],
          ),
        ),
      ),
    );
  }
  // SizedBox(
  //                               height: MediaQuery.of(context).size.height,
  //                               child: ListView.builder(
  //                                 physics: BouncingScrollPhysics(),
  //                                 // physics: ClampingScrollPhysics(),
  //                                 itemCount: state.list.length +
  //                                     (state.isReachedMax ? 0 : 1),
  //                                 itemBuilder: (context, index) {
  //                                   if (index >= state.list.length) {
  //                                     if (!state.isReachedMax) {
  //                                       print('HAVE TO CALL NEXT NEWPOSTS');
  //                                       page = page + 1;
  //                                       context.read<GetAllPostBloc>().add(
  //                                           GetAllNextNewPosts(page: page));
  //                                     }
  //                                     return Center(
  //                                       child: SizedBox(
  //                                         width: 24,
  //                                         height: 24,
  //                                         child: CircularProgressIndicator(),
  //                                       ),
  //                                     );
  //                                   } else {
  //                                     return Column(
  //                                       children: [
  //                                         sb_h12(),
  //                                         InkWell(
  //                                           onTap: () {
  //                                             Navigator.pushNamed(
  //                                               context,
  //                                               AppRoute.single_post_page_route,
  //                                               arguments: state.list[index].id,
  //                                             );
  //                                           },
  //                                           child: SinglePostWidget(
  //                                             // isFollowed: index % 2 == 0,
  //                                             // maxWidth: maxWidth,
  //                                             singlePostWidgetModel:
  //                                                 state.list[index],
  //                                           ),
  //                                         ),
  //                                         sb_h10(),
  //                                         index % 3 == 0
  //                                             ? SingleAdWidget()
  //                                             : SizedBox(),
  //                                       ],
  //                                     );
  //                                   }
  //                                 },
  //                               ),
  //                             )

  void unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Widget resultText() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        _listAuto.length,
        (i) {
          return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                _listAuto[i],
                style: ts33_12_600_08,
              ));
        },
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 76,
      // backgroundColor: const Color(0xFF222222),
      backgroundColor: black11,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      title: Stack(
        children: [
          filterWidget(),
          AnimatedContainer(
            width: isSearches
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width - 52 - 24 - 20,
            height: 52,
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(),
            // decoration: BoxDecoration(
            //     color: const Color(0xFF2DC36A),
            //     borderRadius: BorderRadius.circular(12)),
            child: searchBox(),
          ),
        ],
      ),
    );
  }

  AnimatedContainer filterWidget() {
    return AnimatedContainer(
      width: 52,
      height: 52,
      duration: const Duration(seconds: 1),
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width - 52 - 24 - 10),
      decoration: BoxDecoration(
          // color: const Color(0xFF2DC36A),
          color: color_green,
          borderRadius: BorderRadius.circular(12)),
      child: IconButton(
        // icon: const Icon(Icons.filter),
        icon: Image(
          image: AssetImage('assets/images/filter_icon.png'),
          fit: BoxFit.contain,
        ),
        onPressed: (() {
          showModalBottomSheet(
            context: context,
            // backgroundColor: Colors.white,
            backgroundColor: whitef4,
            isScrollControlled: true,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height - 40,
              // margin: const EdgeInsets.symmetric(horizontal: 0),
              child: SafeArea(
                  child: AvtoFilterBody(
                bannerRecall: true,
                starm: (AvtoRequestModel arm) {
                  setState(() {
                    _arm = arm;
                  });
                },
              )),
              // ),
            ),
          );
        }),
        // color: Colors.white,
        color: whitef4,
      ),
    );
  }

  Widget searchBox() {
    return Container(
      height: 52,
      alignment: Alignment.centerRight,
      child: TextField(
        onTap: () {
          setState(() {
            isSearches = true;
          });
        },
        textCapitalization: TextCapitalization.words,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          filled: true,
          // fillColor: Colors.white,
          fillColor: whitef4,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
          hintText: 'Поиск',
          // hintStyle: const TextStyle(color: Color(0xFFADADAD), fontSize: 16),
          hintStyle: ts87_16_500_0,
          suffixIcon: Container(
            width: isSearches ? 74 : 36,
            // color: Colors.yellow,
            // height: 36,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isSearches
                    ? Container(
                        width: 26,
                        height: 26,
                        alignment: Alignment.center,
                        // padding: const EdgeInsets.symmetric(
                        //     horizontal: 5, vertical: 5),
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          // color: const Color(0xFFE5E7EB),
                          color: whitef4,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          iconSize: 22,
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(
                            Icons.close,
                            // color: Color(0xFF878787),
                            color: grey87,
                            // size: 18,
                          ),
                          onPressed: (() {
                            setState(() {
                              isSearches = false;
                            });
                            unfocus();
                          }),
                        ),
                      )
                    : const SizedBox(),
                SizedBox(
                  width: isSearches ? 12 : 0,
                ),
                Container(
                  width: 36,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    // color: const Color(0xFF222222),
                    color: black11,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    CupertinoIcons.search,
                    // color: Colors.white,
                    color: whitef4,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
