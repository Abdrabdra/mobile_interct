import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/sized_boxes.dart';
import '../../data/constants/textStyles.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/constants/colors.dart';
import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';
import 'blocs/get_generations_bloc/get_generations_bloc.dart';

List<int> _listyear = List.generate(42, (index) => (2022 - (index)));

class VyborGoda extends StatefulWidget {
  const VyborGoda({
    Key? key,
    // required this.optionsListt,
    required this.stt, required this.paa,
  }) : super(key: key);
  final PodachaAvtoAdver paa;

  // final List optionsListt;
  final Function stt;

  @override
  State<VyborGoda> createState() => _VyborGodaState();
}

class _VyborGodaState extends State<VyborGoda> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetGenerationsBloc>().add(GetGenerationsEvent(widget.paa.model??1));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGenerationsBloc, GetGenerationsState>(
      builder: (context, state) {
        if(state is GetGenerationsSuccess){
      // List<int> _listyear = List.generate(state.generations[0].createdTo-state.generations[0].createdFrom, (index) => (state.generations[0].createdTo - (index)));

        }
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
    state is GetGenerationsLoading
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        sb_h16(),
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                        sb_h16(),
                      ],
                    )
                  : state is GetGenerationsSuccess
                      ?     Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  _listyear.length,
                  (index) => GestureDetector(
                    onTap: () {
                      widget.stt(year: _listyear);
                    },
                    child: opW(
                      optionName: _listyear[index].toString(),
                      stt: (){},
                    ),
                  ),
                ),
              ): state is GetGenerationsFailure
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            sb_h16(),
                            Center(
                              child: Text(
                                'ERROR',
                                style: tsgr_12_600_08,
                              ),
                            ),
                            sb_h16(),
                          ],
                        )
                      : const SizedBox(),
            ],
          ),
        );
      },
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
