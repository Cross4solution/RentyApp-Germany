import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/product_category.dart';
import 'package:rent_app_germany/features/home/repo/home_repository.dart';

import '../../../core/entities/get_product_model.dart';

class HomeController extends ChangeNotifier {
  final HomeRepository homeRepository;

  HomeController({
    required this.homeRepository,
  });

  String formattingBeginDate = "Başlangıç tarihi";
  String formattingEndDate = "Bitiş tarihi";

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  int? rangeTime;

  void datePickerBeginSettings(context) {
    DatePicker.showDatePicker(context,
        theme: const DatePickerTheme(
          containerHeight: 200,
        ),
        showTitleActions: true,
        minTime: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day),
        maxTime: DateTime(2025, 1, 1), onConfirm: (date) {
      formattingBeginDate = '${date.year} / ${date.month} / ${date.day}';
      startDate = date;
      notifyListeners();
    }, currentTime: DateTime.now(), locale: LocaleType.tr);
    notifyListeners();
  }

  void datePickerEndSettings(context) {
    DatePicker.showDatePicker(
      context,
      theme: const DatePickerTheme(
        containerHeight: 200,
      ),
      showTitleActions: true,
      minTime: DateTime(
          DateTime.now().year, DateTime.now().month, (DateTime.now().day + 1)),
      maxTime: DateTime(2025, 1, 1),
      onConfirm: (date) {
        formattingEndDate = '${date.year} / ${date.month} / ${date.day}';
        endDate = date;

        dateTimeDifference();

        notifyListeners();
      },
      currentTime: DateTime.now(),
      locale: LocaleType.tr,
    );

    notifyListeners();
  }

  void dateTimeDifference() {
    int modHours = endDate.difference(startDate).inHours;

    if ((modHours % 24) > 1) {
      rangeTime = endDate.difference(startDate).inHours ~/ 24 + 1;
    } else {
      rangeTime = modHours ~/ 24;
    }

    notifyListeners();
  }

  List<CategoryArticles> categories = [];

  Future<void> fetchCategory() async {
    final requestCategoryResult = await homeRepository.getCategories(
        categoryModel: CategoryModel(categories: categories));

    requestCategoryResult.fold((failure) => failure, (data) {
      categories = data.categories;

      notifyListeners();
    });
  }


    List<ProductFeatures> productFeatures = [];

  Future<void> fetchProducts() async {
    final requestCategoryResult = await homeRepository.getProducts(
        getProductModel: GetProductModel(products: Products(data:productFeatures ) ));

    requestCategoryResult.fold((failure) => failure, (data) {
      productFeatures = data.products.data;

      notifyListeners();
    });
  }


}
