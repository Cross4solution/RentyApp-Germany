import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rent_app_germany/features/home/controller/home_controller.dart';
import '../../features/add_product/controller/product_controller.dart';
import '../../features/auth/controller/auth_controller.dart';
import '../../features/auth/controller/auth_controller.dart';
import '../../features/bottom_navigation_bar/view_model/bottom_navigation_bar_controller.dart';
import '../../features/message/controller/message_controller.dart';
import '../../features/profile/controller/credit_card_controller.dart';
import '../../features/profile/controller/profile_controller.dart';
import '../../features/search/controller/search_controller.dart';
import '../init/injection_container.dart';

class MainProviderList {
  /// This list includes providers that should stand up when the application starts.
  static List<SingleChildWidget> mainProviderlist = [
    ChangeNotifierProvider(create: (_) => sl<BottomNavigationBarProvider>()),
    ChangeNotifierProvider(create: (_) => sl<HomeController>()),
    ChangeNotifierProvider(create: (_) => sl<AuthController>()),
    ChangeNotifierProvider(create: (_) => sl<ProductController>()),
    ChangeNotifierProvider(create: (_) => sl<MessageController>()),
    ChangeNotifierProvider(create: (_) => sl<ProfileController>()),
    ChangeNotifierProvider(create: (_) => sl<SearchController>()),
    ChangeNotifierProvider(create: (_) => sl<CreditCardController>()),
    // ChangeNotifierProvider(create: (_) => sl<AuthController>()),
  ];

  /// This method returns the provider list that should stand up at the beginning of the application.
  static List<SingleChildWidget> getMainProviderList() {
    return mainProviderlist;
  }
}
