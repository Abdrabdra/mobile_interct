import 'package:interct_2/data/models/model_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/sized_boxes.dart';
import '../../data/constants/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';
import '../home_page/blocs/get_marka_models_bloc/get_marka_models_bloc.dart';

List<ModelModel> listMarki2 = [];

class VyborModel extends StatefulWidget {
  const VyborModel({
    Key? key,
    // required this.optionsListt,
    required this.stt,
    required this.paa,
  }) : super(key: key);
  final PodachaAvtoAdver paa;

  // final List optionsListt;
  final Function stt;

  @override
  State<VyborModel> createState() => _VyborModelState();
}

class _VyborModelState extends State<VyborModel> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetMarkasModelsBloc>().add(GetModels(widget.paa.marka ?? 8));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMarkasModelsBloc, GetMarkasModelsState>(
      builder: (context, state) {
        return Container(
          // margin: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // poisk(),
              // SizedBox(height: 8),
              state is GetMarkasModelsLoading
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
                  : state is GetMarkasModelsSuccess
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            // listMarki2.length,
                            state.listModels.length,
                            (index) => GestureDetector(
                              onTap: () {
                                // widget.paa.copyWith(model: listMarki2[index].id);
                                widget.paa.copyWith(
                                    model: state.listModels[index].id);
                              },
                              child: opW(
                                // optionName: listMarki2[index].name as String,
                                optionName:
                                    state.listModels[index].name as String,
                                stt: () {},
                              ),
                            ),
                          ),
                        )
                      : state is GetMarkasModelsFailure
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

  // Container poisk() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(vertical: 7),
  //     child: TextField(
  //       textCapitalization: TextCapitalization.words,
  //       textAlignVertical: TextAlignVertical.bottom,
  //       decoration: InputDecoration(
  //         focusedBorder:
  //             OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
  //         filled: true,
  //         fillColor: podacha_contact_textfield_color,
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //           borderSide: BorderSide.none,
  //         ),
  //         contentPadding: const EdgeInsets.symmetric(
  //           vertical: 13,
  //           horizontal: 15,
  //         ),
  //         hintText: 'Поиск',
  //         hintStyle: const TextStyle(
  //           color: podacha_hinttext_color,
  //           fontSize: 16,
  //         ),
  //         prefixIcon: Container(
  //           width: 20,
  //           height: 20,
  //           alignment: Alignment.center,
  //           margin: const EdgeInsets.all(8),
  //           child: const Icon(
  //             CupertinoIcons.search,
  //             color: podacha_hinttext_color,
  //             size: 18,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
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
