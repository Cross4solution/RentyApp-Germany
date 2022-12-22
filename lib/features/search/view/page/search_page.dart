import 'package:flutter/material.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/shared_widgets/app_text_form_field.dart';
import 'package:rent_app_germany/core/utils/screen_size.dart';
import 'package:rent_app_germany/features/search/controller/search_controller.dart';
import 'package:rent_app_germany/features/search/view/widget/search_card.dart';
import '../widget/search_app_bar.dart';
import '../widget/search_page_states/search_page_emty_state.dart';
import '../widget/search_page_states/search_page_error_state.dart';
import '../widget/search_page_states/search_page_loaded_state.dart';
import '../widget/search_page_states/search_page_no_result_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  

@override
  void dispose() {
  final _debounce = sl<SearchController>().debounce;

  _debounce?.cancel();
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return AppContainer(
      child: Scaffold(
        appBar: const SearchAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: AppTextFormField.standart(
                    hintText: "Ara",
                    prefixIcon: const Icon(Icons.search_outlined, size: 28),
                    controller: 
                    
                    sl<SearchController>().searchTextController,
                    onChanged: (value) {
                      sl<SearchController>().onSearchChanged(value);
                      
                    },
                    
                    
                  ),
                ),
                // Consumer(
                //   builder: (context, SearchController searchController, child) {
                //     return ListView.builder(
                //       physics: const NeverScrollableScrollPhysics(),
                //       shrinkWrap: true,
                //       itemCount: searchController.searchList.length,
                //       itemBuilder: (context, index) {
                //         final searchItem = searchController.searchList[index];
                //         return  SearchCard(searchItem:searchItem,);
                //       },
                //     );
                //   },
                // )
    
                Selector<SearchController, SearchState>(
                  selector:
                      (BuildContext context, SearchController searchController) {
                    return searchController.searchState;
                  },
                  builder: (BuildContext context, SearchState pageState,
                      Widget? child) {
                    switch (pageState) {
                      case SearchState.loaded:
                        return SearchPageLoadedState();
    
                      case SearchState.error:
                        return const SearchErrorState();
    
                      case SearchState.empty:
                        return const SearchEmptyState();
    
                      case SearchState.noResult:
                        return const SearchEmptyNoResult();
    
                      case SearchState.loading:
                        return const SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
