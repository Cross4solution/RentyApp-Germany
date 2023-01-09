import 'package:dartz/dartz.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/features/search/domain/arguments/search_arguments.dart';
import 'package:rent_app_germany/features/search/repo/search_repository.dart';

import '../../../core/entities/get_product_model.dart';


class SearchController extends ChangeNotifier {
  SearchRepository searchRepository;

  SearchController({
    required this.searchRepository,
  });

  List<ProductFeatures> searchList = [];

  SearchState searchState = SearchState.empty;
  TextEditingController searchTextController = TextEditingController();

  Future<void> searchProduct() async {
    searchList.clear();

    if (searchTextController.text.isEmpty) {
      _setSearchState(SearchState.empty);
    }

    if (searchTextController.text.isNotEmpty) {
      _setSearchState(SearchState.loaded);

      try {
        final requestSearch = await searchRepository.searchProduct(
          searchArguments: SearchArguments(keyword: searchTextController.text),
        );

        requestSearch.fold((l) {
          _setSearchState(SearchState.noResult);

          Left(l);
        }, (data) {
          print('arama yapıldı');
          searchList.addAll(data);
          if (searchList.isNotEmpty) {
            _setSearchState(SearchState.loaded);
          }

          notifyListeners();

          print(searchList.length);
        });
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  }

  void _setSearchState(SearchState newPageState) {
    searchState = newPageState;
    notifyListeners();
  }

  Timer? debounce;

  onSearchChanged(String query) {
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 700), () {
      query = searchTextController.text;
      searchProduct();
    });
  }
}

enum SearchState {
  loading,
  loaded,
  noResult,
  error,
  empty,
}
