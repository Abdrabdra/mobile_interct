// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interct_2/data/api/api_provider.dart';
import 'package:interct_2/data/constants/sized_boxes.dart';
// import 'package:interct_2/data/models/city_model.dart';
import 'package:interct_2/data/models/city_model_inter.dart';
import 'package:interct_2/data/models/place_type_model.dart';
import 'package:interct_2/data/models/single_avto_adv_model.dart';
import 'package:interct_2/screens/home_page/home_page.dart';
import 'package:interct_2/screens/podachaObyavlenie/appBar.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../single_adv_body.dart/detail_comment_body.dart';
import '../single_adv_body.dart/photoCarousel.dart';
import 'blocs/get_cities_bloc/get_cities_bloc.dart';
import 'blocs/get_districts_bloc/get_districts_bloc.dart';
import 'blocs/get_places_type_bloc/get_place_types_bloc.dart';

bool _canGo = false;
int _page = 0;
bool _isbusMade = false;
TextEditingController _nomerController = TextEditingController();
DateTime _selectedDtArrival = DateTime(1999);
TimeOfDay? _selectedTimeArrival;
DateTime _selectedDtFrom = DateTime(1999);
TimeOfDay? _selectedTimeFrom;
final ImagePicker imagePicker = ImagePicker();
bool hasPhoto = false;
late CityModelInter _cityFrom;
late CityModelInter _cityTo;
late CityModelInter _districtFrom;
late CityModelInter _districtTo;
late PlaceTypeModel _placeType;
late SingleAvtoAdvModel saam;

List<XFile>? images = [];
// Map<int, String> radioButtonsAvto = {
//   0: 'Автомобиль',
//   1: 'Мотоциклы',
//   2: 'Водный транспорт',
// };
Container dv = Container(
  height: 1,
  // color: Color(0xffB9B9B9),
  width: double.infinity,
  color: greyc1,
);
Container dv2 = Container(
  margin: EdgeInsets.only(left: 17),
  height: 1,
  width: 170,
  // color: Color(0xffDEDEDE),
  color: greyf0,
);
bool isExp1 = false;
bool isExp2 = false;

class PodachaInterCTPage extends StatefulWidget {
  const PodachaInterCTPage({super.key});

  @override
  State<PodachaInterCTPage> createState() => _PodachaInterCTPageState();
}

class _PodachaInterCTPageState extends State<PodachaInterCTPage> {
  int selectedRadioTilePlace = -1;
  int selectedRadioTileCityFrom = -1;
  int selectedRadioTileDistrictFrom = -1;
  int selectedRadioTileCityTo = -1;
  int selectedRadioTileDistrictTo = -1;
  // int selectedRadioTileZapchast = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadioTilePlace = -1;
    selectedRadioTileCityFrom = -1;
    selectedRadioTileDistrictFrom = -1;
    selectedRadioTileCityTo = -1;
    selectedRadioTileDistrictTo = -1;
    _canGo = false;
    _isbusMade = false;
    _page = 0;
    context.read<GetPlaceTypesBloc>().add(GetPlaceTypesEvent());
    context.read<GetCitiesBloc>().add(GetCities());
    context.read<GetDistrictsBloc>().add(GetDistrictsInitialEv());
    // selectedRadioTileZapchast = -1;
  }

  setSelectedRadioTileAvto(int val) {
    setState(() {
      selectedRadioTilePlace = val;
      // selectedRadioTileZapchast = -1;
    });
  }

  setSelectedRadioTileCityFrom(int val) {
    setState(() {
      selectedRadioTileCityFrom = val;
      // selectedRadioTileZapchast = -1;
    });
  }

  setSelectedRadioTileCityTo(int val) {
    setState(() {
      selectedRadioTileCityTo = val;
      // selectedRadioTileZapchast = -1;
    });
  }

  setSelectedRadioTileDistrictFrom(int val) {
    setState(() {
      selectedRadioTileDistrictFrom = val;
      // selectedRadioTileZapchast = -1;
    });
  }

  setSelectedRadioTileDistrictTo(int val) {
    setState(() {
      selectedRadioTileDistrictTo = val;
      // selectedRadioTileZapchast = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double chastWidth = (MediaQuery.of(context).size.width - 24 - 30) / 6;
    return Scaffold(
      appBar: appBar(
        context,
        'Подача объявления',
      ),
      extendBody: true,
      // backgroundColor: const Color(0xFFFAFAFA),
      backgroundColor: whitef4,
      body: Stack(
        children: [
          indexChecker(chastWidth),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                child: _page == 0
                    ? nomer_type_image(context)
                    : _page == 1
                        ? from_date_time(context)
                        : _page == 2
                            ? city_from_body()
                            : _page == 3
                                ? city_to_body()
                                : _page == 4
                                    ? predprosmotr_body(context)
                                    : Center(
                                        heightFactor: 5,
                                        child: Text(
                                          'Объявление на проверке',
                                          style: ts11_16_600_06,
                                        ),
                                      ),
              ),
            ),
          ),
          button(context),
        ],
      ),
    );
  }

  Column predprosmotr_body(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          height: 160,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color_green,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: FileImage(File(images![0].path)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        sb_h10(),
        // !widget.isAuthors! ? AfterPhotoBody(widget.saam) : SizedBox(),
        // namePrice(widget.saam),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: maxWidth(context) - 28 - 10 - 140 - 24,
                    child: Text(
                      '${saam.cityFrom} - ${saam.cityTo}',
                      style: ts11_14_600_0,
                    ),
                  ),
                  sb_h6(),
                  SizedBox(
                    width: maxWidth(context) - 28 - 10 - 140 - 24,
                    child: Text(
                      '${saam.price} KZT',
                      style: tsgr_14_700_08,
                    ),
                  ),
                ],
              ),
              sb_w10(),
              // InkWell(
              //   onTap: () {
              //     print('Tapped Zabron');
              //   },
              //   child: Container(
              //     width: 140,
              //     padding:
              //         EdgeInsets.symmetric(
              //             vertical: 16,
              //             horizontal: 6),
              //     decoration: BoxDecoration(
              //       color: green300,
              //       borderRadius:
              //           BorderRadius.circular(
              //               12),
              //     ),
              //     child: Text(
              //       'Забронировать',
              //       style: tswh_16_600_0,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Detail_Comment_Body(
          saam: saam,
        ),
        // CategoriesBody(),
        // TextObyavleniya(),
      ],
    );
  }

  Widget city_to_body() {
    List<CityModelInter> cities = [];
    return BlocBuilder<GetCitiesBloc, GetCitiesState>(
      builder: (context, state) {
        if (state is GetCitiesSuccess) {
          cities = state.list;
        }
        return state is GetCitiesLoading
            ? Center(
                heightFactor: 5,
                child: CircularProgressIndicator(
                  color: green300,
                ),
              )
            : state is GetCitiesSuccess
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionPanelList(
                        animationDuration: const Duration(milliseconds: 200),
                        expandedHeaderPadding:
                            const EdgeInsets.only(bottom: 0.0),
                        elevation: 0,
                        children: [
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 20),
                                child: Text(
                                  'Город прибытия',
                                  // style: TextStyle(
                                  //   // color: itemData[index].colorsItem,
                                  //   // color: Colors.black,
                                  //   color: black11,
                                  //   fontSize: 18,
                                  // ),
                                  style: ts11_18_500_0,
                                ),
                              );
                            },
                            body: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 15, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  dv,
                                  Container(
                                    padding:
                                        const EdgeInsets.only(left: 17, top: 0),
                                    child: Column(
                                      children: List.generate(
                                        cities.length,
                                        (index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RadioListTile(
                                              value: index,
                                              groupValue:
                                                  selectedRadioTileCityTo,
                                              toggleable: true,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${cities[index].name}',
                                                    style: ts11_14_400_08,
                                                  ),
                                                  // Text(radioButtonsAvto[index]),
                                                ],
                                              ),
                                              onChanged: (val) {
                                                // if (selectedRadioTileAvto !=
                                                //     index) {
                                                print(
                                                    "Current User ${cities[index]} ");
                                                setSelectedRadioTileCityTo(
                                                    val!);
                                                setState(() {
                                                  _cityTo = cities[index];
                                                });
                                                checkGo();
                                                context
                                                    .read<GetDistrictsBloc>()
                                                    .add(GetDistricts(
                                                        cities[index].id));
                                                // }
                                              },
                                              selected:
                                                  selectedRadioTileCityTo ==
                                                      index,
                                              // activeColor: Colors.black,
                                              activeColor: color_green,
                                              // selectedTileColor: Color(0xff2DC36A),
                                            ),
                                            cities.length - 1 != index
                                                ? dv2
                                                : SizedBox()
                                          ],
                                        ),
                                      ).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: isExp1,
                          ),
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            isExp1 = !isExp1;
                          });
                        },
                      ),
                      sb_h16(),
                      districts_to_body(),
                    ],
                  )
                : state is GetCitiesFailure
                    ? Center(
                        heightFactor: 5,
                        child: Text(
                          'ERROR',
                          style: tsred_12_500,
                        ),
                      )
                    : SizedBox();
      },
    );
  }

  Widget districts_to_body() {
    List<CityModelInter> districts = [];
    return BlocBuilder<GetDistrictsBloc, GetDistrictsState>(
      builder: (context, state) {
        if (state is GetDistrictsSuccess) {
          districts = state.districts;
        }
        return state is GetDistrictsLoading
            ? Center(
                heightFactor: 5,
                child: CircularProgressIndicator(
                  color: green300,
                ),
              )
            : state is GetDistrictsSuccess
                ? SizedBox(
                    child: ExpansionPanelList(
                      animationDuration: const Duration(milliseconds: 200),
                      expandedHeaderPadding: const EdgeInsets.only(bottom: 0.0),
                      elevation: 0,
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20),
                              child: Text(
                                'Районы',
                                // style: TextStyle(
                                //   // color: itemData[index].colorsItem,
                                //   // color: Colors.black,
                                //   color: black11,
                                //   fontSize: 18,
                                // ),
                                style: ts11_18_500_0,
                              ),
                            );
                          },
                          body: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 15, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                dv,
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 17, top: 0),
                                  child: Column(
                                    children: List.generate(
                                      districts.length,
                                      (index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RadioListTile(
                                            value: index,
                                            groupValue:
                                                selectedRadioTileDistrictTo,
                                            toggleable: true,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${districts[index].name}',
                                                  style: ts11_14_400_08,
                                                ),
                                                // Text(radioButtonsAvto[index]),
                                              ],
                                            ),
                                            onChanged: (val) {
                                              // if (selectedRadioTileAvto !=
                                              //     index) {
                                              checkGo();
                                              print(
                                                  "Current User ${districts[index]} ");
                                              setSelectedRadioTileDistrictTo(
                                                  val!);
                                              setState(() {
                                                _districtTo = districts[index];
                                              });
                                              checkGo();

                                              // }
                                            },
                                            selected:
                                                selectedRadioTileDistrictTo ==
                                                    index,
                                            // activeColor: Colors.black,
                                            activeColor: color_green,
                                            // selectedTileColor: Color(0xff2DC36A),
                                          ),
                                          districts.length - 1 != index
                                              ? dv2
                                              : SizedBox()
                                        ],
                                      ),
                                    ).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isExpanded: isExp2,
                        ),
                      ],
                      expansionCallback: (int item, bool status) {
                        setState(() {
                          isExp2 = !isExp2;
                        });
                      },
                    ),
                  )
                : state is GetDistrictsFailure
                    ? Center(
                        child: Text(
                          'ERROR',
                          style: tsred_12_500,
                        ),
                      )
                    : Text(
                        'Районы',
                        style: ts11_16_500_1,
                      );
      },
    );
  }

  Widget city_from_body() {
    List<CityModelInter> cities = [];
    return BlocBuilder<GetCitiesBloc, GetCitiesState>(
      builder: (context, state) {
        if (state is GetCitiesSuccess) {
          cities = state.list;
        }
        return state is GetCitiesLoading
            ? Center(
                heightFactor: 5,
                child: CircularProgressIndicator(
                  color: green300,
                ),
              )
            : state is GetCitiesSuccess
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ExpansionPanelList(
                        animationDuration: const Duration(milliseconds: 200),
                        expandedHeaderPadding:
                            const EdgeInsets.only(bottom: 0.0),
                        elevation: 0,
                        children: [
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 20),
                                child: Text(
                                  'Город отправления',
                                  // style: TextStyle(
                                  //   // color: itemData[index].colorsItem,
                                  //   // color: Colors.black,
                                  //   color: black11,
                                  //   fontSize: 18,
                                  // ),
                                  style: ts11_18_500_0,
                                ),
                              );
                            },
                            body: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 15, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  dv,
                                  Container(
                                    padding:
                                        const EdgeInsets.only(left: 17, top: 0),
                                    child: Column(
                                      children: List.generate(
                                        cities.length,
                                        (index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RadioListTile(
                                              value: index,
                                              groupValue:
                                                  selectedRadioTileCityFrom,
                                              toggleable: true,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${cities[index].name}',
                                                    style: ts11_14_400_08,
                                                  ),
                                                  // Text(radioButtonsAvto[index]),
                                                ],
                                              ),
                                              onChanged: (val) {
                                                // if (selectedRadioTileAvto !=
                                                //     index) {
                                                print(
                                                    "Current User ${cities[index]} ");
                                                setSelectedRadioTileCityFrom(
                                                    val!);
                                                setState(() {
                                                  _cityFrom = cities[index];
                                                });
                                                checkGo();
                                                context
                                                    .read<GetDistrictsBloc>()
                                                    .add(GetDistricts(
                                                        cities[index].id));
                                                // }
                                              },
                                              selected:
                                                  selectedRadioTileCityFrom ==
                                                      index,
                                              // activeColor: Colors.black,
                                              activeColor: color_green,
                                              // selectedTileColor: Color(0xff2DC36A),
                                            ),
                                            cities.length - 1 != index
                                                ? dv2
                                                : SizedBox()
                                          ],
                                        ),
                                      ).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: isExp1,
                          ),
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            isExp1 = !isExp1;
                          });
                        },
                      ),
                      sb_h16(),
                      districts_from_body(),
                    ],
                  )
                : state is GetCitiesFailure
                    ? Center(
                        heightFactor: 5,
                        child: Text(
                          'ERROR',
                          style: tsred_12_500,
                        ),
                      )
                    : SizedBox();
      },
    );
  }

  Widget districts_from_body() {
    List<CityModelInter> districts = [];
    return BlocBuilder<GetDistrictsBloc, GetDistrictsState>(
      builder: (context, state) {
        if (state is GetDistrictsSuccess) {
          districts = state.districts;
        }
        return state is GetDistrictsLoading
            ? Center(
                heightFactor: 5,
                child: CircularProgressIndicator(
                  color: green300,
                ),
              )
            : state is GetDistrictsSuccess
                ? SizedBox(
                    child: ExpansionPanelList(
                      animationDuration: const Duration(milliseconds: 200),
                      expandedHeaderPadding: const EdgeInsets.only(bottom: 0.0),
                      elevation: 0,
                      children: [
                        ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 20),
                              child: Text(
                                'Районы',
                                // style: TextStyle(
                                //   // color: itemData[index].colorsItem,
                                //   // color: Colors.black,
                                //   color: black11,
                                //   fontSize: 18,
                                // ),
                                style: ts11_18_500_0,
                              ),
                            );
                          },
                          body: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 15, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                dv,
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 17, top: 0),
                                  child: Column(
                                    children: List.generate(
                                      districts.length,
                                      (index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RadioListTile(
                                            value: index,
                                            groupValue:
                                                selectedRadioTileDistrictFrom,
                                            toggleable: true,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${districts[index].name}',
                                                  style: ts11_14_400_08,
                                                ),
                                                // Text(radioButtonsAvto[index]),
                                              ],
                                            ),
                                            onChanged: (val) {
                                              // if (selectedRadioTileAvto !=
                                              //     index) {
                                              print(
                                                  "Current User ${districts[index]} ");
                                              setSelectedRadioTileDistrictFrom(
                                                  val!);
                                              setState(() {
                                                _districtFrom =
                                                    districts[index];
                                              });
                                              checkGo();

                                              // }
                                            },
                                            selected:
                                                selectedRadioTileDistrictFrom ==
                                                    index,
                                            // activeColor: Colors.black,
                                            activeColor: color_green,
                                            // selectedTileColor: Color(0xff2DC36A),
                                          ),
                                          districts.length - 1 != index
                                              ? dv2
                                              : SizedBox()
                                        ],
                                      ),
                                    ).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isExpanded: isExp2,
                        ),
                      ],
                      expansionCallback: (int item, bool status) {
                        setState(() {
                          isExp2 = !isExp2;
                        });
                      },
                    ),
                  )
                : state is GetDistrictsFailure
                    ? Center(
                        child: Text(
                          'ERROR',
                          style: tsred_12_500,
                        ),
                      )
                    : Text(
                        'Районы',
                        style: ts11_16_500_1,
                      );
      },
    );
  }

  Column from_date_time(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            final DateTime? _dt = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2024),
            );
            print(_dt);
            if (_dt != null) {
              print('true');
              setState(() {
                _selectedDtFrom = _dt;
              });
              checkGo();
            }
            print(_selectedDtFrom);
          },
          child: Container(
            width: maxWidth(context) - 24,
            margin: EdgeInsets.only(bottom: 24),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _selectedDtFrom.year == 1999
                  ? 'Укажите дату'
                  : '${_selectedDtFrom.day}/${_selectedDtFrom.month}/${_selectedDtFrom.year}',
              style: ts11_16_400_08,
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            final TimeOfDay? _tod = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(alwaysUse24HourFormat: true),
                  child: child!,
                );
              },
            );
            print(_tod);
            if (_tod != null) {
              print('true');
              setState(() {
                _selectedTimeFrom = _tod;
              });
              checkGo();
            }
            print(_selectedTimeFrom);
          },
          child: Container(
            width: maxWidth(context) - 24,
            margin: EdgeInsets.only(bottom: 24),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _selectedTimeFrom == null
                  ? 'Укажите время'
                  : '${_selectedTimeFrom!.hour}:${_selectedTimeFrom!.minute}',
              style: ts11_16_400_08,
            ),
          ),
        ),
      ],
    );
  }

  Widget nomer_type_image(BuildContext context) {
    List<PlaceTypeModel> radioButtonsAvto = [];
    return BlocBuilder<GetPlaceTypesBloc, GetPlaceTypesState>(
      builder: (context, state) {
        if (state is GetPlaceTypesSuccess) {
          radioButtonsAvto = state.list;
        }
        return state is GetPlaceTypesLoading
            ? Center(
                heightFactor: 5,
                child: CircularProgressIndicator(
                  color: green300,
                ),
              )
            : state is GetPlaceTypesSuccess
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      price(maxWidth(context)),
                      sb_h16(),
                      expansion_panel(radioButtonsAvto),
                      sb_h16(),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        child: dobavitPhoto(maxWidth(context)),
                      ),
                      sb_h10(),
                      InkWell(
                        onTap: () {
                          ApiProvider _apiProv = ApiProvider();
                          print(_nomerController.text.isNotEmpty);
                          print(hasPhoto);
                          print(selectedRadioTilePlace != -1);
                          if (_nomerController.text.isNotEmpty &&
                              hasPhoto &&
                              selectedRadioTilePlace != -1) {
                            _apiProv.postBus(_nomerController.text,
                                _placeType.id, images![0]);
                            setState(() {
                              _isbusMade = true;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          width: maxWidth(context) - 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: black11,
                          ),
                          child: Text(
                            'Создать',
                            textAlign: TextAlign.center,
                            style: tsf4_16_600_0,
                          ),
                        ),
                      ),
                      images!.isNotEmpty
                          ? Column(
                              children: List.generate(
                                images!.length,
                                (index) =>
                                    photoWidget(maxWidth(context), index),
                              ),
                            )
                          : SizedBox(),
                    ],
                  )
                : state is GetPlaceTypesFailure
                    ? Center(
                        heightFactor: 5,
                        child: Text(
                          'ERROR',
                          style: tsred_12_500,
                        ),
                      )
                    : SizedBox();
      },
    );
  }

  ExpansionPanelList expansion_panel(List<PlaceTypeModel> radioButtonsAvto) {
    return ExpansionPanelList(
      animationDuration: const Duration(milliseconds: 200),
      expandedHeaderPadding: const EdgeInsets.only(bottom: 0.0),
      elevation: 0,
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: Text(
                'Type',
                // style: TextStyle(
                //   // color: itemData[index].colorsItem,
                //   // color: Colors.black,
                //   color: black11,
                //   fontSize: 18,
                // ),
                style: ts11_18_500_0,
              ),
            );
          },
          body: Container(
            padding: const EdgeInsets.only(left: 20, right: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dv,
                Container(
                  padding: const EdgeInsets.only(left: 17, top: 0),
                  child: Column(
                    children: List.generate(
                      radioButtonsAvto.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadioListTile(
                            value: index,
                            groupValue: selectedRadioTilePlace,
                            toggleable: true,
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Название: ${radioButtonsAvto[index].name},'
                                  '\nЦена:${radioButtonsAvto[index].cost}',
                                  style: ts11_14_400_08,
                                ),
                                // Text(radioButtonsAvto[index]),
                              ],
                            ),
                            onChanged: (val) {
                              if (selectedRadioTilePlace != index) {
                                print(
                                    "Current User ${radioButtonsAvto[index]} ");
                                setSelectedRadioTileAvto(val!);
                                // !isChoosed
                                //     ? widget
                                //         .stButton(PodachaAvtoAdver())
                                //     : null;
                                setState(() {
                                  // isChoosed = true;
                                  _placeType = radioButtonsAvto[index];
                                });
                              }
                            },
                            selected: selectedRadioTilePlace == index,
                            // activeColor: Colors.black,
                            activeColor: color_green,
                            // selectedTileColor: Color(0xff2DC36A),
                          ),
                          radioButtonsAvto.length - 1 != index
                              ? dv2
                              : SizedBox()
                        ],
                      ),
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
          isExpanded: isExp1,
        ),
      ],
      expansionCallback: (int item, bool status) {
        setState(() {
          isExp1 = !isExp1;
        });
      },
    );
  }

  Container photoWidget(double maxWidth, int i) {
    return Container(
      width: maxWidth - 26,
      height: maxWidth / 2,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: FileImage(File(images![i].path)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 11,
            right: 8,
            child: InkWell(
              onTap: () {
                setState(() {
                  images!.removeAt(i);
                });
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  // color: Color(0xff000000).withAlpha(150),
                  color: black11.withAlpha(150),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.delete,
                  size: 20,
                  // color: Color(0xffFF0000),
                  color: redff0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      images!.addAll(selectedImages);
    }
    print("Image List Length:" + images!.length.toString());
    selectedImages.isNotEmpty
        ? setState(
            () {
              hasPhoto = true;
              checkGo();
              // widget.stCanTap(
              //   widget.paa.copyWith(
              //     urlToImages:
              //         images!.length > 7 ? images!.sublist(0, 7) : images,
              //   ),
              // );
            },
          )
        : setState(() {
            hasPhoto = false;
          });
  }

  Widget dobavitPhoto(double maxW) {
    return ElevatedButton(
      autofocus: true,
      onPressed: () {
        selectImages();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: maxW - 24,
        decoration: BoxDecoration(
          // color: const Color(0xFF2DC36A),
          color: color_green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Добавить фотографию',
          textAlign: TextAlign.center,
          // style: TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w600,
          //   // color: Colors.white,
          //   color: whitef4,
          //   fontFamily: 'Gilroy',
          // ),
          style: tsf4_16_600_0,
        ),
      ),
    );
  }

  double maxWidth(BuildContext context) => (MediaQuery.of(context).size.width);

  Widget price(double maxWidth) {
    return Container(
      width: double.infinity,
      // height: 40,
      decoration: BoxDecoration(
        // color: Colors.white,
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      // padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 15),
      child: TextField(
        controller: _nomerController,
        // style: const TextStyle(
        //   fontSize: 18,
        //   fontWeight: FontWeight.w600,
        //   // color: Colors.black,
        //   color: black11,
        //   letterSpacing: 0.8,
        // ),
        style: ts11_18_600_08,
        keyboardType: TextInputType.text,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        //   FilteringTextInputFormatter.digitsOnly
        // ],
        onChanged: (value) {
          // print(controller.text);
          // !isWritten
          //     ? controller.text.isNotEmpty
          //         ? widget.stButton(
          //             widget.paa.copyWith(price: int.parse(controller.text)))
          //         : null
          //     : null;
          // setState(() {
          // isWritten = true;
          // if (controller.text.isEmpty) {
          //   // widget.stButton();
          //   isWritten = false;
          // }
          // });
          checkGo();
        },
        decoration: InputDecoration(
          // suffixIcon: Container(
          //   width: 50,
          //   alignment: Alignment.centerRight,
          //   child: Text(
          //     'KZT   ',
          //     // style: TextStyle(
          //     //   fontSize: 18,
          //     //   fontWeight: FontWeight.w400,
          //     //   // color: Color(0xffB3B3B3),
          //     //   color: grey87,
          //     //   fontFamily: 'Gilroy',
          //     // ),
          //     style: ts87_18_400_0,
          //   ),
          // ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: whitef4),
          ),
          hintText: 'Напишите гос. номер',
          hintStyle: ts11_16_400_08,
          filled: true,
          // fillColor: Colors.white,
          fillColor: white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: whitef4),
          ),
        ),
      ),
    );
  }

  Positioned button(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
        child: elevatedButton(context),
      ),
    );
  }

  void checkGo() {
    if (_page == 0) {
      if (_nomerController.text.isNotEmpty &&
          hasPhoto &&
          _isbusMade &&
          selectedRadioTilePlace != -1) {
        setState(() {
          _canGo = true;
        });
      } else {
        setState(() {
          _canGo = false;
        });
      }
    } else if (_page == 1) {
      if (_selectedDtFrom.year != 1999 && _selectedTimeFrom != null) {
        setState(() {
          _canGo = true;
        });
      } else {
        setState(() {
          _canGo = false;
        });
      }
    } else if (_page == 2) {
      if (selectedRadioTileCityFrom != -1 &&
          selectedRadioTileDistrictFrom != -1) {
        setState(() {
          _canGo = true;
        });
      } else {
        setState(() {
          _canGo = false;
        });
      }
    } else if (_page == 3) {
      if (selectedRadioTileCityTo != -1 && selectedRadioTileDistrictTo != -1) {
        setState(() {
          _canGo = true;
        });
      } else {
        setState(() {
          _canGo = false;
        });
      }
    }
  }

  Widget indexChecker(double chastWidth) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          // appBarNames.length + 1,
          6,
          (index) => Container(
            width: chastWidth,
            height: 3,
            decoration: BoxDecoration(
              color: _page >= index
                  // ? const Color(0xFF2DC36A)
                  ? color_green
                  : greyc1,
              // greyc1,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton elevatedButton(BuildContext context) {
    return ElevatedButton(
      autofocus: true,
      onPressed: () {
        ApiProvider _apiProv = ApiProvider();
        if (_page == 3) {
          setState(() {
            saam = SingleAvtoAdvModel(
              id: -1,
              busId: 28,
              availablePlaces: [],
              placeIds: [],
              price: _placeType.cost,
              cityFrom: _cityFrom.name,
              districtFrom: _districtFrom.name,
              districtTo: _districtTo.name,
              cityTo: _cityTo.name,
              arrivalDate:
                  '${_selectedDtFrom.day}.${_selectedDtFrom.month}.${_selectedDtFrom.year}',
              arrivalTime:
                  '${_selectedTimeFrom!.hour < 10 ? '0' : ''}${_selectedTimeFrom!.hour}:'
                  '${_selectedTimeFrom!.minute < 10 ? '0' : ''}${_selectedTimeFrom!.minute}',
              authorPhone: 'authorPhone',
              authorId: 'authorId',
              imageUrls: [images![0].path],
            );
          });
        }
        _page == 5
            ? Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
                return HomePage();
              }), (route) => true)
            : null;
        setState(() {
          // _page != 0 ? _page++ : null;
          _page != 5 ? _page++ : null;
          isExp1 = false;
          isExp2 = false;
        });
        context.read<GetDistrictsBloc>().add(GetDistrictsInitialEv());
        _page == 4
            ? _apiProv.postAdvInter(_selectedDtFrom, _selectedTimeFrom!,
                _cityTo.id, _cityFrom.id, _districtTo.id, _districtFrom.id)
            : null;

        // context.read<GetCitiesBloc>().add(GetCitiesInitialEv());
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width - 24,
        decoration: BoxDecoration(
          color: _canGo ? color_green : green300,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          _page != 5 ? 'Подтвердить' : 'Закончить',
          textAlign: TextAlign.center,
          // style: TextStyle(
          //   fontSize: 20,
          //   fontWeight: FontWeight.w600,
          //   // color: Colors.white,
          //   color: whitef4,
          // ),
          style: tsf4_20_600_0,
        ),
      ),
    );
  }
}

AppBar appBar(BuildContext context, String name) {
  return AppBar(
    toolbarHeight: 60,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
    ),
    automaticallyImplyLeading: false,
    leading: InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
      child: Container(
        // height: 16,
        margin: const EdgeInsets.only(left: 12, bottom: 12, right: 0, top: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_left,
          // size: 24,
          // color: Color(0xFF2DC36A),
          color: color_green,
        ),
      ),
    ),
    backgroundColor: const Color(0xFF111111),
    title: Container(
      margin: const EdgeInsets.only(top: 24.5, bottom: 20.5),
      child: Text(
        // 'Выберите марку',
        name,
        // style: TextStyle(
        //   color: Colors.white,
        //   fontSize: 16,
        //   fontWeight: FontWeight.w600,
        //   fontFamily: 'Gilroy',
        // ),
        style: tswh_16_600_0,
      ),
    ),
  );
}
