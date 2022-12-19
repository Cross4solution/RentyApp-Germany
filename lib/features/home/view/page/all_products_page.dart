import 'package:rent_app_germany/features/home/view/widget/all_products_app_bar.dart';
import 'package:rent_app_germany/features/home/view/widget/all_products_card.dart';

import '../../../../core/_core_exports.dart';
import '../widget/recommended_card.dart';

class AllProductsPage extends StatelessWidget {
  const AllProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AllProdutcsAppBar(),
      body: AllProductsCard(),
    );
  }
}
