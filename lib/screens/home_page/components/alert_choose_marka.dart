// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../data/constants/sized_boxes.dart';
import '../../../data/models/marka_model.dart';
import '../../../screens/home_page/blocs/get_marka_models_bloc/get_marka_models_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/colors.dart';

import '../../../data/constants/BoxDecorations.dart';
import '../../../data/constants/textStyles.dart';
import '../../../../data/models/model_model.dart';

int selectedRadioTile = 0;
ScrollController scrollController = ScrollController();

int _selectedMarkaModelId = 0;
String _selectedMarkaModelName = '';

class AlertSetMarkaModel extends StatefulWidget {
  const AlertSetMarkaModel({
    Key? key,
    required this.isMarka,
    required this.markaId,
    // required this.models,
    // required this.setListModels,
    required this.setSelectedMarkaModelId,
  }) : super(key: key);
  final bool isMarka;
  final int markaId;
  // final List<CityModel> models;
  // final Function setListModels;
  final Function setSelectedMarkaModelId;

  @override
  State<AlertSetMarkaModel> createState() => _AlertSetMarkaModelState();
}

class _AlertSetMarkaModelState extends State<AlertSetMarkaModel> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadioTile = 0;
    widget.isMarka
        ? context.read<GetMarkasModelsBloc>().add(GetMarkas())
        : context.read<GetMarkasModelsBloc>().add(GetModels(widget.markaId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMarkasModelsBloc, GetMarkasModelsState>(
      builder: (context, state) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide.none,
          ),
          backgroundColor: whitef4,
          insetPadding: const EdgeInsets.all(10),
          titlePadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          title: topBody(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          content: state is GetMarkasModelsLoading
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
                  ? alertContent(
                      widget.isMarka
                          ? ([
                                MarkaModel(
                                  id: 0,
                                  name: 'Все марки',
                                ),
                              ] +
                              state.listMarkas)
                          : [
                                ModelModel(
                                  id: 0,
                                  name: ' Все модели',
                                ),
                              ] +
                              state.listModels,
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
        );
      },
    );
  }

  Container alertContent(List listData) {
    return Container(
      width: MediaQuery.of(context).size.width - 24,
      height: MediaQuery.of(context).size.height / 2 - 24,
      // padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: whitef4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // topBody(context),
          // SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2 - 95,
            child: ListView(
              padding: EdgeInsets.zero,
              controller: scrollController,
              scrollDirection: Axis.vertical,
              children: List.generate(
                // listData.length,
                // widget.isMarka ? listData.length : listData[0].cities.length,
                listData.length,
                (index) => Container(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width - 15,
                  margin: EdgeInsets.only(top: 8),
                  height: 48,
                  // padding: EdgeInsets.all(16),
                  decoration: bd_wh_16,
                  child: RadioListTile(
                    value: index,
                    groupValue: selectedRadioTile,
                    toggleable: true,
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(
                      // namesSura[index] as String,
                      listData[index].name,
                      style: ts11_14_400_08,
                    ),
                    onChanged: (val) {
                      if (selectedRadioTile != index) {
                        // if (selectedRadioTile_Slug != listCities[index].slug) {
                        print('Current MarkaModel '
                            '${listData[index].name}');

                        // setSelectedRadioTile(listCities[index].slug);
                        setSelectedRadioTile(
                          index,
                          listData[index].id,
                          listData[index].name,
                        );
                      }
                    },
                    selected: selectedRadioTile == index,
                    // selected: selectedRadioTile_Slug
                    //     .endsWith(listCities[index].slug),
                    // activeColor: Colors.black,
                    activeColor: green300,
                    // selectedTileColor: Color(0xff2DC36A),
                  ),
                ),
              ),
            ),
          ),
          button(selectedRadioTile),
        ],
      ),
    );
  }

  setSelectedRadioTile(int index, int id, String name) {
    setState(() {
      selectedRadioTile = index;
      _selectedMarkaModelId = id;
      _selectedMarkaModelName = name;
    });
  }

  Widget button(int index) {
    return InkWell(
      onTap: () {
        widget.setSelectedMarkaModelId(
          _selectedMarkaModelId,
          _selectedMarkaModelName,
        );
        Navigator.of(context).pop();

        // if (userCityBox.isNotEmpty) {
        //   print(userCityBox.getAt(0).toString());
        //   userCityBox.putAt(0, cityModel);
        // } else {
        //   userCityBox.add(cityModel);
        // }
        // if (widget.stMainPage != null) {
        //   widget.stMainPage!();
        //   Navigator.of(context).pop();
        // } else {
        //   Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const HomePage(),
        //     ),
        //     (Route<dynamic> route) => false,
        //   );
        // }
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color_green,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          'Выбрать ${widget.isMarka ? 'регион' : 'город'}',
          style: tswh_16_600_0,
        ),
      ),
    );
  }

  Widget topBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width - 80,
          child: Text(
            'Выборите ваш ${widget.isMarka ? 'регион' : 'город'}',
            style: ts11_20_600_08,
            maxLines: 2,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: CircleAvatar(
            radius: 12,
            backgroundColor: greyc1,
            child: Icon(
              Icons.close,
              color: white,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
