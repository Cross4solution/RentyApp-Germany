import 'package:rent_app_germany/features/auth/view/page/forgot_password_page.dart';
import 'package:rent_app_germany/features/auth/view/page/login_page.dart';
import 'package:rent_app_germany/features/auth/view/page/register_page.dart';
import 'package:rent_app_germany/features/auth/view/page/splash_page.dart';
import 'package:rent_app_germany/features/home/view/page/product_page.dart';
import 'package:rent_app_germany/features/profile/view/page/profile_page.dart';
import 'package:rent_app_germany/features/search/view/page/search_page.dart';

import '/core/init/injection_container.dart' as locator;
import 'package:provider/provider.dart';
import 'package:rent_app_germany/features/home/view/page/home_page.dart';
import 'core/_core_exports.dart';
import 'features/auth/view/page/verify_page.dart';
import 'features/bottom_navigation_bar/view/pages/bottom_navigation_page.dart';
import 'features/message/view/page/message_page.dart';
import 'features/profile/view/page/profile_edit_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await locator.init();
  runApp(
    MultiProvider(
      providers: MainProviderList.getMainProviderList(),
      child: const RentyApp(),
    ),
  );
}

class RentyApp extends StatelessWidget {
  const RentyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'renty',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      navigatorKey: GlobalContextKey.instance.globalKey,
      localizationsDelegates: const [
        AppStrings.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr', ''),
        Locale('de', ''),
      ],
      home:  LoginPage(),
    );
  }
}
