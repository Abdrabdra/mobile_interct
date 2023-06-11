// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../data/constants/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/colors.dart';
import '../../../data/models/city_model.dart';
import '../../../data/models/region_model.dart';

import '../../../data/constants/BoxDecorations.dart';
import '../../../data/constants/textStyles.dart';
import '../blocs/get_regions_cities_bloc/get_regions_cities_bloc.dart';

int selectedRadioTile = 0;
ScrollController scrollController = ScrollController();

int _selectedRCId = 0;
String _selectedRCName = '';
List<CityModel> _listCities = [];

class AlertSetRegionCity extends StatefulWidget {
  const AlertSetRegionCity({
    Key? key,
    required this.isRegion,
    // required this.regionId,
    required this.cities,
    required this.setListCities,
    required this.setSelectedCityRegionId,
  }) : super(key: key);
  final bool isRegion;
  // final int regionId;
  final List<CityModel> cities;
  final Function setListCities;
  final Function setSelectedCityRegionId;

  @override
  State<AlertSetRegionCity> createState() => _AlertSetRegionCityState();
}

class _AlertSetRegionCityState extends State<AlertSetRegionCity> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadioTile = 0;
    widget.isRegion
        ? context.read<GetRegionsCitiesBloc>().add(GetRegions())
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRegionsCitiesBloc, GetRegionsCitiesState>(
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
          content: state is GetRegionsCitiesLoading
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    sb_h16(),
                    SizedBox(width: double.infinity,),
                    CircularProgressIndicator(),
                    sb_h16(),
                  ],
                )
              : state is GetRegionsCitiesSuccess
                  ? alertContent(
                      widget.isRegion
                          ? ([
                                RegionModel(
                                  idRegion: 0,
                                  nameRegion: 'Все регионы',
                                  cities: widget.cities,
                                ),
                              ] +
                              state.listRegions)
                          : [
                              RegionModel(
                                idRegion: 0,
                                nameRegion: 'nameRegion',
                                cities: ([
                                      CityModel(idCity: 0, name: 'Все города')
                                    ] +
                                    widget.cities),
                              ),
                            ],
                    )
                  : state is GetRegionsCitiesFailure
                      ? Center(
                          child: Text(
                            'ERROR',
                            style: tsgr_12_600_08,
                          ),
                        )
                      : const SizedBox(),
        );
      },
    );
  }

  Container alertContent(List<RegionModel> listData) {
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
                widget.isRegion ? listData.length : listData[0].cities.length,
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
                      widget.isRegion
                          ? listData[index].nameRegion
                          : listData[0].cities[index].name,
                      style: ts11_14_400_08,
                    ),
                    onChanged: (val) {
                      if (selectedRadioTile != index) {
                        // if (selectedRadioTile_Slug != listCities[index].slug) {
                        print('Current Location '
                            '${widget.isRegion ? listData[index].nameRegion : listData[0].cities[index]}');

                        // setSelectedRadioTile(listCities[index].slug);
                        setSelectedRadioTile(
                          index,
                          widget.isRegion
                              ? listData[index].idRegion
                              : listData[0].cities[index].idCity,
                          widget.isRegion
                              ? listData[index].nameRegion
                              : listData[0].cities[index].name,
                          widget.isRegion ? listData[index].cities : [],
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

  setSelectedRadioTile(int index, int id, String name, List<CityModel> list) {
    setState(() {
      selectedRadioTile = index;
      _selectedRCId = id;
      _selectedRCName = name;
      _listCities = list;
    });
  }

  Widget button(int index) {
    return InkWell(
      onTap: () {
        widget.setSelectedCityRegionId(
          _selectedRCId,
          _selectedRCName,
        );
        widget.isRegion ? widget.setListCities(_listCities) : null;
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
          color: green300,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          'Выбрать ${widget.isRegion ? 'регион' : 'город'}',
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
            'Выборите ваш ${widget.isRegion ? 'регион' : 'город'}',
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
