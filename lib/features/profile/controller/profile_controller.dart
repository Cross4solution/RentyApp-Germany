import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/favorite_products.dart';
import 'package:rent_app_germany/core/entities/get_product_model.dart';
import 'package:rent_app_germany/features/profile/repo/profile_repo.dart';

import '../../../core/entities/adress_model.dart';

class ProfileController extends ChangeNotifier {
  ProfileRepository profileRepository;

  ProfileController({required this.profileRepository}) {
    // getFavorites();
    // getAdress();
  }

  late int addFavoriteId;
  late int removeFavoriteId;
  late int removeAdressId;

  Future<void> addFavorites() async {
    try {
      await profileRepository.addFavorites(
        productFeatures: ProductFeatures(id: addFavoriteId),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  List<Favorite> favoriteList = [];

  Future<void> getFavorites() async {
    favoriteList.clear();
    try {
      final getFavorites = await profileRepository.getFavorites();

      getFavorites.fold((l) => Left(l), (data) {
        favoriteList.addAll(data.favorites!);
        favoriteList = favoriteList.reversed.toList();
        notifyListeners();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> removeFavorites(int index) async {
    try {
      final getFavorites = await profileRepository.removeFavorites();

      getFavorites.fold((l) => Left(l), (data) {
        favoriteList.removeAt(index);
        notifyListeners();
      });
    } catch (e) {
      print(e.toString());
    }
  }

  TextEditingController adressTitle = TextEditingController();
  TextEditingController adressCity = TextEditingController();
  TextEditingController adressDetail = TextEditingController();
  TextEditingController adressPostalCode = TextEditingController();

  Future<void> addAdress() async {
    final userLocation = UserLocation(
        title: adressTitle.text,
        city: adressCity.text,
        address: adressDetail.text,
        postalCode: adressPostalCode.text);
    try {
      await profileRepository.addAdress(userLocation: userLocation);
    } catch (e) {
      print(e.toString());
    }
    adressTitle.clear();
    adressCity.clear();
    adressDetail.clear();
    adressPostalCode.clear();

  }

  List<UserLocation> adressList = [];

  Future<void> getAdress() async {
    adressList.clear();
    try {
      final getAdress = await profileRepository.getAdressList();

      getAdress.fold((l) => Left(l), (data) {
        adressList.addAll(data.userLocation!);

        notifyListeners();
      });
    } catch (e) {
      print(e.toString());
    }
  }


    Future<void> removeAdress(int index) async {
    try {
      final removeAdress = await profileRepository.removeAdress();

      removeAdress.fold((l) => Left(l), (data) {
        adressList.removeAt(index);
        notifyListeners();
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
