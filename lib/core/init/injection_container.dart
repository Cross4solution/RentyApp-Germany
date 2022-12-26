import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/data/repository/network_manager.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/dio_manager.dart';
import 'package:rent_app_germany/core/utils/remote_data_source/domain/repository/i_network_manager.dart';
import 'package:rent_app_germany/features/home/controller/home_controller.dart';
import 'package:rent_app_germany/features/home/repo/impl/home_repo_impl.dart';
import 'package:rent_app_germany/features/profile/repo/impl/profile_repo_impl.dart';
import 'package:rent_app_germany/features/profile/repo/profile_repo.dart';
import 'package:rent_app_germany/features/search/repo/impl/search_repo_impl.dart';
import 'package:rent_app_germany/features/search/repo/search_repository.dart';

import '../../features/add_product/controller/product_controller.dart';
import '../../features/add_product/repo/impl/product_repo_impl.dart';
import '../../features/add_product/repo/product_repo.dart';
import '../../features/auth/controller/auth_controller.dart';
import '../../features/auth/repo/impl/auth_repo_impl.dart';
import '../../features/bottom_navigation_bar/view_model/bottom_navigation_bar_controller.dart';
import '../../features/home/repo/home_repository.dart';
import '../../features/message/controller/message_controller.dart';
import '../../features/profile/controller/credit_card_controller.dart';
import '../../features/profile/controller/profile_controller.dart';
import '../../features/search/controller/search_controller.dart';
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

  sl.registerSingletonAsync<UserModel>(() async {
    final getDataFormKey = sl<GetDataFromKey>();

    final data = await getDataFormKey(
      SharedPreferenceKeyParams(
        key: SharedPreferencesKeys.CACHE_USER_INFO,
      ),
    );

    return data.fold((l) => UserModel(), (jsonData) {
      return UserModel.fromJson(jsonData);
    });
  });

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepoImpl(),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepoImpl(),
  );

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepoImpl(),
  );
  sl.registerLazySingleton(() => BottomNavigationBarProvider());
  sl.registerLazySingleton(
      () => CreditCardController(profileRepository: sl<ProfileRepository>()));

  sl.registerLazySingleton(() => AuthController(
      authRepository: sl<AuthRepository>(),
      saveDataFromKey: sl<SaveDataFromKey>()));

  sl.registerLazySingleton(
      () => HomeController(homeRepository: sl<HomeRepository>()));
  sl.registerLazySingleton(
      () => SearchController(searchRepository: sl<SearchRepository>()));

  sl.registerLazySingleton(
      () => ProfileController(profileRepository: sl<ProfileRepository>()));

  sl.registerLazySingleton(
      () => ProductController(productRepository: sl<ProductRepository>()));
  sl.registerLazySingleton(() => MessageController());
}
