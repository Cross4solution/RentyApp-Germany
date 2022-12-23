import 'package:flutter/cupertino.dart';
import 'package:rent_app_germany/core/shared_widgets/full_photo_widget.dart';
import 'package:rent_app_germany/features/add_product/view/page/add_product_page.dart';
import 'package:rent_app_germany/features/auth/view/page/forgot_password_page.dart';
import 'package:rent_app_germany/features/auth/view/page/login_page.dart';
import 'package:rent_app_germany/features/auth/view/page/register_page.dart';
import 'package:rent_app_germany/features/auth/view/page/verify_page.dart';
import 'package:rent_app_germany/features/bottom_navigation_bar/view/pages/bottom_navigation_page.dart';
import 'package:rent_app_germany/features/home/view/page/home_page.dart';
import 'package:rent_app_germany/features/home/view/page/product_page.dart';
import 'package:rent_app_germany/features/message/view/page/chat_page.dart';
import 'package:rent_app_germany/features/message/view/page/message_box_page.dart';
import 'package:rent_app_germany/features/profile/view/page/profile_page.dart';
import 'package:rent_app_germany/features/search/view/page/search_page.dart';

import '../../../features/home/view/page/all_products_page.dart';
import '../../../features/profile/view/page/adress_page.dart';
import '../../../features/profile/view/page/profile_edit_page.dart';
import '../../../features/profile/view/widget/adress_add_page.dart';
import '../../entities/get_product_model.dart';

class PageRoutes {
  static const String homePage = "/homePage";
  static const String searchPage = "/searchPage";
  static const String messageBoxPage = "/messageBoxPage";
  static const String profilePage = "/profilePage";
  static const String productPage = "/productPage";
  static const String addProductPage = "/addProductPage";
  static const String bottomNavigationPage = "/bottomNavigationPage";
  static const String loginPage = "/loginPage";
  static const String registerPage = "/registerPage";
  static const String forgotPassword = "/forgotPassword";
  static const String profileEditPage = "/profileEditPage";
  static const String verifyPage = "/verifyPage";
  static const String chatPage = "/chatPage";
  static const String allProductsPage = "/allProductsPage";
  static const String fullPhotoWidget = "/fullPhotoWidget";
  static const String adressAddPage = "/adressAddPage";
  static const String adressPage = "/adressPage";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PageRoutes.homePage:
      return CupertinoPageRoute(builder: (_) => const HomePage());

    case PageRoutes.searchPage:
      return CupertinoPageRoute(builder: (_) => const SearchPage());
    case PageRoutes.messageBoxPage:
      return CupertinoPageRoute(builder: (_) => const MessageBoxPage());
    case PageRoutes.profilePage:
      return CupertinoPageRoute(builder: (_) => const ProfilePage());
    case PageRoutes.productPage:
      final ProductFeatures productFeatures =
          settings.arguments as ProductFeatures;
      return CupertinoPageRoute(
          builder: (_) => ProductPage(
                productFeatures: productFeatures,
              ));

    case PageRoutes.bottomNavigationPage:
      return CupertinoPageRoute(builder: (_) => const BottomNavigationPage());
    case PageRoutes.addProductPage:
      return CupertinoPageRoute(builder: (_) => const AddProductPage());
    case PageRoutes.loginPage:
      return CupertinoPageRoute(builder: (_) => const LoginPage());

    case PageRoutes.registerPage:
      return CupertinoPageRoute(builder: (_) => RegisterPage());
    case PageRoutes.verifyPage:
      return CupertinoPageRoute(builder: (_) => const VerifyPage());
    case PageRoutes.forgotPassword:
      return CupertinoPageRoute(builder: (_) => const ForgotPasswordPage());
    case PageRoutes.profileEditPage:
      return CupertinoPageRoute(builder: (_) => const ProfileEditPage());

    case PageRoutes.chatPage:
      return CupertinoPageRoute(builder: (_) => const ChatPage());
    case PageRoutes.allProductsPage:
      return CupertinoPageRoute(builder: (_) => const AllProductsPage());

    case PageRoutes.fullPhotoWidget:
      final ProductFeatures productFeatures =
          settings.arguments as ProductFeatures;
      return CupertinoPageRoute(
          builder: (_) => FullPhotoWidget(
                productFeatures: productFeatures,
              ));
    case PageRoutes.adressAddPage:
      return CupertinoPageRoute(builder: (_) => const AdressAddPage());
    case PageRoutes.adressPage:
      return CupertinoPageRoute(builder: (_) => const AdressPage());
    default:
      return CupertinoPageRoute(builder: (_) => const LoginPage());
  }
}
