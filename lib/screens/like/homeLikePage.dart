import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../home_page/components/advertisement_tile.dart';
import 'get_favorite_advers_bloc/get_favorite_advers_bloc.dart';

class HomeLikePage extends StatefulWidget {
  const HomeLikePage({super.key});

  @override
  State<HomeLikePage> createState() => _HomeLikePageState();
}

class _HomeLikePageState extends State<HomeLikePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetFavoriteAdversBloc>().add(GetFavoriteAdversEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoriteAdversBloc, GetFavoriteAdversState>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBar(),
          extendBody: true,
          // backgroundColor: const Color(0xffF1F2F2),
          backgroundColor: whitef4,
          body: RefreshIndicator(
            onRefresh: () async {
              context
                  .read<GetFavoriteAdversBloc>()
                  .add(GetFavoriteAdversEvent());
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    state is GetAdvertisementsLoading
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(
                                height: 200,
                                width: double.infinity,
                              ),
                              CircularProgressIndicator(
                                color: black11,
                              ),
                            ],
                          )
                        : state is GetAdvertisementsSuccess
                            // ? BodyLikePage()
                            ? Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: state.list.length == 0
                                    ? Center(
                                        heightFactor: 20,
                                        child: Text(
                                          'Список пустой',
                                          style: ts55_16_500_0,
                                        ),
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                          state.list.length,
                                          (index) => AdvertisementTile(
                                            isCar: true,
                                            aat: state.list[index],
                                          ),
                                        ),
                                      ),
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
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            maxWidth: MediaQuery.of(context).size.width,
            selectedIndex: 1,
          ),
        );
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 62,
      automaticallyImplyLeading: false,
      // primary: false,
      excludeHeaderSemantics: false,
      // backgroundColor: const Color(0xFF333333),
      backgroundColor: black11,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      centerTitle: true,
      title: Text(
        'Avto-Like'.toUpperCase(),
        // style: const TextStyle(
        //   fontSize: 24,
        //   fontWeight: FontWeight.w500,
        //   letterSpacing: 3.28,
        //   // color: Colors.white,
        //   color: whitef4,
        // ),
        style: tsf4_24_500_328,
      ),
    );
  }
}
