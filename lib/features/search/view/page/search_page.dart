import 'package:flutter/material.dart';
import 'package:rent_app_germany/core/_core_exports.dart';
import 'package:rent_app_germany/core/shared_widgets/app_text_form_field.dart';
import 'package:rent_app_germany/core/utils/screen_size.dart';
import 'package:rent_app_germany/features/search/view/widget/search_card.dart';
import '../widget/search_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      appBar: const SearchAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: AppTextFormField.standart(
                  hintText: 'Ara',
                  prefixIcon: const Icon(Icons.search_outlined, size: 28),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return const SearchCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
