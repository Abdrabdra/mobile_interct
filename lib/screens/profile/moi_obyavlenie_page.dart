// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:interct_2/data/constants/textStyles.dart';

import '../../data/constants/colors.dart';
import '../../data/models/avto_request_model.dart';
import '../home_page/components/advertisement_tile.dart';
import 'blocs/get_my_adv_bloc/get_my_adv_bloc.dart';

class MoiObyavleniePage extends StatefulWidget {
  const MoiObyavleniePage({
    Key? key,
    this.busId,
  }) : super(key: key);
  final int? busId;

  @override
  State<MoiObyavleniePage> createState() => _MoiObyavleniePageState();
}

class _MoiObyavleniePageState extends State<MoiObyavleniePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<GetMyAdvBloc>().add(
          GetMyAvtoAdvertisementsEvent(
            AvtoRequestModel(
              withPhoto: false,
              isRastomojen: false,
              page: -1,
              busId: widget.busId ?? -1,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyAdvBloc, GetAdvertisementsState>(
      builder: (context, state) {
        return Scaffold(
            appBar: appBar(context),
            extendBody: true,
            backgroundColor: whitef4,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: state is GetMyAdvertisementsLoading
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SizedBox(height: 100),
                          CircularProgressIndicator(
                            color: black11,
                          ),
                        ],
                      )
                    : state is GetMyAdvertisementsSuccess
                        ? state.list.isEmpty
                            ? Center(
                                heightFactor: 7,
                                child: Text(
                                  'Пустой',
                                  style: ts11_16_500_1,
                                ),
                              )
                            : list_advers(state)
                        : state is GetMyAdvertisementsFailure
                            ? Container(
                                height: 150,
                                alignment: Alignment.center,
                                child: Text(
                                  'ERROR :(',
                                  style: tsgr_12_600_08,
                                ),
                              )
                            : Center(
                                child: Text(
                                  'INITIAL STATE',
                                  style: tsred_12_500,
                                ),
                              ),
              ),
            )
            //  Center(
            //   heightFactor: 7,
            //   child: Text(
            //     'Пустой',
            //     style: ts11_16_500_1,
            //   ),
            // ),
            );
      },
    );
  }

  Container list_advers(GetMyAdvertisementsSuccess state) {
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

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: black11,
      leading: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          margin: EdgeInsets.only(left: 16),
          child: Icon(
            Icons.arrow_back,
            color: whitef4,
          ),
        ),
      ),
      title: Text(
        'Мои обьявления',
        style: tsf4_16_600_0,
      ),
      centerTitle: false,
    );
  }
}
