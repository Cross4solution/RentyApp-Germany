import 'package:dio/dio.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/data/repository/network_manager.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/dio_manager.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import 'package:rent_app_germany/features/home/controller/home_controller.dart';
import 'package:rent_app_germany/features/home/repo/impl/home_repo_impl.dart';

import '../../features/add_product/controller/product_controller.dart';
import '../../features/auth/controller/register_controller.dart';
import '../../features/auth/repo/impl/auth_repo_impl.dart';
import '../../features/bottom_navigation_bar/view_model/bottom_navigation_bar_controller.dart';
import '../../features/home/repo/home_repository.dart';
import '../../features/message/controller/message_controller.dart';
import '../_core_exports.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<Dio>(() => DioManager.getDio());
  sl.registerLazySingleton<INetworkManager>(() => NetworkManager(sl<Dio>()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  //* Repo
  sl.registerLazySingleton<SharedPreferencesRepository>(
      () => SharedPreferencesRepositoryImpl(sl()));

  //* Use Case
  sl.registerLazySingleton(() => GetDataFromKey(sl()));
  sl.registerLazySingleton(() => RemoveDataFromKey(sl()));
  sl.registerLazySingleton(() => SaveDataFromKey(sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepoImpl(),
  );
  sl.registerLazySingleton(() => BottomNavigationBarProvider());

  sl.registerLazySingleton(() => RegisterController(
      authRepository: sl<AuthRepository>(),
      saveDataFromKey: sl<SaveDataFromKey>()));
  sl.registerLazySingleton(
      () => HomeController(homeRepository: sl<HomeRepository>()));
  sl.registerLazySingleton(() => LoginController());
  sl.registerLazySingleton(() => ProductController());
  sl.registerLazySingleton(() => MessageController());
}
