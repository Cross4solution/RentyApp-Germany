import 'package:flutter/cupertino.dart';
import 'package:rent_app_germany/features/add/view/page/add_page.dart';
import 'package:rent_app_germany/features/auth/view/page/forgot_password_page.dart';
import 'package:rent_app_germany/features/auth/view/page/login_page.dart';
import 'package:rent_app_germany/features/auth/view/page/register_page.dart';
import 'package:rent_app_germany/features/bottom_navigation_bar/view/pages/bottom_navigation_page.dart';
import 'package:rent_app_germany/features/home/view/page/home_page.dart';
import 'package:rent_app_germany/features/home/view/page/product_page.dart';
import 'package:rent_app_germany/features/message/view/page/message_page.dart';
import 'package:rent_app_germany/features/profile/view/page/profile_page.dart';
import 'package:rent_app_germany/features/search/view/page/search_page.dart';

class PageRoutes {
  static const String homePage = "/homePage";
  static const String searchPage = "/searchPage";
  static const String messagePage = "/messagePage";
  static const String profilePage = "/profilePage";
  static const String productPage = "/productPage";
  static const String addPage = "/addPage";
  static const String bottomNavigationPage = "/bottomNavigationPage";
  static const String loginPage = "/loginPage";
  static const String registerPage = "/registerPage";
  static const String forgotPassword = "/forgotPassword";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PageRoutes.homePage:
      return CupertinoPageRoute(builder: (_) => const HomePage());

    case PageRoutes.searchPage:
      return CupertinoPageRoute(builder: (_) => const SearchPage());
    case PageRoutes.messagePage:
      return CupertinoPageRoute(builder: (_) => const MessagePage());
    case PageRoutes.profilePage:
      return CupertinoPageRoute(builder: (_) => const ProfilePage());
    case PageRoutes.productPage:
      return CupertinoPageRoute(builder: (_) => const ProductPage());

    case PageRoutes.bottomNavigationPage:
      return CupertinoPageRoute(builder: (_) => const BottomNavigationPage());
    case PageRoutes.addPage:
      return CupertinoPageRoute(builder: (_) => const AddPage());
    case PageRoutes.loginPage:
      return CupertinoPageRoute(builder: (_) => const LoginPage());

    case PageRoutes.registerPage:
      return CupertinoPageRoute(builder: (_) => RegisterPage());
    case PageRoutes.forgotPassword:
      return CupertinoPageRoute(builder: (_) => const ForgotPasswordPage());

    default:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
  }
}
