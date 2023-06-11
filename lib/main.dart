import 'package:interct_2/data/models/single_avto_adv_model.dart';
import 'package:interct_2/screens/podachaObyavlenie/podacha_interct_page.dart';
import 'package:interct_2/screens/single_adv_body.dart/homeSingleAdv.dart';

import 'data/constants/colors.dart';
import 'screens/home_page/blocs/get_advertisements_bloc/get_advertisements_bloc.dart';
import 'screens/home_page/blocs/get_banner_bloc/get_banner_bloc.dart';
import 'screens/home_page/home_page.dart';
import 'screens/podachaObyavlenie/blocs/get_cities_bloc/get_cities_bloc.dart';
import 'screens/podachaObyavlenie/blocs/get_districts_bloc/get_districts_bloc.dart';
import 'screens/podachaObyavlenie/blocs/get_generations_bloc/get_generations_bloc.dart';
import 'screens/podachaObyavlenie/blocs/get_places_type_bloc/get_place_types_bloc.dart';
import 'screens/podachaObyavlenie/blocs/post_advers_bloc/post_advers_bloc.dart';
import 'screens/profile/blocs/get_my_adv_bloc/get_my_adv_bloc.dart';
import 'screens/profile/blocs/get_tickets_bloc/get_tickets_bloc.dart';
import 'screens/profile/blocs/get_user_me_bloc/get_user_me_bloc.dart';
// import 'screens/single_adv_body.dart/homeSingleAdv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'route/routes.dart';
import 'screens/home_page/blocs/get_marka_models_bloc/get_marka_models_bloc.dart';
import 'screens/home_page/blocs/get_regions_cities_bloc/get_regions_cities_bloc.dart';
import 'screens/home_page/blocs/like_cubit/like_cubit.dart';
import 'screens/like/get_favorite_advers_bloc/get_favorite_advers_bloc.dart';
import 'screens/login_page/auth_bloc/auth_bloc.dart';
import 'screens/login_page/login_page.dart';
import 'screens/single_adv_body.dart/get_single_adv_bloc/get_single_adv_bloc.dart';
import 'screens/single_adv_body.dart/post_comment_bloc/post_comment_bloc.dart';
import 'screens/single_adv_body.dart/zabron_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Hive.registerAdapter(UserModelAdapter()); // id = 0
  await Hive.initFlutter();
  // await Hive.openBox<UserModel>('user');
  await Hive.openBox('tokens');

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: black11,
    systemNavigationBarColor: black11,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

AutolikeRouter router = AutolikeRouter();

var tokenBox = Hive.box('tokens');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(tokenBox.get('tokens'));
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<GetBannerBloc>(create: (context) => GetBannerBloc()),
        BlocProvider<GetSingleAdvBloc>(create: (context) => GetSingleAdvBloc()),
        BlocProvider<GetGenerationsBloc>(
            create: (context) => GetGenerationsBloc()),
        BlocProvider<PostAdversBloc>(create: (context) => PostAdversBloc()),
        BlocProvider<GetUserMeBloc>(create: (context) => GetUserMeBloc()),
        BlocProvider<GetCitiesBloc>(create: (context) => GetCitiesBloc()),
        BlocProvider<GetDistrictsBloc>(create: (context) => GetDistrictsBloc()),
        BlocProvider<PostCommentBloc>(create: (context) => PostCommentBloc()),
        BlocProvider<GetTicketsBloc>(create: (context) => GetTicketsBloc()),
        BlocProvider<GetMyAdvBloc>(create: (context) => GetMyAdvBloc()),
        BlocProvider<GetPlaceTypesBloc>(
            create: (context) => GetPlaceTypesBloc()),
        BlocProvider<GetFavoriteAdversBloc>(
            create: (context) => GetFavoriteAdversBloc()),
        BlocProvider<GetMarkasModelsBloc>(
            create: (context) => GetMarkasModelsBloc()),
        BlocProvider<GetRegionsCitiesBloc>(
            create: (context) => GetRegionsCitiesBloc()),
        BlocProvider<LikeCubit>(create: (context) => LikeCubit()),
        BlocProvider<GetAdvertisementsBloc>(
            create: (context) => GetAdvertisementsBloc()),
        BlocProvider<GetAdvertisementsBloc>(
            create: (context) => GetAdvertisementsBloc()),
      ],
      child: MaterialApp(
        title: 'AvtoLike',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: tokenBox.isEmpty ? LoginPage() : HomePage(),
        // home: SingleAdvPage(id: 2),
        // home: ZabronPage(
        //   saam: SingleAvtoAdvModel(
        //       id: -1,
        //       price: 10000,
        //       cityFrom: 'cityFrom',
        //       districtFrom: 'districtFrom',
        //       districtTo: 'districtTo',
        //       cityTo: 'cityTo',
        //       arrivalDate: 'arrivalDate',
        //       arrivalTime: 'arrivalTime',
        //       authorPhone: 'authorPhone',
        //       authorId: 'authorId',
        //       imageUrls: ['imageUrls']),
        // ),
        onGenerateRoute: router.generateRoute,

        // initialRoute: AppRoute.home,
      ),
    );
  }
}
