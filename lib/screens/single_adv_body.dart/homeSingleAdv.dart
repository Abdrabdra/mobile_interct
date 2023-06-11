import 'package:interct_2/screens/chat_page/chat_page.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../../screens/single_adv_body.dart/aapBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'body.dart';
import 'get_single_adv_bloc/get_single_adv_bloc.dart';

// ignore: must_be_immutable
class SingleAdvPage extends StatefulWidget {
  SingleAdvPage({
    super.key,
    // required this.isAuthors,
    this.isAuthors,
    required this.id,
  }) {
    isAuthors = isAuthors ?? false;
  }
  bool? isAuthors;
  final int id;

  @override
  State<SingleAdvPage> createState() => _SingStateleAdvPage();
}

class _SingStateleAdvPage extends State<SingleAdvPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetSingleAdvBloc>().add(GetInfo(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSingleAdvBloc, GetSingleAdvState>(
      builder: (context, state) {
        return Scaffold(
          appBar: SingleAdvAppBar(context),
          extendBody: true,
          backgroundColor: whitef4,
          body: state is GetSingleAdvLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is GetSingleAdvSuccess
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 12),
                      child: SingleAdvBody(
                        isAuthors: widget.isAuthors,
                        saam: state.saam,
                      ),
                    )
                  : state is GetSingleAdvFailure
                      ? Center(
                          child: Text(
                            'ERROR',
                            style: tsgr_12_600_08,
                          ),
                        )
                      : const SizedBox(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          floatingActionButton: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 50,
            alignment: Alignment.center,
            child: widget.isAuthors!
                ? redactButton(context)
                : contactToAuthorButton(state),
          ),
        );
      },
    );
  }

  Widget contactToAuthorButton(GetSingleAdvState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            print('${widget.isAuthors}');
            state is GetSingleAdvSuccess
                ? Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                    return ChatPage(saam: state.saam);
                  }))
                : null;
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2 - 20,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: black33,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Написать',
              // style: TextStyle(
              //   fontSize: 18,
              //   fontWeight: FontWeight.w600,
              //   color: whitef4,
              //   fontFamily: 'Gilroy',
              // ),
              style: tsf4_18_600_0,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            state is GetSingleAdvSuccess
                ? launchUrl(Uri(
                    scheme: 'tel',
                    path: state.saam.authorPhone,
                  ))
                : null;
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2 - 20,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: color_green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Позвонить',
              // style: TextStyle(
              //   fontSize: 18,
              //   fontWeight: FontWeight.w600,
              //   color: whitef4,
              //   fontFamily: 'Gilroy',
              // ),
              style: tsf4_18_600_0,
            ),
          ),
        ),
      ],
    );
  }

  Container redactButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 24,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: black33,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Редактирование',
        // style: TextStyle(
        //   fontSize: 18,
        //   fontWeight: FontWeight.w600,
        //   color: whitef4,
        //   fontFamily: 'Gilroy',
        // ),
        style: tsf4_18_600_0,
      ),
    );
  }
}
