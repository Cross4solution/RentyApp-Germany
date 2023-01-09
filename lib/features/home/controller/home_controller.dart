import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/entities/product_category.dart';
import 'package:rent_app_germany/features/add_product/controller/product_controller.dart';
import 'package:rent_app_germany/features/home/domain/entities/get_product_arguments.dart';
import 'package:rent_app_germany/features/home/repo/home_repository.dart';

import '../../../core/entities/get_product_model.dart';

class HomeController extends ChangeNotifier {
  final HomeRepository homeRepository;

  HomeController({
    required this.homeRepository,
  });

  final GetProductArguments getProductArguments = GetProductArguments();

  ScrollController scroolController = ScrollController();

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
        minTime: DateTime.now(),
        maxTime: DateTime(2025, 1, 1), onConfirm: (date) {
      formattingBeginDate = '${date.year} / ${date.month} / ${date.day}';
      sl<ProductController>().startDate =
          '${date.year}-${date.month}-${date.day}';
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
        sl<ProductController>().endDate =
            '${date.year}-${date.month}-${date.day}';
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

  List<ProductCategoryModel> productCategories = [];

  Future<void> fetchProductTopCategory() async {
    final result = await homeRepository.getProductCategories();

    result.fold((l) => l, (data) {
      productCategories.addAll(data);
      notifyListeners();
    });
  }

  List<ProductFeatures> productFeatures = [];

  bool isLastPage = false;

  Future<void> refreshProductsPage() async {
    productFeatures.clear();
    getProductArguments.page = 3;

    isLastPage = false;

    notifyListeners();

    Future.delayed(const Duration(seconds: 1), () {
      fecthNextProductsPage();
    });
  }

  Future<void> fecthNextProductsPage() async {
    if (!isLastPage) {
      final requestFetchProducts = await homeRepository.getProducts(
       
        getProductArguments: getProductArguments,
      );

      requestFetchProducts.fold((failure) {
        failure.errorMessage;

        print('sayfa sonu');

        isLastPage = true;
      }, (data) {
        
        productFeatures.addAll(data);

        productFeatures = productFeatures.reversed.toList();

        getProductArguments.page++;

        print('çalisti');
        print(productFeatures.length);

        notifyListeners();
      });
      notifyListeners();
    }
  }

  int isDamaged = 1;

  String productDamageInfo() {
    switch (isDamaged) {
      case 1:
        return "Hasarsız";

      case 2:
        return "Az Hasarlı";

      case 3:
        return "Hasarlı";

      default:
        return "Hasarsız";
    }
  }
}
