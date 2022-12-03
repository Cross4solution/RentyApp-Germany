import 'package:flutter/material.dart';

import '../widget/search_app_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: Center(child: Text('Search Page'),),
    );
  }
}