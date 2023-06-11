import 'package:interct_2/data/models/userme_model.dart';

import '../data/models/user_model.dart';
import '../screens/podachaObyavlenie/podacha_interct_page.dart';
import 'route_constatnts.dart';
import '../screens/avtoPageBody/homeAvtoPage.dart';
import '../screens/chat_page/chat_page.dart';
import '../screens/like/homeLikePage.dart';
import '../screens/login_page/login_page.dart';
import '../screens/login_page/other_pages/code_verification_screen.dart';
import '../screens/login_page/other_pages/password_page.dart';
import '../screens/profile/archiveLaikov.dart';
import '../screens/profile/bankKartypage.dart';
import '../screens/profile/homeProfile.dart';
import '../screens/profile/izmenenieParolPage.dart';
import '../screens/profile/lichnye_dannie.dart';
import '../screens/profile/moiObyavleniePage.dart';
import '../screens/profile/nastroykaPage.dart';
import '../screens/profile/staticsPage.dart';
import '../screens/single_adv_body.dart/homeSingleAdv.dart';
import 'package:flutter/cupertino.dart';

import '../screens/chat_page/chat_list_page.dart';
import '../screens/home_page/home_page.dart';

class AutolikeRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoute.home:
        return CupertinoPageRoute(
          builder: (context) => HomePage(),
        );
      case AppRoute.login:
        return CupertinoPageRoute(
          builder: (context) => LoginPage(),
        );
      case AppRoute.code_page_route:
        return CupertinoPageRoute(
          builder: (context) => CodeVerificationScreen(
            userModel: routeSettings.arguments as UserModel,
          ),
        );
      case AppRoute.password_page_route:
        return CupertinoPageRoute(
          builder: (context) => PasswordPage(
            userModel: routeSettings.arguments as UserModel,
          ),
        );
      case AppRoute.singleAdv:
        return CupertinoPageRoute(
          builder: (context) =>
              SingleAdvPage(id: routeSettings.arguments as int),
        );

      case AppRoute.avtoPage:
        return CupertinoPageRoute(
          builder: (context) => HomeAvtoPage(),
        );

      case AppRoute.podachaObyavlenie:
        return CupertinoPageRoute(
          // builder: (context) => PodachaObyavlenie(selectedCh: 0),
          builder: (context) => PodachaInterCTPage(),
        );
      case AppRoute.likesPage:
        return CupertinoPageRoute(
          builder: (context) => HomeLikePage(),
        );
      case AppRoute.profile:
        return CupertinoPageRoute(
          builder: (context) => HomeProfilePage(),
        );
      case AppRoute.lichnyeDannye:
        return CupertinoPageRoute(
          builder: (context) => LichnyeDannye(
            umm: routeSettings.arguments as UserMeModel,
          ),
        );
      case AppRoute.nastroyka:
        return CupertinoPageRoute(
          builder: (context) => NastroykaPage(),
        );
      case AppRoute.izmenenie_parol:
        return CupertinoPageRoute(
          builder: (context) => IzmenenieParol(),
        );
      case AppRoute.bankKarty:
        return CupertinoPageRoute(
          builder: (context) => BankKartyPage(),
        );
      case AppRoute.archive:
        return CupertinoPageRoute(
          builder: (context) => ArchiveLaikovPage(),
        );
      case AppRoute.moiObyavlenie:
        return CupertinoPageRoute(
          builder: (context) => MoiObyavleniePage(),
        );
      case AppRoute.statics:
        return CupertinoPageRoute(
          builder: (context) => StaticsPage(),
        );
      case AppRoute.chatList:
        return CupertinoPageRoute(
          builder: (context) => HomeChatListPage(),
        );
      // case AppRoute.chat:
      //   return CupertinoPageRoute(
      //     builder: (context) => ChatPage(

      //     ),
      //   );
      default:
        return CupertinoPageRoute(
          builder: (context) => CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Роутинг'),
            ),
            child: Center(
              child: Text('Не найден роут для ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
