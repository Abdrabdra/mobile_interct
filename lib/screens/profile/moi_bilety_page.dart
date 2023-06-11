// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interct_2/data/constants/sized_boxes.dart';
import 'package:interct_2/data/constants/textStyles.dart';

import '../../data/api/config.dart';
import '../../data/constants/BoxDecorations.dart';
import '../../data/constants/colors.dart';
import 'blocs/get_tickets_bloc/get_tickets_bloc.dart';

class MoiBiletyPage extends StatefulWidget {
  const MoiBiletyPage({super.key});

  @override
  State<MoiBiletyPage> createState() => _MoiBiletyPageState();
}

class _MoiBiletyPageState extends State<MoiBiletyPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetTicketsBloc>().add(GetTicketsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTicketsBloc, GetTicketsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBar(context),
          extendBody: true,
          backgroundColor: whitef4,
          body: state is GetTicketsLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: color_green,
                  ),
                )
              : state is GetTicketsSuccess
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 18),
                        child: state.listTickets.length == 0
                            ? Center(
                                heightFactor: 7,
                                child: Text(
                                  'Пустой',
                                  style: ts11_16_500_1,
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  state.listTickets.length,
                                  (index) => ticket_body(context, state, index),
                                ),
                              ),
                      ),
                    )
                  : state is GetTicketsFailure
                      ? Center(
                          child: Text(
                            'ERROR',
                            style: tsred_12_500,
                          ),
                        )
                      : Center(
                          child: Text(
                            'INITIAL STATE',
                            style: tsred_12_500,
                          ),
                        ),

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

  Container ticket_body(
      BuildContext context, GetTicketsSuccess state, int index) {
    return Container(
      width: maxWidth(context) - 24,
      margin: EdgeInsets.only(bottom: 14),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: whitef4,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: black11.withOpacity(0.3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          photoOfAdv(state.listTickets[index].image),
          sb_w10(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.listTickets[index].dt,
                style: ts11_16_600_06,
              ),
              sb_h4(),
              Text(
                '${state.listTickets[index].cost}KZT',
                style: tsgr_14_400_08,
              ),
              sb_h4(),
              Text(
                state.listTickets[index].status,
                style: ts11_14_500_08,
              ),
              SizedBox(
                width: maxWidth(context) - 178,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                        decoration: BoxDecoration(
                          color: black11,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Номер машины:  ${state.listTickets[index].nomer}',
                          style: tsc1_12_600_0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                        decoration: BoxDecoration(
                          color: black11,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Номер билета: ${state.listTickets[index].nomerBileta}',
                          style: tsc1_12_600_0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                        decoration: BoxDecoration(
                          color: black11,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Ряд: ${state.listTickets[index].row},'
                          ' Колонна: ${state.listTickets[index].column}',
                          style: tsc1_12_600_0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget photoOfAdv(String url) {
    return Stack(
      children: [
        // Container(
        //   width: 120,
        //   height: 110,
        //   decoration: BoxDecoration(
        //     image: const DecorationImage(
        //       fit: BoxFit.cover,
        //       image: AssetImage('assets/flags/kz.png'),
        //     ),
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        // ),
        CachedNetworkImage(
          // imageUrl: "http://mvs.bslmeiyu.com/storage/profile/"
          //     "2022-05-02-626fc39bf18a6.png",
          imageUrl: baseUrlToImage + url,
          imageBuilder: (context, imageProvider) {
            return Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: whitef4,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          placeholder: (context, url) => Container(
            width: 120,
            height: 120,
            // margin: EdgeInsets.only(bottom: 14),
            alignment: Alignment.center,
            decoration: bd_f4_12,
            child: const CircularProgressIndicator(
              color: black33,
            ),
          ),
          errorWidget: (context, url, error) {
            print(baseUrlToImage + url);
            print(error);
            return Container(
              width: 120,
              height: 120,
              // margin: EdgeInsets.only(bottom: 14),
              alignment: Alignment.center,
              decoration: bd_f4_12,
              child: Icon(
                Icons.cloud_off,
                color: Colors.red,
              ),
              // Text(
              //   // 'ERROR',
              //   '$error',
              //   style: ts33_16_500_0,
              // ),
            );
          },
        ),
      ],
    );
  }

  double maxWidth(BuildContext context) => MediaQuery.of(context).size.width;

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
        'Мои билеты',
        style: tsf4_16_600_0,
      ),
      centerTitle: false,
    );
  }
}
