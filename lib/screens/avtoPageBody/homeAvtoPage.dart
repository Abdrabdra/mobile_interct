import '../../data/constants/colors.dart';
import '../../data/models/avto_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/textStyles.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../home_page/blocs/get_advertisements_bloc/get_advertisements_bloc.dart';
// import '../home_page/components/advertisement_list.dart';
import '../home_page/components/advertisement_tile.dart';
import '../home_page/components/filterBody.dart';
import '../home_page/foundedAdvers.dart';
import '../home_page/search_box.dart';

AvtoRequestModel _arm =
    AvtoRequestModel(withPhoto: false, isRastomojen: false, page: page);

int page = 1;

class HomeAvtoPage extends StatefulWidget {
  const HomeAvtoPage({super.key});

  @override
  State<HomeAvtoPage> createState() => _HomeAvtoPageState();
}

class _HomeAvtoPageState extends State<HomeAvtoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetAdvertisementsBloc>().add(GetAvtoAdvertisementsEvent(
        AvtoRequestModel(withPhoto: false, isRastomojen: false, page: page)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAdvertisementsBloc, GetAdvertisementsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBar(),
          extendBody: true,
          // backgroundColor: Color(0xffF4F4F4),
          backgroundColor: whitef4,
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<GetAdvertisementsBloc>().add(
                  GetAvtoAdvertisementsEvent(AvtoRequestModel(
                      withPhoto: false, isRastomojen: false, page: 1)));
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                child: Column(
                  children: [
                    // length_text(state, context),
                    Expanded(
                      child: state is GetAdvertisementsLoading
                          ? loading()
                          : state is GetAdvertisementsSuccess
                              ? ListView.builder(
                                  keyboardDismissBehavior:
                                      ScrollViewKeyboardDismissBehavior.onDrag,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: state.list.length +
                                      (state.isReachedMax ? 0 : 1),
                                  itemBuilder: (context, index) {
                                    if (index >= state.list.length) {
                                      // if (!state.isReachedMax) {
                                      print('HAVE TO CALL NEXT NEWPOSTS');
                                      page = page + 1;
                                      context.read<GetAdvertisementsBloc>().add(
                                            GetNextAvtoAdvertisementsEvent(
                                              _arm.copyWith(page: page),
                                            ),
                                          );
                                      // }
                                      // return state.isReachedMax
                                      //     ? const Center(
                                      //         child: SizedBox(
                                      //           width: 24,
                                      //           height: 24,
                                      //           child:
                                      //               CircularProgressIndicator(),
                                      //         ),
                                      //       )
                                      //     :

                                      return SizedBox(
                                        height: 100,
                                      );
                                    } else {
                                      return AdvertisementTile(
                                        isCar: true,
                                        aat: state.list[index],
                                      );
                                      // return Column(
                                      //   // mainAxisSize: MainAxisSize.min,
                                      //   // mainAxisAlignment: MainAxisAlignment.start,
                                      //   children: [
                                      //     // const AdvertisementBody(isCar: true),
                                      //     Container(
                                      //       margin: const EdgeInsets.symmetric(
                                      //           vertical: 4),
                                      //       child: Column(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.start,
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //         children: List.generate(
                                      //           // 10,
                                      //           state.list.length,
                                      //           (index) => AdvertisementTile(
                                      //             isCar: true,
                                      //             aat: state.list[index],
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     SizedBox(height: 70),
                                      //   ],
                                      // );
                                    }
                                  },
                                )
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
                    ),
                  ],
                )
                // SingleChildScrollView(
                //   keyboardDismissBehavior:
                //       ScrollViewKeyboardDismissBehavior.onDrag,
                //   child: state is GetAdvertisementsLoading
                //       ? const Center(
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               SizedBox(height: 100),
                //               CircularProgressIndicator(
                //                 color: black11,
                //               ),
                //             ],
                //           ),
                //         )
                //       : state is GetAdvertisementsSuccess
                //           ? Column(
                //               // mainAxisSize: MainAxisSize.min,
                //               // mainAxisAlignment: MainAxisAlignment.start,
                //               children: [
                //                 FoundedAdvText(
                //                   isCar: true,
                //                   length: state.list.length,
                //                 ),
                //                 // const AdvertisementBody(isCar: true),
                //                 Container(
                //                   margin: const EdgeInsets.symmetric(vertical: 4),
                //                   child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: List.generate(
                //                       // 10,
                //                       state.list.length,
                //                       (index) => AdvertisementTile(
                //                         isCar: true,
                //                         aat: state.list[index],
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(height: 70),
                //               ],
                //             )
                //           : state is GetAdvertisementsFailure
                //               ? Container(
                //                   height: 150,
                //                   alignment: Alignment.center,
                //                   child: Text(
                //                     'ERROR',
                //                     style: tsgr_12_600_08,
                //                   ),
                //                 )
                //               : SizedBox(),
                // ),
                ),
          ),
          bottomNavigationBar: BottomNavBar(
              maxWidth: MediaQuery.of(context).size.width, selectedIndex: 0),
        );
      },
    );
  }

  Container length_text(GetAdvertisementsState state, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        // top: 24,
        top: 12,
        bottom: 0,
      ),
      height: 38,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            // '${state.list.length} obyavlenia',
            'state.list.length obyavlenia',
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
                builder: (context) => SizedBox(
                  height: MediaQuery.of(context).size.height - 50,
                  // margin: const EdgeInsets.symmetric(horizontal: 0),
                  child: AvtoFilterBody(
                    bannerRecall: false,
                    starm: (AvtoRequestModel arm) {
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                // color: const Color(0xFF2DC36A),
                color: color_green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      image: AssetImage('assets/images/filter_icon.png'),
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center loading() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 100),
          CircularProgressIndicator(
            color: black11,
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      // backgroundColor: const Color(0xFF222222),
      backgroundColor: black11,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      title: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: SearchBox()),
            // const SizedBox(width: 8),
            // Container(
            //   width: 52,
            //   height: 52,
            //   decoration: BoxDecoration(
            //       color: const Color(0xFF2DC36A),
            //       borderRadius: BorderRadius.circular(12)),
            //   child: const Icon(
            //     Icons.filter,
            //     color: Colors.white,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// SizedBox(
// height: MediaQuery.of(context).size.height,
// child: ListView.builder(
//   physics: BouncingScrollPhysics(),
//   // physics: ClampingScrollPhysics(),
//   itemCount: state.list.length +
//       (state.isReachedMax ? 0 : 1),
//   itemBuilder: (context, index) {
//     if (index >= state.list.length) {
//       if (!state.isReachedMax) {
//         print('HAVE TO CALL NEXT NEWPOSTS');
//         page = page + 1;
//         context.read<GetAllPostBloc>().add(
//             GetAllNextNewPosts(page: page));
//       }
//       return Center(
//         child: SizedBox(
//           width: 24,
//           height: 24,
//           child: CircularProgressIndicator(),
//         ),
//       );
//     } else {
//       return Column(
//         children: [
//           sb_h12(),
//           InkWell(
//             onTap: () {
//               Navigator.pushNamed(
//                 context,
//                 AppRoute.single_post_page_route,
//                 arguments: state.list[index].id,
//               );
//             },
//             child: SinglePostWidget(
//               // isFollowed: index % 2 == 0,
//               // maxWidth: maxWidth,
//               singlePostWidgetModel:
//                   state.list[index],
//             ),
//           ),
//           sb_h10(),
//           index % 3 == 0
//               ? SingleAdWidget()
//               : SizedBox(),
//         ],
//       );
//     }
//   },
// ),
// )