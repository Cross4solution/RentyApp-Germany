import 'package:flutter/material.dart';

import '../widget/add_app_bar.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddAppBar(),
      body: Center(
        child: Text('Add Page'),
      ),
    );
  }
}
