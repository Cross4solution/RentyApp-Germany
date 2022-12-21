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

  List<Products> searchList = [];

  SearchState searchState = SearchState.empty;
  TextEditingController searchTextController = TextEditingController();

  Future<void> searchProduct() async {

    if (searchTextController.text.isEmpty) {
      _setSearchState(SearchState.empty);
    }

    if (searchTextController.text.isNotEmpty) {
      _setSearchState(SearchState.loading);

      try {
        final requestSearch = await searchRepository.searchProduct(
            searchArguments:
                SearchArguments(keyword: searchTextController.text),);

        requestSearch.fold((l) => Left(l), (data) {
          
          // searchList.addAll(data.products);
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
}

enum SearchState {
  searching,
  loading,
  loaded,
  noResult,
  error,
  empty,
}
