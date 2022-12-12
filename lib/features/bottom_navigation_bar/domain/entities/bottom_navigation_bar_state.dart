// ignore_for_file: constant_identifier_names

import 'package:rent_app_germany/features/add_product/view/page/add_product_page.dart';
import 'package:rent_app_germany/features/home/view/page/home_page.dart';
import 'package:rent_app_germany/features/message/view/page/message_box_page.dart';
import 'package:rent_app_germany/features/profile/view/page/profile_page.dart';
import 'package:rent_app_germany/features/search/view/page/search_page.dart';
import '../../../../core/_core_exports.dart';

enum BottomNavigationBarState { HOME, SEARCH, ADD, MESSAGE, PROFILE }

extension BottomNavigationBarStateExtension on BottomNavigationBarState {
  int stateToPageIndex() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return 0;
      case BottomNavigationBarState.SEARCH:
        return 1;
      case BottomNavigationBarState.ADD:
        return 2;
      case BottomNavigationBarState.MESSAGE:
        return 3;
      case BottomNavigationBarState.PROFILE:
        return 4;
    }
  }

  BottomNavigationBarState indexToState(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return BottomNavigationBarState.HOME;
      case 1:
        return BottomNavigationBarState.SEARCH;
      case 2:
        return BottomNavigationBarState.ADD;
      case 3:
        return BottomNavigationBarState.MESSAGE;
      case 4:
        return BottomNavigationBarState.PROFILE;
      default:
        throw IllegalPageNumberException();
    }
  }

  Color stateToActiveColor() {
    switch (this) {
      case BottomNavigationBarState.HOME:
      case BottomNavigationBarState.SEARCH:
      case BottomNavigationBarState.ADD:
      case BottomNavigationBarState.MESSAGE:
      case BottomNavigationBarState.PROFILE:
        return Colors.red;
    }
  }

  String stateToAssetPath() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return AssetsPath().homeSVG;
      case BottomNavigationBarState.SEARCH:
        return AssetsPath().searchSVG;

      case BottomNavigationBarState.ADD:
        return AssetsPath().addSVG;
      case BottomNavigationBarState.MESSAGE:
        return AssetsPath().messageSVG;
      case BottomNavigationBarState.PROFILE:
        return AssetsPath().profileSVG;
    }
  }

  Widget buildBody() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return const HomePage();
      case BottomNavigationBarState.SEARCH:
        return const SearchPage();
      case BottomNavigationBarState.ADD:
        return const AddProductPage();
      case BottomNavigationBarState.MESSAGE:
        return const MessageBoxPage();
      case BottomNavigationBarState.PROFILE:
        return const ProfilePage();
    }
  }

  PreferredSizeWidget? buildAppBar() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return AppBar();

      case BottomNavigationBarState.SEARCH:
        return AppBar();
      case BottomNavigationBarState.ADD:
        return AppBar();

      case BottomNavigationBarState.MESSAGE:
        return AppBar();

      case BottomNavigationBarState.PROFILE:
        return AppBar();
    }
  }

  Color pageBackGroundColor() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return Colors.white;
      case BottomNavigationBarState.SEARCH:
        return Colors.white;
      case BottomNavigationBarState.ADD:
        return Colors.white;
      case BottomNavigationBarState.MESSAGE:
        return Colors.white;
      case BottomNavigationBarState.PROFILE:
        return Colors.white;
    }
  }
}
