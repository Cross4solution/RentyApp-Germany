import 'package:rent_app_germany/features/home/controller/home_controller.dart';

import '../../features/auth/controller/register_controller.dart';
import '../../features/bottom_navigation_bar/view_model/bottom_navigation_bar_controller.dart';
import '../_core_exports.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // //! External
  // //? Shared Preferences
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);

  // //! Core
  // //? Shared Preferences
  // //* Repo
  // sl.registerLazySingleton<SharedPreferencesRepository>(
  //     () => SharedPreferencesRepositoryImpl(sl()));
  // sl.registerLazySingleton(() => AuthenticationRepoImpl());
  // //* Use Case
  // sl.registerLazySingleton(() => GetDataFromKey(sl()));
  // sl.registerLazySingleton(() => RemoveDataFromKey(sl()));
  // sl.registerLazySingleton(() => SaveDataFromKey(sl()));

  //* Features
  //? Bottom Navigation Bar
  sl.registerLazySingleton(() => BottomNavigationBarProvider());
  //? Home Page
  sl.registerLazySingleton(() => HomeController());
  sl.registerLazySingleton(() => RegisterController());
  sl.registerLazySingleton(() => LoginController());

  // //? Auth
  // sl.registerLazySingleton(
  //   () => AuthController(
  //     saveDataFromKey: sl<SaveDataFromKey>(),
  //     authenticationRepo: sl<AuthenticationRepoImpl>(),
  //   ),
  // );
}
