import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/favorite_products.dart';
import 'package:rent_app_germany/core/entities/get_product_model.dart';
import 'package:rent_app_germany/features/profile/repo/profile_repo.dart';

class ProfileController extends ChangeNotifier {
  ProfileRepository profileRepository;

  ProfileController({required this.profileRepository}) {
    // getFavorites();
  }

  late int addId;
  late int removeId;

  Future<void> addFavorites() async {
    try {
      await profileRepository.addFavorites(
        productFeatures: ProductFeatures(id: addId),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  List<Favorite> favoriteList = [];

  Future<void> getFavorites() async {
    try {
      final getFavorites = await profileRepository.getFavorites(
          favoriteProductsModel:
              FavoriteProductsModel(favorites: favoriteList));

      getFavorites.fold((l) => Left(l), (data) {
        favoriteList.addAll(data.favorites!);
         notifyListeners();
      });
    } catch (e) {
      print(e.toString());
    }
  }


    Future<void> removeFavorites(int index) async {
    try {
      final getFavorites = await profileRepository.removeFavorites(
          favoriteProductsModel:
              FavoriteProductsModel(favorites: favoriteList));

      getFavorites.fold((l) => Left(l), (data) {
        favoriteList.removeAt(index);
        notifyListeners();
        // addAll(data.favorites!);
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
