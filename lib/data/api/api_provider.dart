import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interct_2/data/models/city_model_inter.dart';
import 'package:interct_2/data/models/comment_model_inter.dart';
import 'package:interct_2/data/models/generation_model.dart';
import 'package:interct_2/data/models/place_type_model.dart';
import 'package:interct_2/data/models/podacha_adver_model/podacha_avto_adver.dart';
import 'package:interct_2/data/models/ticket_model.dart';

import '../../data/api/config.dart';
import '../../data/models/city_model.dart';
import '../../data/models/region_model.dart';
import '../../data/models/single_avto_adv_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../models/avto/avto_advertisement_tile_model.dart';
import '../models/avto_request_model.dart';
import '../models/marka_model.dart';
import '../models/model_model.dart';
import '../models/user_model.dart';
import '../models/userme_model.dart';

var tokenBox = Hive.box('tokens');

class ApiProvider {
  static final ApiProvider _singleton = ApiProvider._internal();

  factory ApiProvider() {
    return _singleton;
  }

  ApiProvider._internal();
  String token =
      tokenBox.isNotEmpty ? tokenBox.get('access') as String : 'null';

  Future<bool> loginUser(String phone, String password) async {
    print('STARTED LOGIN USER api method');
    print('$phone : $password');
    final response = await http.post(
      Uri.parse('${baseUrl}auth/login'),
      body: {
        "phone": phone,
        'password': password,
      },
    );
    print('RESPONSE STATUS CODE IS ${response.statusCode}');
    print('RESPONSE STATUS BODY IS ${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('ACCESS TOKEN IS ${response.body}\n');
      print('STARTING PUTTING TO BOX');
      token = response.body; // esli cash sohranitsya
      tokenBox.put('access', response.body);
      // userBox.put('isBusiness', false);
    }
    return response.statusCode == 201;
  }

  Future<bool> registerUser(UserModel userModel) async {
    print('STARTED REGISTER USER api method');
    print(userModel.toString());

    var tokenBox = Hive.box('tokens');
    // String name = userModel.name;
    String password = userModel.password;
    String phoneNumber = userModel.phoneNumber;

    final response = await http.post(
      Uri.parse('${baseUrl}auth/registration'),
      body: {
        'password': password,
        'phone': phoneNumber,
        // 'name': name,
      },
    );

    print('REGISTER USER RESPONSE STATUS CODE IS ${response.statusCode}');
    print('REGISTER USER RESPONSE BODY ${response.body}');
    token = response.body; // esli cash sohranitsya
    // isPutProfile ? null : tokenBox.put('access', response.body);
    response.statusCode == 201 ? tokenBox.put('access', response.body) : null;

    return response.statusCode == 201;
  }

  Future<List<String>?> getBanners() async {
    List<String> urlsToBanners = [];
    var tokenBox = Hive.box('tokens');
    print('STARTED GET BANNERS api method');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}banner'),
        headers: headers,
      );
      print('BANNERS RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'BANNERS RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))['data']}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> listData =
            jsonDecode(utf8.decode(response.bodyBytes))['data'];
        print('LIST OF BANNERS ${listData.length}');
        for (var data in listData) {
          String? url = data['image']['image'];
          url != null ? urlsToBanners.add(url) : print('URL TO BANNER IS NULL');
        }
        return urlsToBanners;
      }
    }
    return null;
  }

  Future<SingleAvtoAdvModel?> getSingleAvtoAdvers(int id) async {
    // List<AvtoAdvertisementTile> advers = [];
    var tokenBox = Hive.box('tokens');
    print('STARTED GET SINGLE AVTO ADV api method');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}session/$id'),
        headers: headers,
      );
      print('GET SINGLE ADV  RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET SINGLE ADV RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        Map<dynamic, dynamic> avtoData =
            jsonDecode(utf8.decode(response.bodyBytes));
        int price = avtoData['bus']['type']['cost'];
        String arrivalDate = avtoData['arrivalDate'];
        double arrivalTime = double.parse(avtoData['arrivalTime'].toString());
        String urlMainPhoto = avtoData['bus']['image'];
        int authorId = avtoData['bus']['user']['id'];
        String cityFrom = avtoData['cityFrom']['title'];
        print('cityfrom');
        String districtFrom =
            avtoData['districtFrom']['title'] ?? 'District from';
        print(avtoData['districtFrom']['title']);
        String districtTo =
            avtoData['districtsTo'][0]['title'] ?? 'District to';
        print(avtoData['districtsTo'][0]['title']);
        String cityTo = avtoData['cityTo']['title'];
        print(avtoData['cityTo']['title']);
        String authorPhone = avtoData['bus']['user']['phone'];
        int busTypeId = avtoData['bus']['type']['id'] ?? 15;
        int busId = avtoData['bus']['id'] ?? 28;
        List<String> imageUrls = [urlMainPhoto];
        List<bool> availablePlaces = [];
        for (var place in avtoData['places']) {
          availablePlaces.add(!(place['taken'] ?? true));
        }
        List<int> placeIds = [];
        for (var place in avtoData['places']) {
          placeIds.add(place['id'] ?? 1);
        }
        // for (var d in avtoData['images']) {
        //   imageUrls.add(d['image']);
        // }
        DateTime dt = DateTime.parse(arrivalDate);
        String atime =
            '${arrivalTime.toInt()}:${arrivalTime * 100.toInt() % 100.toInt()}';
        SingleAvtoAdvModel saam = SingleAvtoAdvModel(
          id: id,
          availablePlaces: availablePlaces,
          price: price,
          cityFrom: cityFrom,
          cityTo: cityTo,
          placeIds: placeIds,
          arrivalDate: '${dt.day}.${dt.month}.${dt.year}',
          arrivalTime: atime,
          authorPhone: authorPhone,
          imageUrls: imageUrls,
          authorId: '$authorId',
          districtFrom: districtFrom,
          districtTo: districtTo,
          busTypeId: busTypeId,
          busId: busId,
          // year: year,
          // probeg: '$probeg км',
          // obiem: '$volumeл',
          // view: view,
          // isLiked: false,
          // rule: steeringWheel,
          // sostoyanie: state,
          // customsClearance: customsClearance,
          // comments: comments,
          // likes: likes,
          // raionTo: model,
          // driveUnit: driveUnit,
          // raionFrom: marka,
          // isTop: true,
          // isRecommended: true,
        );
        print(saam);
        return saam;
      }
    }
    return null;
  }

  Future<List<AvtoAdvertisementTile>?> getFavouriteAdvers() async {
    List<AvtoAdvertisementTile> advers = [];
    var tokenBox = Hive.box('tokens');
    print('STARTED GET ADVERS api method');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        // Uri.parse('${baseUrl}announcement?favorites=true'),
        Uri.parse('${baseUrl}session?like=true'),
        headers: headers,
      );
      print(
          'GET FAVORITE ADVERS  RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET FAVORITE ADVERS  RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))['data']}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> listData =
            jsonDecode(utf8.decode(response.bodyBytes))['data'];
        print('LIST OF GET ADVERS  ${listData.length}');
        for (var avtoData in listData) {
          int avtoid = avtoData['id'];
          int price = avtoData['bus']['type']['cost'];
          // int view = avtoData['views'];
          String city2 = avtoData['cityTo']['title'];
          // int probeg = avtoData['mileage'];
          // String volume = avtoData['volume'].toString();
          String arrivalDate = avtoData['arrivalDate'];
          // String model = avtoData['model'];
          // String transmission = avtoData['transmission'];
          String urlMainPhoto = avtoData['bus']['image'];
          // String steeringWheel = avtoData['steeringWheel'];
          // String state = avtoData['state'];
          // String marka = avtoData['marka'];
          String city1 = avtoData['cityFrom']['title'];
          String busTitle = avtoData['bus']['type']['title'];
          // String phone = avtoData['phone'];
          // String countImages = avtoData['countImages'];
          bool isLiked = avtoData['likes'].length > 0;
          AvtoAdvertisementTile aat = AvtoAdvertisementTile(
            idOfAdver: avtoid,
            urlMainPhoto: urlMainPhoto,
            countImages: '1',
            name: '',
            price: price.toString(),
            city1: city1,
            city2: city2.toString(),
            // probeg: '$probegкм',
            busTitle: busTitle,
            // obiemDvigatel: '$volumeл',
            datePublish: arrivalDate,
            // prosmotry: view,
            // isThundered: false,
            isLiked: isLiked,
            // rule: steeringWheel,
            // sostoyanie: state,
            // transmission: transmission,
            // phone: phone,
          );
          advers.add(aat);
          // url != null ? advers.add(url) : print('URL TO GET ADVERS  IS NULL');
        }
        return advers;
      }
    }
    return null;
  }

  Future<List<AvtoAdvertisementTile>?> getAvtoAdvers(
      AvtoRequestModel arm) async {
    List<AvtoAdvertisementTile> advers = [];
    String request = arm.busId != null ? 'busId=${arm.busId}' : '';
    // request = arm.yearFrom != null ? 'yearFrom=$arm.yearFrom&' : '';
    // request = arm.yearTo != null ? 'yearTo=$arm.yearTo&' : '';
    // request = arm.cityId != null ? 'cities=$arm.cityId&' : '';
    // request = arm.modelId != null ? 'models=$arm.modelId&' : '';
    // request = arm.markaId != null ? 'marks=$arm.markaId&' : '';
    var tokenBox = Hive.box('tokens');
    print('STARTED GET ADVERS api method');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    print(request);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse(
            '${baseUrl}session?limit=${arm.page == -1 ? 100 : 10}&page=${arm.page == -1 ? 1 : arm.page}&$request'),
        headers: headers,
      );
      print('GET ADVERS  RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET ADVERS  RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))['data']}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> listData =
            jsonDecode(utf8.decode(response.bodyBytes))['data'];
        print('LIST OF GET ADVERS  ${listData.length}');
        for (var avtoData in listData) {
          int avtoid = avtoData['id'];
          int price = avtoData['bus']['type']['cost'];
          // int view = avtoData['views'];
          String city2 = avtoData['cityTo']['title'];
          // int probeg = avtoData['mileage'];
          // String volume = avtoData['volume'].toString();
          String arrivalDate = avtoData['arrivalDate'];
          // String model = avtoData['model'];
          // String transmission = avtoData['transmission'];
          String urlMainPhoto = avtoData['bus']['image'];
          // String steeringWheel = avtoData['steeringWheel'];
          // String state = avtoData['state'];
          // String marka = avtoData['marka'];
          String city1 = avtoData['cityFrom']['title'];
          String busTitle = avtoData['bus']['type']['title'];
          // String phone = avtoData['phone'];
          // String countImages = avtoData['countImages'];
          bool isLiked = avtoData['likes'].length > 0;
          AvtoAdvertisementTile aat = AvtoAdvertisementTile(
            idOfAdver: avtoid,
            urlMainPhoto: urlMainPhoto,
            countImages: '1',
            name: '',
            price: price.toString(),
            city1: city1,
            city2: city2.toString(),
            // probeg: '$probegкм',
            busTitle: busTitle,
            // obiemDvigatel: '$volumeл',
            datePublish: arrivalDate,
            // prosmotry: view,
            // isThundered: false,
            isLiked: isLiked,
            // rule: steeringWheel,
            // sostoyanie: state,
            // transmission: transmission,
            // phone: phone,
          );
          advers.add(aat);
          // url != null ? advers.add(url) : print('URL TO GET ADVERS  IS NULL');
        }
        return advers;
      }
    }
    return null;
  }

  Future<bool> likeAdver(int id) async {
    bool isLiked = false;
    print('STARTED LIKE ADVERS api method');
    print(id.toString());

    var tokenBox = Hive.box('tokens');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    final response = await http.post(
      Uri.parse('${baseUrl}like'),
      headers: headers,
      body: {
        "sessionId": '$id',
        // "kind": "ANNOUNCEMENT",
      },
    );

    print(' LIKE ADVERS STATUS CODE IS ${response.statusCode}');
    // print('REGISTER LIKE ADVERS BODY ${response.body}');
    isLiked = response.statusCode == 201;
    return isLiked;
  }

  Future<List<RegionModel>?> getRegions() async {
    List<RegionModel> regions = [];
    var tokenBox = Hive.box('tokens');
    print('STARTED GET REGIONS CITIES api method');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}region?limit=100'),
        headers: headers,
      );
      print(
          'GET REGIONS CITIES RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET REGIONS CITIES RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> listData = jsonDecode(utf8.decode(response.bodyBytes));
        print('LIST OF GET REGIONS CITIES  ${listData.length}');
        for (var regionData in listData) {
          int regionid = regionData['id'];
          String regionName = regionData['title'];
          List<CityModel> citiesList = [];
          for (var cities in regionData['cities']) {
            int cityId = cities['id'];
            String cityName = cities['title'];
            citiesList.add(CityModel(idCity: cityId, name: cityName));
          }
          regions.add(RegionModel(
              idRegion: regionid, nameRegion: regionName, cities: citiesList));
        }
        return regions;
      }
    }
    return null;
  }

  Future<List<MarkaModel>?> getMarkas() async {
    List<MarkaModel> markas = [];
    var tokenBox = Hive.box('tokens');
    print('STARTED GET MARKA api method');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}marka?limit=100'),
        headers: headers,
      );
      print('GET MARKA RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET MARKA RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))['data']}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> listData =
            jsonDecode(utf8.decode(response.bodyBytes))['data'];
        print('LIST OF GET MARKA  ${listData.length}');
        for (var markasData in listData) {
          int markaid = markasData['id'];
          String markaName = markasData['title'];

          markas.add(MarkaModel(id: markaid, name: markaName));
        }
        return markas;
      }
    }
    return null;
  }

  Future<List<ModelModel>?> getModels(int markaId) async {
    List<ModelModel> markas = [];
    var tokenBox = Hive.box('tokens');
    print('STARTED GET MODELS api method');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}model?markaId=$markaId?limit=100'),
        headers: headers,
      );
      print('GET MODELS RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET MODELS RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))['data']}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> listData =
            jsonDecode(utf8.decode(response.bodyBytes))['data'];
        print('LIST OF GET MODELS  ${listData.length}');
        for (var markasData in listData) {
          int markaid = markasData['id'];
          String markaName = markasData['title'];

          markas.add(ModelModel(id: markaid, name: markaName));
        }
        return markas;
      }
    }
    return null;
  }

  Future<List<GenerationModel>?> getGenerationModel(int idOfModel) async {
    List<GenerationModel> generations = [];
    print('GENERATION MODEL API METHOD $idOfModel');
    var tokenBox = Hive.box('tokens');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}generation/$idOfModel'),
        headers: headers,
      );
      print('GET GENERATION STATUS CODE IS ${response.statusCode}');
      print(
          'GET GENERATIONS RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))['data']}');
      if (response.statusCode == 403) {
        // tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> listData = jsonDecode(utf8.decode(response.bodyBytes));
        print('LIST OF GET MODELS  ${listData.length}');
        for (var generationsData in listData) {
          int generationid = generationsData['id'];
          String generationName = generationsData['title'];
          int createdFrom = generationsData['createdFrom'];
          int createdTo = generationsData['createdTo'];

          generations.add(GenerationModel(
              id: generationid,
              name: generationName,
              createdFrom: createdFrom,
              createdTo: createdTo));
        }
        return generations;
      }
    }
    return null;
  }

  Future<bool> postBus(String nomer, int typeId, XFile imageFile) async {
    print('POST BUS API METHOD');
    final multireq = http.MultipartRequest(
      'POST',
      Uri.parse(
        '${baseUrl}bus',
      ),
    );
    print(tokenBox.get('access'));
    print(nomer);
    print(typeId);
    print(imageFile);

    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access'),
      "Content-Type": "application/json",
    };
    multireq.headers.addAll(headers);
    multireq.fields['number'] = nomer;
    multireq.fields['typeId'] = '$typeId';
    var file = await http.MultipartFile.fromPath('image', imageFile.path);
    multireq.files.add(file);

    final response = await multireq.send();

    return response.statusCode == 201;
  }

  Future<bool> postAdvInter(DateTime dtarr, TimeOfDay tod, int cityToId,
      int cityFromId, int districtToId, int districtFromId) async {
    print('POST ADVERS INTER API METHOD');
    final multireq = http.MultipartRequest(
      'POST',
      Uri.parse(
        '${baseUrl}bus',
      ),
    );
    print(tokenBox.get('access'));
    print(dtarr.toString());
    print(tod.toString());
    print(cityToId);
    print(cityFromId);
    print(districtFromId);
    print(districtToId);

    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access'),
      "Content-Type": "application/json",
    };
    final response = await http.post(
      Uri.parse('${baseUrl}session'),
      body: jsonEncode(
        {
          'arrivalDate': dtarr.toString(),
          'arrivalTime': '${(tod.hour * 100 + tod.minute) / 100}',
          'cityToId': '$cityToId',
          'cityFromId': '$cityFromId',
          'districtsToIds': ['$districtToId'],
          'districtFromId': '$districtFromId',
        },
      ),
      headers: headers,
    );
    print('ADVERS INTER RESPONSE STATUS CODE IS ${response.statusCode}');
    print('ADVERS INTER RESPONSE BODY ${response.body}');
    return response.statusCode == 201;
  }

  Future<bool> postAdvers(PodachaAvtoAdver paa) async {
    print('POST ADVERS API METHOD');
    final multireq = http.MultipartRequest(
      'POST',
      Uri.parse(
        '${baseUrl}announcement',
      ),
    );
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access'),
      "Content-Type": "application/json",
    };

    multireq.headers.addAll(headers);
    multireq.fields['year'] = paa.yearOfProduct ?? '2000';
    multireq.fields['volume'] = '3.5';
    multireq.fields['mileage'] = paa.probeg ?? '777';
    multireq.fields['price'] = paa.price != null ? paa.price.toString() : '777';
    multireq.fields['description'] = 'Хорошая машина';
    multireq.fields['steeringWheel'] = paa.rule ?? 'left';
    multireq.fields['markaId'] = paa.marka != null ? paa.marka.toString() : '1';
    multireq.fields['modelId'] = paa.model != null ? paa.model.toString() : '1';
    multireq.fields['generationId'] =
        paa.pokolenie != null ? paa.pokolenie.toString() : '1';
    multireq.fields['bodyTypeId'] =
        paa.typeKuzov != null ? paa.typeKuzov.toString() : '1';
    multireq.fields['cityId'] =
        paa.gorod != null ? paa.typeKuzov.toString() : '1';
    multireq.fields['state'] = paa.isNew!
        ? 'новые'
        : paa.isAvariynaya!
            ? 'аварийная'
            : 'б/у';
    multireq.fields['transmissionId'] = '1';
    multireq.fields['driveUnit'] = paa.privod ?? 'передний привод';
    multireq.fields['customsClearance'] =
        paa.isRastomojenInKZ != null ? paa.isRastomojenInKZ.toString() : 'true';
    multireq.fields['phone'] = paa.phoneOfAuthor ?? '+71234567898';
    multireq.fields['color'] = paa.color ?? 'черный';
    for (var image in paa.urlToImages!) {
      var file = await http.MultipartFile.fromPath('image', image.path);
      multireq.files.add(file);
    }
    final response = await multireq.send();

    return response.statusCode == 201;
  }

  Future<UserMeModel?> getUserMe() async {
    var tokenBox = Hive.box('tokens');
    print('STARTED USER ME api method');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}user/me'),
        headers: headers,
      );
      print('GET USER ME RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET USER ME RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))['data']}');
      if (response.statusCode == 403 || response.statusCode == 401) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        Map<String, dynamic> markasData =
            jsonDecode(utf8.decode(response.bodyBytes));

        int id = markasData['id'];
        String phone = markasData['phone'] ?? '87071231234';
        String name = markasData['username'] ?? 'Пользователь';
        Map<String, dynamic>? busIdJ = markasData['bus'];
        int? busId = busIdJ != null ? busIdJ['id'] : null;

        UserMeModel umm =
            UserMeModel(id: id, name: name, phone: phone, busId: busId);
        return umm;
      }
    }
    return null;
  }

  Future<List<PlaceTypeModel>?> getPlacesType() async {
    print('GET PLACES TYPE API');
    List<PlaceTypeModel> places = [];
    var tokenBox = Hive.box('tokens');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}place/type?limit=100'),
        headers: headers,
      );
      print('GET PLACES TYPE RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET PLACES TYPE RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> listData = jsonDecode(utf8.decode(response.bodyBytes));
        print('LIST OF GET PLACES TYPE  ${listData.length}');
        for (var regionData in listData) {
          int placeid = regionData['id'] ?? -1;
          String placeName = regionData['title'] ?? 'NULL ERROR';
          int cost = regionData['cost'] ?? -1000;
          // List<CityModel> citiesList = [];
          // for (var cities in regionData['cities']) {
          //   int cityId = cities['id'];
          //   String cityName = cities['title'];
          //   citiesList.add(CityModel(idCity: cityId, name: cityName));
          // }
          places.add(PlaceTypeModel(name: placeName, cost: cost, id: placeid));
        }
        return places;
      }
    }
    return null;
  }

  Future<List<CityModelInter>?> getDistrictsInter(int idOfCity) async {
    print('GET DISTRICTS INTER API');
    List<CityModelInter> cities = [];
    var tokenBox = Hive.box('tokens');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}district/$idOfCity?limit=100'),
        headers: headers,
      );
      print(
          'GET DISTRICTS INTER RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET DISTRICTS INTER RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> listData = jsonDecode(utf8.decode(response.bodyBytes));
        print('LIST OF GET DISTRICTS INTER  ${listData.length}');
        for (var regionData in listData) {
          int placeid = regionData['id'] ?? -1;
          String placeName = regionData['title'] ?? 'NULL ERROR';
          // int cost = regionData['cost'] ?? -1000;
          // List<CityModel> citiesList = [];
          // for (var cities in regionData['cities']) {
          //   int cityId = cities['id'];
          //   String cityName = cities['title'];
          //   citiesList.add(CityModel(idCity: cityId, name: cityName));
          // }
          cities.add(CityModelInter(name: placeName, id: placeid));
        }
        return cities;
      }
    }
    return null;
  }

  Future<List<CityModelInter>?> getCitiesInter() async {
    print('GET CITIES INTER API');
    List<CityModelInter> cities = [];
    var tokenBox = Hive.box('tokens');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}city?limit=100'),
        headers: headers,
      );
      print('GET CITIES INTER RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET CITIES INTER RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> listData = jsonDecode(utf8.decode(response.bodyBytes));
        print('LIST OF GET CITIES INTER  ${listData.length}');
        for (var regionData in listData) {
          int placeid = regionData['id'] ?? -1;
          String placeName = regionData['title'] ?? 'NULL ERROR';
          // int cost = regionData['cost'] ?? -1000;
          // List<CityModel> citiesList = [];
          // for (var cities in regionData['cities']) {
          //   int cityId = cities['id'];
          //   String cityName = cities['title'];
          //   citiesList.add(CityModel(idCity: cityId, name: cityName));
          // }
          cities.add(CityModelInter(name: placeName, id: placeid));
        }
        return cities;
      }
    }
    return null;
  }

  Future<bool> postCommet(CommentModelInter cmi) async {
    print('STARTED COMMENT INTER api method');
    print(cmi.toString());

    String text = cmi.text;
    int busId = cmi.busId;
    var tokenBox = Hive.box('tokens');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    final response = await http.post(
      Uri.parse('${baseUrl}comment'),
      body: {
        'text': text,
        'busId': '$busId',
      },
      headers: headers,
    );
    print('COMMENT INTER RESPONSE STATUS CODE IS ${response.statusCode}');
    print('COMMENT INTER RESPONSE BODY ${response.body}');
    return response.statusCode == 201;
  }

  Future<bool> buyTicket(int placeId, int busId) async {
    print('STARTED BUY TICKET api method');
    print(placeId);
    print(busId);
    var tokenBox = Hive.box('tokens');
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    final response = await http.post(
      Uri.parse('${baseUrl}ticket'),
      body: {
        'sessionPlaceId': '$placeId',
        'busId': '$busId',
      },
      headers: headers,
    );
    print('BUY TICKET RESPONSE STATUS CODE IS ${response.statusCode}');
    print('BUY TICKET RESPONSE BODY ${response.body}');
    return response.statusCode == 201;
  }

  Future<List<TicketModel>?> getMyTickets() async {
    var tokenBox = Hive.box('tokens');
    print('STARTED GET MY TICKET api method');
    List<TicketModel> _listTm = [];
    print(tokenBox.get('access'));
    Map<String, String> headers = {
      "Authorization": "Bearer: " + tokenBox.get('access')
    };
    print(headers);
    if (tokenBox.get('access') != null) {
      final response = await http.get(
        Uri.parse('${baseUrl}ticket'),
        headers: headers,
      );
      print('GET MY TICKET RESPONSE STATUS CODE IS ${response.statusCode}');
      print(
          'GET MY TICKET RESPONSE STATUS BODY IS ${jsonDecode(utf8.decode(response.bodyBytes))}');
      if (response.statusCode == 403) {
        tokenBox.clear();
      }
      if (response.statusCode == 200) {
        List<dynamic> avtoDatas = jsonDecode(utf8.decode(response.bodyBytes));
        for (var avtoData in avtoDatas) {
          int price = avtoData['cost'];
          String arrivalDate = avtoData['session']['session']['arrivalDate'];
          double arrivalTime = double.parse(
              avtoData['session']['session']['arrivalTime'].toString());
          String urlMainPhoto = avtoData['bus']['image'];
          String nomer = avtoData['bus']['number'];
          int busId = avtoData['bus']['id'] ?? 28;
          String imageUrls = urlMainPhoto;
          int nomerBileta = avtoData['session']['id'];
          String statusJ = avtoData['session']['session']['status'];
          String status = statusJ == 'collects'
              ? 'В ожиданий'
              : statusJ == 'inTransit'
                  ? 'В пути'
                  : 'Закончен';
          int row = avtoData['session']['place']['row'];
          int column = avtoData['session']['place']['column'];

          DateTime dt = DateTime.parse(arrivalDate);
          String atime =
              '${arrivalTime.toInt()}:${arrivalTime * 100.toInt() % 100.toInt()}';
          TicketModel tm = TicketModel(
            id: -1,
            cost: price,
            dt: '${dt.day}.${dt.month}.${dt.year}  $atime',
            image: imageUrls,
            busId: busId,
            nomer: nomer,
            nomerBileta: nomerBileta,
            status: status,
            row: row,
            column: column,
          );
          print(tm);
          _listTm.add(tm);
        }
        return _listTm;
      }
    }
    return null;
  }
}
