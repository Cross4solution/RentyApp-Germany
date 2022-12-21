import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/features/search/domain/arguments/search_arguments.dart';
import 'package:rent_app_germany/features/search/repo/search_repository.dart';

class SearchController extends ChangeNotifier {
  SearchRepository searchRepository;

  SearchController({
    required this.searchRepository,
  });
  SearchState searchState = SearchState.empty;
  TextEditingController searchTextController = TextEditingController();

  Future<void> searchProduct() async {
    if (searchTextController.text.isEmpty) {
      _setSearchState(SearchState.empty);
    }

    if (searchTextController.text.isNotEmpty) {
      _setSearchState(SearchState.loading);

      final requestSearch = searchRepository.searchProduct(
          searchArguments: SearchArguments(keyword: searchTextController.text));

          
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
